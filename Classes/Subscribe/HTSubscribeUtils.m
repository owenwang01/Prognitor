//
//  HTSubscribeUtils.m
// 
//
//  Created by Apple on 2022/11/23.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTSubscribeUtils.h"
#import "HTSubscribeGuideViewController.h"
#import "HTSubscribeMoreViewController.h"
#import "HTFakeCardController.h"
#import "HTSubscribeUtils.h"
#import "HTSubscribeManager.h"
#import "NSString+Extension.h"
#import "HTCommonConfiguration.h"
#import "HTSubscribeConvert.h"
#import "HTToolKitManager.h"
#import "RACSignal.h"
#import "RACSubject.h"
#import "UIViewController+Navigation.h"
#import "HTBaseNavigationController.h"
#import "ZKBaseTipTool.h"
#import "HTNetworkManager.h"
#import "HTCommonUtils.h"

@implementation HTSubscribeUtils

+ (void)ht_requetProduct {
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"udf_showFreeMonth"]) {
        [[HTSubscribeManager sharedInstance] ht_requestProduct:@[HT_IPA_Week, HT_IPA_Free_Month, HT_IPA_Year, HT_IPA_Family_Week, HT_IPA_Family_Month, HT_IPA_Family_Year]];
    } else {
        [[HTSubscribeManager sharedInstance] ht_requestProduct:@[HT_IPA_Week, HT_IPA_Month, HT_IPA_Year, HT_IPA_Family_Week, HT_IPA_Family_Month, HT_IPA_Family_Year]];
    }
}

+ (void)ht_checkAndSubscribe {
    
    [self ht_requetProduct];
    [[HTSubscribeManager sharedInstance].requestProductDownSignal subscribeNext:^(id  _Nullable x) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *var_localData = [[NSUserDefaults standardUserDefaults] objectForKey:STATIC_kIsFinishSubscribe];
            if([NSString ht_isEmpty:var_localData]){
                [HTSubscribeUtils lgjeropj_automaticRequestRestore];
            } else {
                [[HTSubscribeManager sharedInstance] lgjeropj_iapVerifyWithReceipt:nil andflag:NO];
            }
        });
    }];
}

+ (void)ht_continueCheckAndSubscribe {
    
    if (!HTCommonConfiguration.lgjeropj_shared.BLOCK_switchStateBlock()) {
        return;
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"udf_daoliang"]) {
        // 导量开时不弹订阅引导页
        return;
    }
    if (HTCommonConfiguration.lgjeropj_shared.BLOCK_pushStartBlock()) {
        return;
    }
    if([HTSubscribeConvert ht_subscribeIsExpire]) {
        
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"udf_hadInSubscribeGuideView"] == YES) {
            // 防止多次弹窗
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"udf_hadInSubscribeGuideView"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            BOOL vipKaiguan = [[NSUserDefaults standardUserDefaults] boolForKey:@"udf_vipKaiGuan"];
            NSInteger nowTime = [[NSDate date] timeIntervalSince1970];
            BOOL inVipTime = nowTime - [[NSUserDefaults standardUserDefaults] stringForKey:@"udf_firstOpenTime"].integerValue > [[NSUserDefaults standardUserDefaults] integerForKey:@"udf_vipTime"];
            BOOL newActivityKiaguan = [[NSUserDefaults standardUserDefaults] boolForKey:@"udf_subscriptionActivityKaiGuan"];
            if (vipKaiguan && inVipTime && newActivityKiaguan && ![[NSUserDefaults standardUserDefaults] boolForKey:@"udf_isIAPDiscount"]) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"NTFCTString_showActivityView" object:nil];
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"udf_subGuideShow"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    // 如果在播放页、暂停播放
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"udf_pause_player" object:nil];
                    if ([[HTToolKitManager shared] lgjeropj_strip_k12] > 0) {
                        // 假卡片订阅引导
                        HTFakeCardController *vc = [[HTFakeCardController alloc] init];
                        vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
                        vc.block = ^{
                            // 恢复播放页播放
                            [[NSNotificationCenter defaultCenter] postNotificationName:@"udf_play_player" object:nil];
                            // 显示评论
                            [[NSNotificationCenter defaultCenter] postNotificationName:@"NTFCTString_ShowAppReview" object:nil];
                        };
                        [[UIViewController lgjeropj_currentViewController] presentViewController:vc animated:YES completion:nil];
                    } else {
                        HTSubscribeGuideViewController *subVC = [[HTSubscribeGuideViewController alloc] init];
                        [subVC lgjeropj_setBar_hidden:YES];
                        HTBaseNavigationController *nav = [[HTBaseNavigationController alloc] initWithRootViewController:subVC];
                        nav.modalPresentationStyle = UIModalPresentationOverFullScreen;
                        UIViewController *currentVC = [UIViewController lgjeropj_currentViewController];
                        [currentVC presentViewController:nav animated:YES completion:NULL];
                    }
                });
            }
        }
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"udf_hadInSubscribeGuideView"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"NTFCTString_ShowAppReview" object:nil];
    }
}

+ (void)ht_checkAndPushSubscribeVip:(NSInteger)source {
    if([HTSubscribeConvert ht_subscribeIsExpire]){
        HTSubscribeMoreViewController *subVC = [[HTSubscribeMoreViewController alloc] init];
        subVC.source = source;
        UIViewController *currentVC = [UIViewController lgjeropj_currentViewController];
        [currentVC.navigationController pushViewController:subVC animated:YES];
    }
}

+ (void)ht_pushSubscribeVip:(NSInteger)source {
    HTSubscribeMoreViewController *subVC = [[HTSubscribeMoreViewController alloc] init];
    subVC.source = source;
    UIViewController *currentVC = [UIViewController lgjeropj_currentViewController];
    [currentVC.navigationController pushViewController:subVC animated:YES];
}

+ (void)ht_startBuyProduct:(SKProduct *)product andDoneBlock:(nonnull void (^)(BOOL))doneBlock{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NTFCTString_RemoveVIPActivityView" object:nil];
    
    [ZKBaseTipTool lgjeropj_showDotLoadingTipWithText:AsciiString(@"In Purchase...")];
    [[HTSubscribeManager sharedInstance] ht_byProduct:product];
    [[HTSubscribeManager sharedInstance].subscribeFinishedSignal subscribeNext:^(id  _Nullable x) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [ZKBaseTipTool ht_hideDotLoadingTip];
            [ZKBaseTipTool showMessage:LocalString(@"Success", nil)];
            if(doneBlock){
                doneBlock(YES);
            }
        });
    }];
    [[HTSubscribeManager sharedInstance].subscribeFailSignal subscribeNext:^(id  _Nullable x) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [ZKBaseTipTool ht_hideDotLoadingTip];
            [ZKBaseTipTool showMessage:x];
            if(doneBlock){
                doneBlock(NO);
            }
        });
    }];
    [[HTSubscribeManager sharedInstance].subscribeVerifySignal subscribeNext:^(id  _Nullable x) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [ZKBaseTipTool ht_hideDotLoadingTip];
            [ZKBaseTipTool lgjeropj_showDotLoadingTipWithText:AsciiString(@"Verifying...")];
        });
    }];
}

+ (void)ht_reStoreAndDoneBlock:(void(^)(BOOL var_buySuccess))doneBlock{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NTFCTString_RemoveVIPActivityView" object:nil];
    
    [ZKBaseTipTool lgjeropj_showDotLoadingTipWithText:AsciiString(@"Recovering...")];
    [[HTSubscribeManager sharedInstance] ht_reStore];
    [[HTSubscribeManager sharedInstance].subscribeFinishedSignal subscribeNext:^(id  _Nullable x) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [ZKBaseTipTool ht_hideDotLoadingTip];
            [ZKBaseTipTool showMessage:LocalString(@"Success", nil)];
            if(doneBlock){
                doneBlock(YES);
            }
        });
    }];
    [[HTSubscribeManager sharedInstance].subscribeFailSignal subscribeNext:^(id  _Nullable x) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [ZKBaseTipTool ht_hideDotLoadingTip];
            [ZKBaseTipTool showMessage:x];
            if(doneBlock){
                doneBlock(NO);
            }
        });
    }];
    [[HTSubscribeManager sharedInstance].subscribeVerifySignal subscribeNext:^(id  _Nullable x) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [ZKBaseTipTool ht_hideDotLoadingTip];
            [ZKBaseTipTool lgjeropj_showDotLoadingTipWithText:AsciiString(@"Verifying...")];
        });
    }];
}

+ (void)lgjeropj_automaticRequestRestore
{
    [[HTSubscribeManager sharedInstance] ht_reStore];
}

+ (NSString *)lgjeropj_changeMyTextWithText:(NSString *)text {
    if([text containsString:HT_IPA_Week]){
        return LocalString(@"week", nil);
    }
    if([text containsString:HT_IPA_Month]){
        return LocalString(@"month", nil);
    }
    if([text containsString:HT_IPA_Year]){
        return LocalString(@"year", nil);
    }
    return LocalString(@"month", nil);
}

+ (void)ht_requestStripProduct:(void (^)(bool))block {
    NSMutableDictionary *var_params = [NSMutableDictionary dictionary];
    if([HTAccountModel sharedInstance].var_isLogin){
        [var_params setValue:[NSString ht_isEmpty:[HTAccountModel sharedInstance].uid andReplaceStr:@"0"] forKey:AsciiString(@"uid")];
    }else{
        [var_params setValue:@"0" forKey:AsciiString(@"uid")];
    }
    NSString *vipStr = [HTSubscribeConvert ht_subscribeIsExpire] ? @"0" : @"1";
    [var_params setObject:vipStr forKey:AsciiString(@"p1")];
    [[HTNetworkManager shareInstance] post:kNetworkFormat(STATIC_kAppStripProduct) param:var_params result:^(id result) {
        if (TransSuccess(result)) {
            NSDictionary *dataDict = [result objectForKey:@"data"];
            if (dataDict != nil && dataDict.count > 0) {
                [[HTToolKitManager shared] lgjeropj_save_strip_product:dataDict];
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                NSString *linkStr = AsciiString(@"link");// link
                [userDefaults setObject:dataDict[linkStr] forKey:@"udf_offizielleWeb"];
                NSString *k2Str = AsciiString(@"k2");//
                [userDefaults setBool:[dataDict[k2Str][0] boolValue] forKey:@"udf_vipKaiGuan"];
                [userDefaults setInteger:[dataDict[k2Str][1] integerValue] forKey:@"udf_vipTime"];
                NSString *k3Str = AsciiString(@"k3");//
                [userDefaults setBool:[dataDict[k3Str][0] boolValue] forKey:@"udf_subscriptionActivityKaiGuan"];
                [userDefaults setObject:dataDict[k3Str][1] forKey:@"udf_subscriptionActivityImg"];
                [userDefaults synchronize];
                
                if (block) {
                    block (YES);
                }
            }
        }
    }];
}

@end
