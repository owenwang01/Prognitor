//
//  HTSubscribeConvert.h
// 
//
//  Created by Apple on 2022/11/21.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SKProduct;
@interface HTSubscribeConvert : NSObject
// 订阅状态
+ (BOOL)ht_subscribeIsExpire;
// 判断凭证
+ (BOOL)ht_originalWithTransaction:(SKPaymentTransaction *)var_transaction;
//验证订单信息,yes:有 no:没有
+ (BOOL)lgjeropj_checkrReceiptInfo;
// 根据产品ID获取产品详细信息
+ (SKProduct *)ht_getProductWithId:(NSString *)var_productId;
// 根据订阅期限匹配显示内容
+ (NSString *)ht_getSubscriptiopPeriodWithUnit:(NSInteger)var_unit andNumberOfUnits:(NSInteger)var_numberOfUnits;
// 获取本地格式化金额
+ (NSString *)ht_getPriceByProduct:(SKProduct *)var_subProduct;
// 假卡片的标题
+ (NSString *)lgjeropj_getLocalSubscripTitleWithCount:(NSInteger)var_count;
// 更新状态
+ (void)ht_isPurchaseWithTransaction:(NSDictionary *)var_transaction;
// 埋点
+ (void)lgjeropj_maidian:(NSInteger)var_source;
@end

NS_ASSUME_NONNULL_END
