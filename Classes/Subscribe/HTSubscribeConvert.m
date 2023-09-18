//
//  HTSubscribeConvert.m
// 
//
//  Created by Apple on 2022/11/21.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTSubscribeConvert.h"
#import <StoreKit/StoreKit.h>
#import "HTSubscribeManager.h"
#import "HTAccountModel.h"
#import "NSString+Extension.h"
#import "HTCommonUtils.h"
#import <MJExtension/MJExtension.h>
#import "HTPointEventManager.h"

@implementation HTSubscribeConvert

+ (BOOL)ht_subscribeIsExpire {
    
    if ([[HTAccountModel sharedInstance] ht_isServerVip] || [[HTAccountModel sharedInstance] ht_isLocalVip] || [[HTAccountModel sharedInstance] ht_isFamilyVip] || [[HTAccountModel sharedInstance] ht_isDeviceVip]) {
        return NO;
    }
    return YES;
}

+ (BOOL)ht_originalWithTransaction:(SKPaymentTransaction *)var_transaction {
    NSString *origID = var_transaction.originalTransaction.transactionIdentifier;
    NSString *tranID = var_transaction.transactionIdentifier;
    if (!origID && tranID) {
        origID = tranID;
    }
    if (!origID && !tranID) {
        return NO;
    }
    NSURL *recepitURL = [[NSBundle mainBundle] appStoreReceiptURL];
    NSData *receipt = [NSData dataWithContentsOfURL:recepitURL];
    if (!receipt){
        return NO;
    }
    return YES;
}

+ (BOOL)lgjeropj_checkrReceiptInfo {
    NSURL *var_recepitURL = [[NSBundle mainBundle] appStoreReceiptURL];
    NSData *var_receipt = [NSData dataWithContentsOfURL:var_recepitURL];
    if (!var_receipt){
        return NO;
    }
    return YES;
}

+ (SKProduct *)ht_getProductWithId:(NSString *)var_productId {
    NSArray *var_array = [HTSubscribeManager sharedInstance].productList;
    SKProduct *var_result = nil;
    for (SKProduct *var_product in var_array) {
        if([var_product.productIdentifier isEqualToString:var_productId]){
            var_result = var_product;
            break;
        }
    }
    return var_result;
}

+ (NSString *)ht_getSubscriptiopPeriodWithUnit:(NSInteger)var_unit andNumberOfUnits:(NSInteger)var_numberOfUnits{
    NSString *var_result = @"";
    switch (var_unit) {
        case SKProductPeriodUnitWeek:{
            var_result = LocalString(@"Weekly", nil);
        }break;
        case SKProductPeriodUnitMonth:{
            var_result = LocalString(@"Monthly", nil);
        }break;
        case SKProductPeriodUnitYear:{
            var_result = LocalString(@"Yearly", nil);
        }break;
        case SKProductPeriodUnitDay:{
            if(var_numberOfUnits == 7){
                var_result = LocalString(@"Weekly", nil);
            }else{
                var_result = LocalString(@"Day", nil);
            }
        }break;
        default:
            break;
    }
    return var_result;
}

+ (NSString *)lgjeropj_getLocalSubscripTitleWithCount:(NSInteger)var_count
{
    if(var_count < 30 && var_count > 0) {
        return LocalString(@"Weekly", nil);
    } else if(var_count == 30) {
        return LocalString(@"Monthly", nil);
    } else if (var_count >= 360) {
        return LocalString(@"Yearly", nil);
    }
    return @"";
}

+ (NSString *)ht_getPriceByProduct:(SKProduct *)var_subProduct{
    //NSString *currencySymbol = [subProduct.priceLocale objectForKey:NSLocaleCurrencySymbol];//这里获取到的就是货币符号，例如：￥、$等等
    NSNumberFormatter *var_numberFormatter = [[NSNumberFormatter alloc] init];
    [var_numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [var_numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [var_numberFormatter setLocale:var_subProduct.priceLocale];
    NSString *var_formattedPrice = [var_numberFormatter stringFromNumber:var_subProduct.price];
    return var_formattedPrice;
}

+ (void)ht_isPurchaseWithTransaction:(NSDictionary *)var_transaction{
    if(var_transaction){
        NSString *var_lastBuyDate = kFormat(var_transaction[kSubscribeBuyDateKey]).ht_isEmptyStr;
        NSString *var_lastExpireDate = kFormat(var_transaction[kSubscribeExpireDateKey]).ht_isEmptyStr;
        NSString *var_lastProductId = kFormat(var_transaction[kSubscribeProductIdKey]).ht_isEmptyStr;
        NSString *var_lastRenewStatus = kFormat(var_transaction[kSubscribeRenewStatusKey]).ht_isEmptyStr?:@"3";
        NSURL *var_recepitURL = [[NSBundle mainBundle] appStoreReceiptURL];
        NSData *var_receipt = [NSData dataWithContentsOfURL:var_recepitURL];
        NSString *var_lastProductReceipt = [var_receipt base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
        
        NSString *var_status = kFormat(var_transaction[kSubscribeProductStatusKey]).ht_isEmptyStr;
        if (var_status == nil || var_status.length == 0 || [var_status isEqualToString:@""]) {
            NSString *currentTime = [HTCommonUtils ht_getNowTime];
            long var_n = [currentTime longLongValue];
            long var_o = [var_lastExpireDate longLongValue];
            if (var_lastExpireDate.length < 13) {
                var_o = [var_lastExpireDate longLongValue] * 1000;
            }
            if(var_o > var_n){
                var_status = @"1";
            } else {
                var_status = @"0";
            }
        }
        //更新本地数据
        NSDictionary *var_localData = @{
            kSubscribeBuyDateKey: (var_lastBuyDate.length > 0 ? var_lastBuyDate : @""),
            kSubscribeExpireDateKey: (var_lastExpireDate.length > 0 ? var_lastExpireDate : @""),
            kSubscribeProductIdKey: (var_lastProductId.length > 0 ? var_lastProductId : @""),
            kSubscribeProductReceiptKey:(var_lastProductReceipt.length > 0 ? var_lastProductReceipt : @""),
            kSubscribeProductStatusKey:(var_status.length > 0 ? var_status : @"0"),
            kSubscribeRenewStatusKey:(var_lastRenewStatus.length > 0 ? var_lastRenewStatus : @"0")
        };
        [[NSUserDefaults standardUserDefaults] setObject:var_localData.mj_JSONString forKey:STATIC_kIsFinishSubscribe];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (NSString *)lgjeropj_payTime {
    
    if ([[HTAccountModel sharedInstance] ht_isFamilyVip]) {
        return [[HTAccountModel sharedInstance] var_vipStartTime];
    } else if ([[HTAccountModel sharedInstance] ht_isServerVip]) {
        return [[HTAccountModel sharedInstance] var_bindStartTime];
    } else if ([[HTAccountModel sharedInstance] ht_isDeviceVip]) {
        return [[NSUserDefaults standardUserDefaults] stringForKey:@"udf_devicStartTime"];
    } else if ([[HTAccountModel sharedInstance] ht_isLocalVip]) {
        return [[self lgjeropj_infoFromLocalVip] objectForKey:kSubscribeBuyDateKey] ?: @"0";
    }
    return @"0";
}

+ (void)lgjeropj_maidian:(NSInteger)var_source {
    
    NSMutableDictionary *var_params = [NSMutableDictionary dictionary];
    [var_params setObject:@(var_source) forKey:@"source"];
    [var_params setValue:[self lgjeropj_payTime] forKey:@"pay_time"];
    [var_params setObject:@"1" forKey:@"ctype"];
    if (![[HTAccountModel sharedInstance] ht_isVip]) {
        [var_params setValue:@"2" forKey:AsciiString(@"status")];
        [var_params setValue:@"2" forKey:AsciiString(@"status2")];
        [var_params setValue:@"2" forKey:@"g_status"];
        [var_params setValue:@"2" forKey:@"s_s_status"];
        [var_params setValue:@"2" forKey:@"s_f_status"];
        [var_params setValue:@"2" forKey:AsciiString(@"s_x_status")];
    } else {
        [var_params setValue:[[HTAccountModel sharedInstance] ht_isDeviceVip] ? @"1" : @"2" forKey:AsciiString(@"s_x_status")];
        if ([[HTAccountModel sharedInstance] ht_isDeviceVip]) {
            [var_params setValue:[[NSUserDefaults standardUserDefaults] stringForKey:@"udf_devicePid"] forKey:@"type3"];
            [var_params setValue:@"1" forKey:AsciiString(@"status")];
            [var_params setValue:@"3" forKey:@"s_s_status"];
            [var_params setValue:@"3" forKey:@"s_f_status"];
        }
        if ([[HTAccountModel sharedInstance] ht_isFamilyVip]) {
            BOOL var_auto = [[HTAccountModel sharedInstance].var_renewStatus integerValue] > 0;
            [var_params setValue:[HTAccountModel sharedInstance].var_pid forKey:@"type2"];
            [var_params setValue:var_auto ? @"1" : @"3" forKey:AsciiString(@"status")];
            [var_params setValue:[HTAccountModel sharedInstance].var_toolVip ? @"3" : @"1" forKey:@"s_f_status"];
            [var_params setValue:[HTAccountModel sharedInstance].var_identity forKey:@"s_f_master"];
            [var_params setValue:@"" forKey:@"s_s_status"];
            [var_params setValue:[HTAccountModel sharedInstance].var_fid forKey:AsciiString(@"fid")];
        } else if ([[HTAccountModel sharedInstance] ht_isServerVip]) {
            BOOL var_auto = [[HTAccountModel sharedInstance].var_bindRenewStatus integerValue] > 0;
            [var_params setValue:[HTAccountModel sharedInstance].var_bindPid forKey:@"type2"];
            [var_params setValue:var_auto ? @"1" : @"3" forKey:AsciiString(@"status")];
            [var_params setValue:[HTAccountModel sharedInstance].var_toolVip ? @"3" : @"1" forKey:@"s_s_status"];
            [var_params setValue:@"" forKey:@"s_f_status"];
            [var_params setValue:@"" forKey:@"s_f_master"];
            [var_params setValue:@"" forKey:AsciiString(@"fid")];
        }
        if ([[HTAccountModel sharedInstance] ht_isLocalVip]) {
            BOOL var_auto = [[[self lgjeropj_infoFromLocalVip] objectForKey:kSubscribeRenewStatusKey] integerValue] > 0;
            [var_params setValue:var_auto ? @"1" : @"3" forKey:AsciiString(@"status")];
            [var_params setValue:var_auto ? @"1" : @"2" forKey:AsciiString(@"status2")];
            [var_params setValue:@"1" forKey:@"g_status"];
            [var_params setValue:[[HTAccountModel sharedInstance] ht_pidByLocalVip] forKey:AsciiString(@"type")];
        } else {
            [var_params setValue:@"2" forKey:@"g_status"];
            [var_params setValue:@"3" forKey:AsciiString(@"status2")];
            [var_params setValue:@"" forKey:AsciiString(@"type")];
        }
    }
    [HTPointEventManager ht_eventWithCode:@"subscribe_status" andParams:var_params];
}

+ (NSDictionary *)lgjeropj_infoFromLocalVip {
 
    NSString *var_localData = [[NSUserDefaults standardUserDefaults] objectForKey:STATIC_kIsFinishSubscribe];
    return [var_localData mj_JSONObject];
}

@end
