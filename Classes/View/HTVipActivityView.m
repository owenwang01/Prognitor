//
//  HTVipActivityView.m

//
//  Created by admin on 2022/1/26.
//

#import "HTVipActivityView.h"
#import "HTVipActivityViewManager.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "HTSubscribeUtils.h"
#import "HTSubscribeManager.h"
#import "HTAccountModel.h"

@interface HTVipActivityView ()

@end

@implementation HTVipActivityView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self lgjeropj_configSubviews];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lgjeropj_closeBtnClick) name:@"NTFCTString_RemoveVIPActivityView" object:nil];
    }
    return self;
}

- (void)lgjeropj_configSubviews {
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - SCREEN_BOTTOM)];
    bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    [self addSubview:bgView];
    
    self.iconImage = [UIButton buttonWithType:UIButtonTypeCustom];
    self.iconImage.frame = CGRectMake((CGRectGetWidth(bgView.frame) - kWidthScale(272))/2, (CGRectGetHeight(bgView.frame) - kWidthScale(400))/2, kWidthScale(272), kWidthScale(400));
    self.iconImage.layer.cornerRadius = 12;
    self.iconImage.layer.masksToBounds = YES;
    [self.iconImage addTarget:self action:@selector(lgjeropj_buyBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:self.iconImage];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(CGRectGetWidth(self.iconImage.frame) - 40, 0, 40, 34);
    [closeBtn setImage:[UIImage imageNamed:@"icon_glclose"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(lgjeropj_closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.iconImage addSubview:closeBtn];
    
    [bgView addSubview:[self lgjeropj_moreProductBtn]];
    
    //埋点
    [HTVipActivityViewManager lgjeropj_maidianVipShow];
}

- (UIButton *)lgjeropj_moreProductBtn
{
    UIButton *var_moreProductBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    var_moreProductBtn.frame = CGRectMake(0, CGRectGetMaxY(self.iconImage.frame) + 10, SCREEN_WIDTH, 36);
    [var_moreProductBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    var_moreProductBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    NSString *planButtonText = LocalString(@"Choose more plans", nil);
    NSMutableAttributedString *remarkAttr = [[NSMutableAttributedString alloc] initWithString:planButtonText];
    [remarkAttr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, planButtonText.length)];
    [var_moreProductBtn setAttributedTitle:remarkAttr forState:UIControlStateNormal];
    [[var_moreProductBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self lgjeropj_moreProductBtnClick];
    }];
    return var_moreProductBtn;
}

#pragma mark- Action
- (void)lgjeropj_closeBtnClick {
    if(self.block) {
        while (self.subviews.count) {
            UIView *child = self.subviews.lastObject;
            [child removeFromSuperview];
        }
        [self removeFromSuperview];
        self.block(nil);
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NTFCTString_ShowAppReview" object:nil];
    //埋点
    [HTVipActivityViewManager lgjeropj_maidianVipClick:@"8"];
}
- (void)lgjeropj_moreProductBtnClick {
    if(self.block) {
        while (self.subviews.count) {
            UIView *child = self.subviews.lastObject;
            [child removeFromSuperview];
        }
        [self removeFromSuperview];
        self.block(self.tempProduct);
    }
    
    //埋点
    [HTVipActivityViewManager lgjeropj_maidianVipClick:@"16"];
}

- (void)lgjeropj_buyBtnAction {
    kself
    [HTSubscribeUtils ht_startBuyProduct:self.tempProduct andDoneBlock:^(BOOL var_buySuccess) {
        if ([HTAccountModel sharedInstance].ht_isVip) {
            [weakSelf lgjeropj_closeBtnClick];
        }
    }];
    //埋点
    if ([self localizedTrialDuraion:self.tempProduct]) {
        [HTVipActivityViewManager lgjeropj_maidianVipClick:@"9"];
    } else if ([self.tempProduct.productIdentifier isEqualToString:HT_IPA_Week]) {
        [HTVipActivityViewManager lgjeropj_maidianVipClick:@"7"];
    } else if ([self.tempProduct.productIdentifier isEqualToString:HT_IPA_Month]) {
        [HTVipActivityViewManager lgjeropj_maidianVipClick:@"2"];
    } else if ([self.tempProduct.productIdentifier isEqualToString:HT_IPA_Year]) {
        [HTVipActivityViewManager lgjeropj_maidianVipClick:@"3"];
    }
}

- (SKProduct *)tempProduct {
    if (!_tempProduct) {
        _tempProduct = [SKProduct new];
        NSArray *iapProducts = [HTSubscribeManager sharedInstance].productList;
        if (iapProducts && iapProducts.count > 0) {
            for (SKProduct *temp in iapProducts) {
                BOOL trial = [self localizedTrialDuraion:temp];
                if (trial) {
                    _tempProduct = temp;
                } else if ([temp.productIdentifier isEqualToString:HT_IPA_Month]) {
                    _tempProduct = temp;
                }
            }
        }
    }
    return _tempProduct;
}

- (BOOL)localizedTrialDuraion:(SKProduct *)product {
    if (@available(iOS 11.2, *)) {
        if (product.introductoryPrice.subscriptionPeriod.numberOfUnits > 0) {
            return YES;
        }
    }
    return NO;
}


@end
