//
//  HTFreemonthView.m
//  Cubohue
//
//  Created by admin on 2023/1/4.
//

#import "HTFreemonthView.h"
#import "HTSubscribeAlert.h"
#import "HTFreeMonthManager.h"
#import <StoreKit/StoreKitDefines.h>
#import "HTSubscribeConvert.h"
#import "HTNetworkApi.h"
#import "UIColor+Color.h"
#import "HTSubscribeUtils.h"
#import "HTCommonConfiguration.h"

@implementation HTFreemonthView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor ht_colorWithHexString:@"#000000"] colorWithAlphaComponent:0.7];
    }
    return self;
}

#pragma mark-
- (void)lgjeropj_updateButtonAction {
    
    [HTFreeMonthManager lgjeropj_vipguideClickAndkid:@"5"];
    //移除弹窗
    [HTCommonConfiguration lgjeropj_shared].BLOCK_guidBlock(YES);
    [self lgjeropj_hideAlertView];
    //去订阅
    SKProduct *product = [HTSubscribeConvert ht_getProductWithId:HT_IPA_Free_Month];
    [HTSubscribeUtils ht_startBuyProduct:product andDoneBlock:^(BOOL var_buySuccess) {
        if(var_buySuccess){
            dispatch_async(dispatch_get_main_queue(), ^{
                [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"udf_showFreeMonth"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                [HTSubscribeUtils ht_requetProduct];
            });
        }
    }];
}

- (void)lgjeropj_cancelButtonAction {
    // 埋点
    [HTFreeMonthManager lgjeropj_vipguideClickAndkid:@"2"];
    
    [HTCommonConfiguration lgjeropj_shared].BLOCK_showRedBlock();
    // 移除
    [HTCommonConfiguration lgjeropj_shared].BLOCK_guidBlock(YES);
    [self lgjeropj_hideAlertView];
}
- (void)lgjeropj_showAlertView {
    //埋点
    [HTFreeMonthManager lgjeropj_vipguideShow];
    __weak typeof(self) weakSelf = self;
    HTSubscribeAlert *alert = [HTSubscribeAlert shareInstance];
    alert.BLOCK_confirmClickBlock = ^(HTSubscribeAlert *alert) {
        [weakSelf lgjeropj_updateButtonAction];
    };
    alert.BLOCK_cancelClickBlock = ^(HTSubscribeAlert *alert) {
        [weakSelf lgjeropj_cancelButtonAction];
    };
    [alert ht_show];
}

- (void)lgjeropj_hideAlertView {
    [self removeFromSuperview];
}

@end
