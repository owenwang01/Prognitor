//
//  HTSubscribeUtils.h
// 
//
//  Created by Apple on 2022/11/23.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class SKProduct;
@interface HTSubscribeUtils : NSObject

+ (void)ht_requetProduct;
+ (void)ht_checkAndSubscribe;

+ (void)ht_checkAndPushSubscribeVip:(NSInteger)source;
+ (void)ht_pushSubscribeVip:(NSInteger)source;

+ (void)ht_startBuyProduct:(SKProduct *)product andDoneBlock:(void(^)(BOOL var_buySuccess))doneBlock;

+ (void)ht_reStoreAndDoneBlock:(void(^)(BOOL var_buySuccess))doneBlock;

//首次安装自动restore,矫正订阅信息
+ (void)lgjeropj_automaticRequestRestore;

+ (NSString *)lgjeropj_changeMyTextWithText:(NSString *)text;

+ (void)ht_continueCheckAndSubscribe;

+ (void)ht_requestStripProduct:(void(^ _Nullable)(bool code))block;
@end

NS_ASSUME_NONNULL_END
