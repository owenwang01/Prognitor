//
//  HTSubscribeManager.m
// 
//
//  Created by Apple on 2022/11/21.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTSubscribeManager.h"
#import "HTAppStoreVerify.h"
#import <StoreKit/StoreKit.h>
#import "RACSubject.h"
#import "ZKBaseTipTool.h"
#import "HTSubscribeConvert.h"
#import "HTCommonConfiguration.h"
#import "HTSubscribeUtils.h"
#import "NSString+Extension.h"
#import <MJExtension/MJExtension.h>
#import "HTNetworkManager.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "UIViewController+Navigation.h"
#import "HTToolKitManager.h"

@interface HTSubscribeManager ()<SKProductsRequestDelegate, SKPaymentTransactionObserver>

@property (nonatomic, strong) SKProductsRequest *productRequest;
@property (nonatomic, assign) BOOL var_verifyflag;//购买/Restore
@end

@implementation HTSubscribeManager

+ (HTSubscribeManager *)sharedInstance{
    static HTSubscribeManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HTSubscribeManager alloc] init];
        [manager addObserver];
    });
    return manager;
}

-(void)addObserver{
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
}

#pragma mark - 请求服务器产品模块
- (void)ht_requestProduct:(NSArray *)productIds{
    if (![SKPaymentQueue canMakePayments]) {
        return;
    }
    //获取productid的set(集合中)
    NSSet *set = [NSSet setWithArray:productIds];
    //向苹果发送请求,请求可卖商品
    _productRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:set];
    _productRequest.delegate = self;
    [_productRequest start];
}

- (void)productsRequest:(nonnull SKProductsRequest *)request didReceiveResponse:(nonnull SKProductsResponse *)response {
    NSArray *array = response.products;
    if(array && array.count > 0){
        array = [array sortedArrayUsingComparator:^NSComparisonResult(SKProduct *obj1, SKProduct *obj2) {
            if (obj1.introductoryPrice) {
                return NSOrderedAscending;
            }
            return [obj2.price compare:obj1.price];
        }];
        self.productList = array;
    }
    [self.requestProductDownSignal sendNext:array];
}

#pragma mark - 购买操作
- (void)ht_byProduct:(SKProduct *)product{
    if (![SKPaymentQueue canMakePayments]) {
        //您的手机没有打开程序内付费购买
        [ZKBaseTipTool ht_hideDotLoadingTip];
        [ZKBaseTipTool showMessage:AsciiString(@"In-app purchase permission not granted")];
        return;
    }
    if(!product){
        [ZKBaseTipTool ht_hideDotLoadingTip];
        [ZKBaseTipTool showMessage:AsciiString(@"No Product")];
        return;
    }
    
    self.var_verifyflag = YES;
    // 1.创建票据
    SKPayment *payment = [SKPayment paymentWithProduct:product];
    // 2.将票据加入到交易队列中
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

#pragma mark - SKPaymentTransactionObserver
- (void)paymentQueue:(nonnull SKPaymentQueue *)queue updatedTransactions:(nonnull NSArray *)transactions {
    
    if (transactions.count > 1) {
        NSArray *sortedArray = [transactions sortedArrayUsingComparator:^(id obj1, id obj2) {
            SKPaymentTransaction *tran1 = obj1;
            SKPaymentTransaction *tran2 = obj2;
            if ([tran2.transactionDate timeIntervalSinceDate:tran1.transactionDate] >= 0) {
                return NSOrderedAscending;
            } else {
                return NSOrderedDescending;
            }
        }];
        [self lgjeropj_updatedTransaction:sortedArray.lastObject];
    } else if (transactions.count == 1) {
        [self lgjeropj_updatedTransaction:transactions.firstObject];
    } else {
        [self.subscribeFailSignal sendNext:LocalString(@"Failed", nil)];
    }
}

- (void)lgjeropj_updatedTransaction:(SKPaymentTransaction *)transaction {
    
    switch (transaction.transactionState) {
        case SKPaymentTransactionStatePurchasing:
            break;
        case SKPaymentTransactionStatePurchased:
        {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"udf_isIAPDiscount"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
            [self ht_buySuccessWithTransaction:transaction];
            if (self.var_verifyflag) {
                [HTSubscribeConvert lgjeropj_maidian:3];
            }
        }
            break;
        case SKPaymentTransactionStateFailed:
        {
            [self.subscribeFailSignal sendNext:LocalString(@"Failed", nil)];
            [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
        }
            break;
        case SKPaymentTransactionStateRestored:
        {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"udf_isIAPDiscount"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
            [self ht_buySuccessWithTransaction:transaction];
        }
            break;
        default:
        {
            [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
        }
            break;
    }
}

// 购买成功
- (void)ht_buySuccessWithTransaction:(SKPaymentTransaction *)transaction {
    
    if (!HTCommonConfiguration.lgjeropj_shared.BLOCK_switchStateBlock()) {
        if ([HTSubscribeConvert ht_originalWithTransaction:transaction]) {
            [[HTAppStoreVerify sharedInstance] ht_verifyTransactionWithIndex:1];
        }
    } else {
        if (![HTAccountModel sharedInstance].var_isLogin) {
            if ([HTSubscribeConvert ht_originalWithTransaction:transaction]) {
                [self lgjeropj_iapVerifyWithReceipt:transaction andflag:self.var_verifyflag];
            }
        } else {
            [self lgjeropj_iapVerifyWithReceipt:transaction andflag:self.var_verifyflag];
        }
    }
}

//bflag:yes绑定|no验证;
- (void)lgjeropj_iapVerifyWithReceipt:(SKPaymentTransaction *)var_transaction andflag:(BOOL)var_bflag {
    NSMutableDictionary *var_params = [NSMutableDictionary dictionary];
    NSString *var_receiptString = @"";
    NSString *var_productId = @"";
    NSString *var_url = var_bflag?STATIC_kAppUpgradeap:STATIC_kAppVipap;
    if (var_bflag) {
        [var_params setValue:@"1" forKey:AsciiString(@"flag")];
        NSURL *var_receiptUrl = [[NSBundle mainBundle] appStoreReceiptURL];
        NSData *var_receiptData = [NSData dataWithContentsOfURL:var_receiptUrl];
        var_receiptString = [var_receiptData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
        var_productId = var_transaction.payment.productIdentifier;
    } else {
        [var_params setValue:@"0" forKey:AsciiString(@"flag")];
        if (var_transaction) {
            NSURL *var_receiptUrl = [[NSBundle mainBundle] appStoreReceiptURL];
            NSData *var_receiptData = [NSData dataWithContentsOfURL:var_receiptUrl];
            var_receiptString = [var_receiptData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
            var_productId = var_transaction.payment.productIdentifier;
        } else {
            NSString *var_localData = [[NSUserDefaults standardUserDefaults] objectForKey:STATIC_kIsFinishSubscribe];
            if(![NSString ht_isEmpty:var_localData]){
                NSDictionary *localDataObj = [var_localData mj_JSONObject];
                var_receiptString = kFormat(localDataObj[kSubscribeProductReceiptKey]).ht_isEmptyStr;
                var_productId = kFormat(localDataObj[kSubscribeProductIdKey]).ht_isEmptyStr;
            } else if ([HTAccountModel sharedInstance].var_isLogin) {
                var_productId = [HTAccountModel sharedInstance].var_pid;
            }
        }
    }
    if ([var_receiptString isEqualToString:@""] && var_bflag) {
        [ZKBaseTipTool hideAllLoadingTip];
        [HTSubscribeUtils ht_continueCheckAndSubscribe];
        return;
    }
    
    if ([HTAccountModel sharedInstance].var_isLogin) {
        [var_params setValue:[NSString ht_isEmpty:[HTAccountModel sharedInstance].uid andReplaceStr:@"0"] forKey:AsciiString(@"uid")];//没有就传0
    } else {
        [var_params setValue:@"0" forKey:AsciiString(@"uid")];//未登录传0
    }
    [var_params setObject:kFormat([HTAccountModel sharedInstance].var_fid).ht_isEmptyStr forKey:AsciiString(@"fid")];

    
    [var_params setValue:var_receiptString forKey:AsciiString(@"receipt")];
    [var_params setValue:var_productId forKey:AsciiString(@"pid")];
    
    BOOL var_local = [HTAccountModel sharedInstance].ht_isLocalVip;
    [var_params setValue:var_local?@"1":@"0" forKey:AsciiString(@"vp")];
    
    [self.subscribeVerifySignal sendNext:nil];
    @weakify(self);
    [[HTNetworkManager shareInstance] post:kNetworkFormat(var_url) param:var_params result:^(id result) {
        @strongify(self);
        [ZKBaseTipTool hideAllLoadingTip];
        NSDictionary *var_dataDict = [result objectForKey:@"data"];
        if ([[result objectForKey:@"status"] integerValue] == 200 && var_dataDict.count > 0){
            if ([[var_params objectForKey:AsciiString(@"flag")] isEqualToString:@"1"]) {
                [HTCommonConfiguration lgjeropj_shared].BLOCK_subscribeEventBlock();
            }

            NSDictionary *var_localDic = [var_dataDict objectForKey:AsciiString(@"local")];
            if (var_localDic.count > 0) {
                NSMutableDictionary *var_lastTransaction = [NSMutableDictionary dictionary];
                NSString *var_localData = [[NSUserDefaults standardUserDefaults] objectForKey:STATIC_kIsFinishSubscribe];
                if(![NSString ht_isEmpty:var_localData]){
                    NSDictionary *localDataObj = [var_localData mj_JSONObject];
                    [var_lastTransaction addEntriesFromDictionary:localDataObj];
                }
                if (var_bflag) {
                    [var_lastTransaction setObject:[var_localDic objectForKey:AsciiString(@"k7")] forKey:kSubscribeBuyDateKey];
                    [var_lastTransaction setObject:[var_localDic objectForKey:AsciiString(@"k6")] forKey:kSubscribeExpireDateKey];
                    [var_lastTransaction setObject:var_transaction.payment.productIdentifier forKey:kSubscribeProductIdKey];
                } else if (var_productId.length > 0) {
                    [var_lastTransaction setObject:[var_localDic objectForKey:AsciiString(@"k7")] forKey:kSubscribeBuyDateKey];
                    [var_lastTransaction setObject:[var_localDic objectForKey:AsciiString(@"k6")] forKey:kSubscribeExpireDateKey];
                    [var_lastTransaction setObject:var_productId forKey:kSubscribeProductIdKey];
                }
                [var_lastTransaction setObject:(var_localDic[kSubscribeRenewStatusKey] != nil?[NSString stringWithFormat:@"%@", var_localDic[kSubscribeRenewStatusKey]]:@"0") forKey:kSubscribeRenewStatusKey];
                [var_lastTransaction setObject:([var_localDic objectForKey:AsciiString(@"value")] != nil?[NSString stringWithFormat:@"%@", [var_localDic objectForKey:AsciiString(@"value")]]:@"0") forKey:kSubscribeProductStatusKey];
                if (var_lastTransaction.count != 2) {
                    [HTSubscribeConvert ht_isPurchaseWithTransaction:var_lastTransaction];
                }
            }
            NSDictionary *var_severDic = [var_dataDict objectForKey:AsciiString(@"server")];
            if (var_severDic.count > 0) {
                HTAccountModel *var_result = [HTAccountModel sharedInstance];
                if ([[HTAccountModel sharedInstance] var_isLogin]) {
                    if ([[var_severDic objectForKey:@"logout"] integerValue] == 1) {
                        [[HTAccountModel sharedInstance] clearUserInfo];
                        [self lgjeropj_iapVerifyWithReceipt:nil andflag:NO];
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"NTFCTString_UpdateUserDisplayInformation" object:nil];
                    } else {
                        var_result.var_toolVip = [[var_severDic objectForKey:AsciiString(@"t1")] integerValue] == 2;
                        var_result.var_bindPlanState = [var_severDic objectForKey:@"val2"] != nil?[NSString stringWithFormat:@"%@", [var_severDic objectForKey:@"val2"]]:@"0";
                        var_result.var_bindStartTime = [var_severDic objectForKey:AsciiString(@"k7")] != nil ? [NSString stringWithFormat:@"%@", [var_severDic objectForKey:AsciiString(@"k7")]]:@"0";
                        var_result.var_bindEndTime = [var_severDic objectForKey:AsciiString(@"k6")] != nil ?[NSString stringWithFormat:@"%@", [var_severDic objectForKey:AsciiString(@"k6")]]:@"0";
                        var_result.var_bindPid = [var_severDic objectForKey:AsciiString(@"pid")] != nil?[NSString stringWithFormat:@"%@", [var_severDic objectForKey:AsciiString(@"pid")]]:@"0";
                        var_result.var_bindRenewStatus = [NSString stringWithFormat:@"%@", [var_severDic objectForKey:AsciiString(@"auto_renew_status")]];
                        var_result.var_bindAppId = [var_severDic objectForKey:@"app_id"] != nil?[NSString stringWithFormat:@"%@", [var_severDic objectForKey:@"app_id"]]:@"0";
                        var_result.var_bindAppName = [var_severDic objectForKey:@"app_name"] != nil?[NSString stringWithFormat:@"%@", [var_severDic objectForKey:@"app_name"]]:@"";
                        var_result.var_bindAppOs = [var_severDic objectForKey:@"app_os"] != nil?[NSString stringWithFormat:@"%@", [var_severDic objectForKey:@"app_os"]]:@"";
                        var_result.var_bindMail = [var_severDic objectForKey:AsciiString(@"mail")] != nil?[NSString stringWithFormat:@"%@", [var_severDic objectForKey:AsciiString(@"mail")]]:@"";
                        var_result.var_bindShelf = [var_severDic objectForKey:@"shelf"] != nil?[NSString stringWithFormat:@"%@", [var_severDic objectForKey:@"shelf"]]:@"0";
                        var_result.var_bindUbt = [var_severDic objectForKey:@"ubt"] != nil?[NSString stringWithFormat:@"%@", [var_severDic objectForKey:@"ubt"]]:@"0";
                        
                        NSDictionary *var_familyDic = [var_dataDict objectForKey:AsciiString(@"family")];
                        if (var_familyDic.count > 0) {
                            var_result.var_familyPlanState = [var_familyDic objectForKey:AsciiString(@"val")] != nil ? [NSString stringWithFormat:@"%@", [var_familyDic objectForKey:AsciiString(@"val")]]:@"0";
                            var_result.var_identity = [var_familyDic objectForKey:AsciiString(@"master")] != nil?[NSString stringWithFormat:@"%@", [var_familyDic objectForKey:AsciiString(@"master")]]:@"";
                            var_result.var_fid = [var_familyDic objectForKey:AsciiString(@"fid")] != nil?[NSString stringWithFormat:@"%@", [var_familyDic objectForKey:AsciiString(@"fid")]]:@"";
                            var_result.var_pid = [var_familyDic objectForKey:AsciiString(@"pid")] != nil?[NSString stringWithFormat:@"%@", [var_familyDic objectForKey:AsciiString(@"pid")]]:@"";
                            var_result.var_renewStatus = [var_familyDic objectForKey:AsciiString(@"auto_renew_status")] != nil?[NSString stringWithFormat:@"%@", [var_familyDic objectForKey:AsciiString(@"auto_renew_status")]]:@"";
                            var_result.var_vipStartTime = [var_familyDic objectForKey:AsciiString(@"k7")] != nil?[NSString stringWithFormat:@"%@", [var_familyDic objectForKey:AsciiString(@"k7")]]:@"";
                            var_result.var_vipEndTime = [var_familyDic objectForKey:AsciiString(@"k6")] != nil?[NSString stringWithFormat:@"%@", [var_familyDic objectForKey:AsciiString(@"k6")]]:@"";
                        }
                        [[HTAccountModel sharedInstance] ht_setUserInfo:var_result.mj_keyValues];
                    }
                }
            }
            
            NSDictionary *var_deviceDic = [var_dataDict objectForKey:AsciiString(@"device")];
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"udf_isDeviceVip"];
            if (var_deviceDic.count > 0) {
                if ([[var_deviceDic objectForKey:AsciiString(@"val")] integerValue] == 1) {
                    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"udf_isDeviceVip"];
                    [[NSUserDefaults standardUserDefaults] setInteger:[[var_deviceDic objectForKey:AsciiString(@"k7")] integerValue] forKey:@"udf_devicStartTime"];
                    [[NSUserDefaults standardUserDefaults] setInteger:[[var_deviceDic objectForKey:AsciiString(@"k6")] integerValue] forKey:@"udf_deviceEndTime"];
                    [[NSUserDefaults standardUserDefaults] setObject:[var_deviceDic objectForKey:AsciiString(@"pid")] forKey:@"udf_devicePid"];
                } else {
                    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"udf_isDeviceVip"];
                }
                NSInteger var_f1 = [[var_deviceDic objectForKey:AsciiString(@"f1")] integerValue] == 1;
                if (var_f1 > 0) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"NTFCTString_RemindAddFamilyMember" object:nil];
                }
                [[NSUserDefaults standardUserDefaults] synchronize];
            }
            // 检查是否需要登录
            [self ht_checkLogin];
            [self.subscribeFinishedSignal sendNext:nil];
            [NSNotificationCenter.defaultCenter postNotificationName:NTFCTString_FinishSubscribeNotification object:self userInfo:nil];
            [HTSubscribeUtils ht_continueCheckAndSubscribe];
            //埋点
            [HTSubscribeConvert lgjeropj_maidian:4];
        } else {
            [self.subscribeFailSignal sendNext:nil];
            [HTSubscribeUtils ht_continueCheckAndSubscribe];
        }
    }];
}

// 检查是否需要登录
- (void)ht_checkLogin {
    
    if ([[HTAccountModel sharedInstance] var_isLogin]) {
        return;
    }
    if ([[HTAccountModel sharedInstance] ht_isLocalVip]) {
        return;
    }
    if (![[HTAccountModel sharedInstance] ht_isDeviceVip]) {
        return;
    }
    
    Class var_viewControllerClass = [[UIViewController lgjeropj_currentViewController] class];
    NSString *var_viewControllerName = NSStringFromClass(var_viewControllerClass);
    if ([var_viewControllerName isEqualToString:@"HTWebViewController"]) {
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HTCommonConfiguration lgjeropj_shared].BLOCK_checkLoginBlock();
    });
}

// 恢复购买
- (void)ht_reStore{
    self.var_verifyflag = NO;

    //埋点
    [HTSubscribeConvert lgjeropj_maidian:2];
    
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

- (void)paymentQueue:(SKPaymentQueue *)queue restoreCompletedTransactionsFailedWithError:(NSError *)error {
    // 恢复失败
    if (HTCommonConfiguration.lgjeropj_shared.BLOCK_switchStateBlock() && [HTAccountModel sharedInstance].var_isLogin) {
        [self lgjeropj_iapVerifyWithReceipt:nil andflag:NO];
    } else {
        [self.subscribeFailSignal sendNext:AsciiString(@"Operation failed, please try again later")];
    }
}

- (void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue {
    
    NSURL *recepitURL = [[NSBundle mainBundle] appStoreReceiptURL];
    NSData *receipt = [NSData dataWithContentsOfURL:recepitURL];
    if (!receipt && ![HTAccountModel sharedInstance].var_isLogin) {
        //未发现有有效的购买记录
        [self.subscribeFailSignal sendNext:AsciiString(@"No valid purchase record was obtained")];
    } else if (receipt || [HTAccountModel sharedInstance].var_isLogin) {
        [self lgjeropj_iapVerifyWithReceipt:nil andflag:NO];
    }
}

- (RACSubject *)requestProductDownSignal {
    if (!_requestProductDownSignal) {
        _requestProductDownSignal = [RACSubject subject];
    }
    return _requestProductDownSignal;
}

- (RACSubject *)subscribeFinishedSignal {
    if (!_subscribeFinishedSignal) {
        _subscribeFinishedSignal = [RACSubject subject];
    }
    return _subscribeFinishedSignal;
}

- (RACSubject *)subscribeVerifySignal {
    if (!_subscribeVerifySignal) {
        _subscribeVerifySignal = [RACSubject subject];
    }
    return _subscribeVerifySignal;
}

- (RACSubject *)subscribeFailSignal {
    if (!_subscribeFailSignal) {
        _subscribeFailSignal = [RACSubject subject];
    }
    return _subscribeFailSignal;
}

@end
