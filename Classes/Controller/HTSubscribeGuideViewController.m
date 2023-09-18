//
//  HTSubscribeGuideViewController.m
// 
//
//  Created by Apple on 2022/11/20.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTSubscribeGuideViewController.h"
#import "HTSubscribeManager.h"
#import <StoreKit/StoreKit.h>
#import "HTSubscribeGuideManager.h"
#import "HTSubscribeUtils.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "HTCommonUtils.h"
#import "HTSubscribeConvert.h"
#import "UIView+Extension.h"
#import "NSString+Extension.h"

@interface HTSubscribeGuideViewController ()

@property (nonatomic, strong) UIImageView *var_coverImageView;
@property (nonatomic, strong) UIButton *subscribeButton;
@property (nonatomic, strong) UILabel *discountLabel;
@property (nonatomic, strong) SKProduct *product;
@property (nonatomic, strong) UIImageView *trialImageView;

@end

@implementation HTSubscribeGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)lgjeropj_addSubviews {
    UIButton *var_closeButton = [HTSubscribeGuideManager lgjeropj_closeButton];
    [self.view addSubview:var_closeButton];
    [var_closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(StatusBarHeight + 20);
        make.right.mas_equalTo(-8);
        make.size.mas_equalTo(CGSizeMake(kBarHeight, kBarHeight));
    }];
    kself
    [[var_closeButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf lgjeropj_dismiss:nil];
    }];
    
    UIScrollView *mainScrollView = [HTSubscribeGuideManager lgjeropj_scrollView];
    [self.view addSubview:mainScrollView];
    [mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
        make.top.equalTo(var_closeButton.mas_bottom);
    }];
    UIImageView *var_coverImageView = [HTSubscribeGuideManager lgjeropj_coverView];
    [mainScrollView addSubview:var_coverImageView];
    [var_coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(kDevice_Is_iPad?(SCREEN_WIDTH-400)*0.5:28);
        make.width.mas_equalTo(kDevice_Is_iPad?400.0f:SCREEN_WIDTH-28*2);
        make.height.mas_equalTo(kDevice_Is_iPad?400.0f:SCREEN_WIDTH-28*2);
    }];
    self.var_coverImageView = var_coverImageView;
    UILabel *titleLabel = [HTSubscribeGuideManager lgjeropj_titleLabel];
    [mainScrollView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(var_coverImageView.mas_bottom);
        make.left.mas_equalTo(16);
        make.right.equalTo(self.view).offset(-16);
    }];
    
    UILabel *subTitleLabel = [HTSubscribeGuideManager lgjeropj_subTitleLabel];
    [mainScrollView addSubview:subTitleLabel];
    [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(16);
        make.left.equalTo(titleLabel).offset(16);
        make.right.equalTo(titleLabel).offset(-16);
    }];
    
    LoadActivityIndicatorButton *subscribeButton = [HTSubscribeGuideManager lgjeropj_subscribeButton];
    [mainScrollView addSubview:subscribeButton];
    [subscribeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(subTitleLabel.mas_bottom).offset(50);
        make.left.mas_equalTo(38);
        make.right.equalTo(self.view).offset(-38);
        make.height.mas_equalTo(60);
    }];
    [[subscribeButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf ht_handleBuyProduct];
    }];
    self.subscribeButton = subscribeButton;
    
    UILabel *subDiscountLabel = [HTSubscribeGuideManager lgjeropj_discountLabel];
    [subscribeButton addSubview:subDiscountLabel];
    self.discountLabel = subDiscountLabel;
    
    UILabel *subRemarkLabel = [HTSubscribeGuideManager lgjeropj_remarkLabel];
    [mainScrollView addSubview:subRemarkLabel];
    [subRemarkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(subscribeButton.mas_bottom).offset(10);
        make.left.mas_equalTo(16);
        make.right.equalTo(self.view).offset(-16);
    }];
    
    UIButton *morePlansButton = [HTSubscribeGuideManager lgjeropj_morePlanButton];
    [mainScrollView addSubview:morePlansButton];
    [morePlansButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(subRemarkLabel.mas_bottom).offset(40);
        make.left.mas_equalTo(125);
        make.right.equalTo(self.view).offset(-125);
        make.height.mas_equalTo(30);
    }];
    [[morePlansButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf lgjeropj_dismiss:^{
            UITabBarController *tabBar = (UITabBarController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
            if([tabBar isKindOfClass:(UITabBarController.class)]){
                [tabBar setSelectedIndex:1];
            }
        }];
    }];
    
    //
    self.trialImageView = [[UIImageView alloc] init];
    [self.trialImageView sd_setImageWithURL:kImageNumber(55)];
    self.trialImageView.hidden = YES;
    [subscribeButton addSubview:self.trialImageView];
    [self.trialImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(65, 50));
    }];
}

- (void)lgjeropj_dismiss:(void(^)(void))completion {
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"udf_subGuideShow"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NTFCTString_ShowAppReview" object:nil];
    [self dismissViewControllerAnimated:YES completion:completion];
}

#pragma mark - 执行购买商品
- (void)ht_handleBuyProduct{
    if([self lgjeropj_showFreeMonth]) {
        [HTSubscribeUtils ht_startBuyProduct:self.product andDoneBlock:^(BOOL var_buySuccess) {
            if(var_buySuccess){
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self lgjeropj_dismiss:nil];
                    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"udf_showFreeMonth"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    [HTSubscribeUtils ht_requetProduct];
                });
            }
        }];
    } else {
        [HTSubscribeUtils ht_startBuyProduct:self.product andDoneBlock:^(BOOL var_buySuccess) {
            if(var_buySuccess){
                [self lgjeropj_dismiss:nil];
            }
        }];
    }
}

//订阅引导页是否展示免费月(导量赠送的)
- (BOOL)lgjeropj_showFreeMonth
{
    BOOL var_showFreeMonth = [[NSUserDefaults standardUserDefaults] boolForKey:@"udf_showFreeMonth"];
    return var_showFreeMonth;
}

- (void)lgjeropj_requestData{
    [self ht_updateViewWithData];
}

- (void)ht_updateViewWithData {
    NSArray *dataArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"udf_vipGuideImage"];
    NSString *adUrl = kFormat(dataArray.firstObject).ht_isEmptyStr;
    [self.var_coverImageView sd_setImageWithURL:[NSURL URLWithString:adUrl]];
    
    SKProduct *product = [HTSubscribeConvert ht_getProductWithId:([self lgjeropj_showFreeMonth]?HT_IPA_Free_Month:HT_IPA_Month)];
    self.product = product;
    NSString *attrContent = [NSString stringWithFormat:@"/%@", [HTSubscribeUtils lgjeropj_changeMyTextWithText:product.productIdentifier]];
    
    float var_price = 4.99;
    if(product.price.floatValue > 0) {
        var_price = product.price.floatValue;
    };
    float var_trialPrice = 0.99;
    if(product.introductoryPrice.price.floatValue > 0) {
        var_trialPrice = product.introductoryPrice.price.floatValue;
    }

    NSString *showText = @"";
    if(product.introductoryPrice && ![HTSubscribeConvert lgjeropj_checkrReceiptInfo]){
        self.discountLabel.hidden = YES;
        self.trialImageView.hidden = NO;
        showText = [NSString stringWithFormat:AsciiString(@"$%.2f %@"), var_trialPrice, attrContent];
    } else {
        self.trialImageView.hidden = YES;
        showText = [NSString stringWithFormat:AsciiString(@"$%.2f %@"), var_price, attrContent];
        if(product.introductoryPrice){
            self.discountLabel.hidden = NO;
            CGFloat dis = 1.99 / 7 * 30;
            SKProduct *weekProduct = [HTSubscribeConvert ht_getProductWithId:HT_IPA_Week];
            if(weekProduct){
                dis = weekProduct.price.floatValue / 7 * 30;
            }
            CGFloat disNum = (dis - var_price) / dis;
            self.discountLabel.text = [NSString stringWithFormat:AsciiString(@"-%.0f%%"), disNum * 100];
        }else{
            self.discountLabel.hidden = YES;
        }
    }
    if([self lgjeropj_showFreeMonth]) {
        showText = [NSString stringWithFormat:@"%@ %@", LocalString(@"Free", nil), attrContent];
    }
    
    NSRange range = [showText rangeOfString:attrContent];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:showText];
    [attr addAttributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:14]
    } range:range];
    [self.subscribeButton setAttributedTitle:attr forState:UIControlStateNormal];
}

@end
