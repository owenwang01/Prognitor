//
//  HTAppStoreVerify.m
//  GuessNums
//
//  Created by 张强 on 2023/6/16.
//

#import "HTAppStoreVerify.h"
#import "HTNetworkManager.h"
#import <StoreKit/StoreKit.h>
#import "HTSubscribeConvert.h"
#import "NSString+Extension.h"
#import "RACSignal.h"
#import "RACSubject.h"

@implementation HTAppStoreVerify

+ (HTAppStoreVerify *)sharedInstance{
    static HTAppStoreVerify *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HTAppStoreVerify alloc] init];
    });
    return manager;
}

- (void)ht_verifyTransactionWithIndex:(NSInteger)index{
    NSURL *recepitURL = [[NSBundle mainBundle] appStoreReceiptURL];
    NSData *receipt = [NSData dataWithContentsOfURL:recepitURL];
    if (!receipt){
        return;
    }
    NSDictionary *params = @{
        AsciiString(@"receipt-data"): [receipt base64EncodedStringWithOptions:0],
        AsciiString(@"password"): IAP_ShareKey
    };
    NSString *serverString = @[IAP_AppStore, IAP_SANDBOX][index];
    [self.subscribeVerifySignal sendNext:nil];
    [[HTNetworkManager shareInstance] post:serverString body:params result:^(id result) {
        // 先验证正式服务器,如果正式服务器返回21007再去苹果沙盒服务器验证,沙盒环境苹果用的是沙盒服务器
        NSString *status = [NSString stringWithFormat:@"%@",result[AsciiString(@"status")]];
        if (status && [status isEqualToString:AsciiString(@"21007")]) {
            //提审时使用
            [self ht_verifyTransactionWithIndex:0];
        }else if(status && [status isEqualToString:@"0"]){
            //服务器凭证校验成功，完结交易
            [self ht_finishAllTransaction];
            //订阅取latest_receipt_info
            NSArray *receipts = [result objectForKey:AsciiString(@"latest_receipt_info")];
            [self ht_handleBuySuccessWithReceiptData:receipts];
            [self.subscribeFinishedSignal sendNext:nil];
            [NSNotificationCenter.defaultCenter postNotificationName:NTFCTString_FinishSubscribeNotification object:self userInfo:nil];
            //埋点
            [HTSubscribeConvert lgjeropj_maidian:4];
        } else {
            [self.subscribeFailSignal sendNext:nil];
        }
    }];
}

- (void)ht_finishAllTransaction{
    NSArray* transactions = [SKPaymentQueue defaultQueue].transactions;
    if (transactions.count > 0) {
        for (SKPaymentTransaction* transaction in transactions){
            if (transaction.transactionState == SKPaymentTransactionStatePurchased) {
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
            }
        }
    }
}

- (void)ht_handleBuySuccessWithReceiptData:(NSArray *)array{
    if (array){
        if (array && array.count > 0){
            //NSDictionary *lastTransaction = [array valueForKeyPath:@"@max.expires_date_ms"];
            array = [array sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *obj1, NSDictionary *obj2) {
                NSString *str1 = kFormat(obj1[AsciiString(@"expires_date_ms")]).ht_isEmptyStr;
                NSString *str2 = kFormat(obj2[AsciiString(@"expires_date_ms")]).ht_isEmptyStr;
                return [str2 compare:str1];
            }];//还是做排序，保证无论inapp和latest_receipt_info都能获取到最新的详细交易信息
            NSDictionary *lastTransaction = array.firstObject;
            if (lastTransaction){
                //记录用户最近购买的产品以及过期时间，用于判断用户是否完成了订阅
                [HTSubscribeConvert ht_isPurchaseWithTransaction:lastTransaction];
            }
        }
    }
}

- (RACSubject *)subscribeVerifySignal {
    if (!_subscribeVerifySignal) {
        _subscribeVerifySignal = [RACSubject subject];
    }
    return _subscribeVerifySignal;
}

- (RACSubject *)subscribeFinishedSignal {
    if (!_subscribeFinishedSignal) {
        _subscribeFinishedSignal = [RACSubject subject];
    }
    return _subscribeFinishedSignal;
}

- (RACSubject *)subscribeFailSignal {
    if (!_subscribeFailSignal) {
        _subscribeFailSignal = [RACSubject subject];
    }
    return _subscribeFailSignal;
}

@end
