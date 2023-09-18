//
//  HTSubscribeMoreViewController.m
// 
//
//  Created by Apple on 2022/11/20.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTSubscribeMoreViewController.h"
#import "HTPremiumNewCardItem.h"
#import "HTSubscribeRemakView.h"
#import "HTPremiumEmptyView.h"
#import "YYText.h"
#import "HTToolSubscribeAlertView.h"
#import "HTPremiumHeaderView.h"
#import "HTUnSubscribeRemindView.h"
#import "HTRemindAddFamilyMemberView.h"
#import "HTSubscribeViewModel.h"
#import <StoreKit/StoreKit.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "HTToolKitManager.h"
#import "HTSubscribeConvert.h"
#import "HTSubscribeUtils.h"
#import "LKFPrivateFunction.h"
#import "HTCommonConfiguration.h"
#import "HTPointEventManager.h"

@interface HTSubscribeMoreViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) HTSubscribeViewModel *viewModel;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HTPremiumHeaderView *headerView;
@property (nonatomic, strong) UIButton *htIndividualButton;
@property (nonatomic, strong) UIButton *htFamilyButton;
@property (nonatomic, strong) UICollectionView *mainCollectionView;
@property (nonatomic, strong) HTSubscribeRemakView *remarkView;
@property (nonatomic, strong) HTPremiumEmptyView *emptyView;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) UILabel *htHintLabel;
@property (nonatomic, strong) UIButton *htPayButton;

@end

@implementation HTSubscribeMoreViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self lgjeropj_refreshUI];
}

- (void)lgjeropj_refreshUI {
    NSDictionary *var_dataDict = [HTCommonConfiguration lgjeropj_shared].BLOCK_gdBlock();
    dispatch_async(dispatch_get_main_queue(), ^{
        self.emptyView.hidden = [[var_dataDict objectForKey:@"status"] integerValue] == 0;
        [self.mainCollectionView reloadData];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //埋点
    [self lgjeropj_showMaidian:1];
    //埋点
    if ([[HTToolKitManager shared] lgjeropj_strip_k12] > 0) {
        NSArray *var_k3 = [[HTToolKitManager shared] lgjeropj_strip_k3];
        if (var_k3.count > 0) {
            NSInteger var_activity = [[var_k3 firstObject] integerValue];
            if (var_activity == 1) {
                [self lgjeropj_showMaidian:2];
            }
        }
    }
    @weakify(self);
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:NTFCTString_FinishSubscribeNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        @strongify(self);
        [self lgjeropj_iapInfoChange];
    }];
    self.view.backgroundColor = [UIColor ht_colorWithHexString:@"#11101E"];
    [self ht_showRemindIcon];
    [self ht_showUnsubscribeAlertView];
}

- (void)lgjeropj_iapInfoChange
{
    [self lgjeropj_requestData];
    [self lgjeropj_refreshUI];
    [self lgjeropj_reloadVipStatus];
    [self ht_showRemindIcon];
    [self ht_showUnsubscribeAlertView];
}

- (void)lgjeropj_requestData {
    
    __weak typeof(self) weakSelf = self;
    [self.viewModel lgjeropj_requestData:^{
        [weakSelf lgjeropj_refreshWithIndex:weakSelf.selectedIndex];
        [weakSelf lgjeropj_refreshUI];
        [weakSelf lgjeropj_reloadVipStatus];
    }];
}

- (NSArray *)ht_currentArray {
    
    if (self.htIndividualButton.selected) {
        return self.viewModel.productArray;
    }
    return self.viewModel.familyArray;
}

- (void)lgjeropj_addSubviews {
    
    self.navigationItem.title = LocalString(@"Remove ads", nil);
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.mas_bottomLayoutGuideTop);
    }];
    
    @weakify(self);
    self.headerView = [[HTPremiumHeaderView alloc] init];
    [[self.headerView.var_managerBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"udf_remind_add_family_member_red"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.headerView lgjeropj_refresh];
        //埋点
        [self lgjeropj_clickMaidian:11 type:0];
        // 家庭
        UIViewController *vc = [[NSClassFromString(@"HTFamilyViewController") alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }];
    [self.scrollView addSubview:self.headerView];
    [self lgjeropj_reloadVipStatus];

    self.htIndividualButton = [[UIButton alloc] init];
    [self.htIndividualButton setTitle:LocalString(@"Individual Plan", nil) forState:UIControlStateNormal];
    [self.htIndividualButton setTitleColor:[UIColor ht_colorWithHexString:@"#727682"] forState:UIControlStateNormal];
    [self.htIndividualButton setTitleColor:[UIColor ht_colorWithHexString:@"#FFFFFF"] forState:UIControlStateSelected];
    [self.htIndividualButton setBackgroundImage:[[UIColor ht_colorWithHexString:@"#161A26"] ht_imageWithSize:CGSizeMake(SCREEN_WIDTH/2, 48)] forState:UIControlStateNormal];
    [self.htIndividualButton setBackgroundImage:[[UIColor ht_colorWithHexString:@"#11101E"] ht_imageWithSize:CGSizeMake(SCREEN_WIDTH/2, 48)] forState:UIControlStateSelected];
    self.htIndividualButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [[self.htIndividualButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        //埋点
        [self lgjeropj_showMaidian:1];
        //埋点
        if ([[HTToolKitManager shared] lgjeropj_strip_k12] > 0) {
            NSArray *var_k3 = [[HTToolKitManager shared] lgjeropj_strip_k3];
            if (var_k3.count > 0) {
                NSInteger var_activity = [[var_k3 firstObject] integerValue];
                if (var_activity == 1) {
                    [self lgjeropj_showMaidian:2];
                }
            }
        }
        self.selectedIndex = 0;
        [self.mainCollectionView reloadData];
        self.htIndividualButton.selected = YES;
        self.htFamilyButton.selected = NO;
        [self lgjeropj_interestView];
        [self lgjeropj_refreshWithIndex:self.selectedIndex];
    }];
    [self.scrollView addSubview:self.htIndividualButton];
    [self.htIndividualButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom).offset(16);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(48);
        make.width.mas_equalTo(SCREEN_WIDTH/2);
    }];
    
    self.htFamilyButton = [[UIButton alloc] init];
    [self.htFamilyButton setTitle:LocalString(@"Family Plan", nil) forState:UIControlStateNormal];
    [self.htFamilyButton setTitleColor:[UIColor ht_colorWithHexString:@"#727682"] forState:UIControlStateNormal];
    [self.htFamilyButton setTitleColor:[UIColor ht_colorWithHexString:@"#FFFFFF"] forState:UIControlStateSelected];
    [self.htFamilyButton setBackgroundImage:[[UIColor ht_colorWithHexString:@"#161A26"] ht_imageWithSize:CGSizeMake(SCREEN_WIDTH/2, 48)] forState:UIControlStateNormal];
    [self.htFamilyButton setBackgroundImage:[[UIColor ht_colorWithHexString:@"#11101E"] ht_imageWithSize:CGSizeMake(SCREEN_WIDTH/2, 48)] forState:UIControlStateSelected];
    self.htFamilyButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [[self.htFamilyButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        //埋点
        [self lgjeropj_showMaidian:3];
        //埋点
        [self lgjeropj_clickMaidian:10 type:3];
        self.selectedIndex = 0;
        [self.mainCollectionView reloadData];
        self.htFamilyButton.selected = YES;
        self.htIndividualButton.selected = NO;
        [self lgjeropj_interestView];
        [self lgjeropj_refreshWithIndex:self.selectedIndex];
    }];
    [self.scrollView addSubview:self.htFamilyButton];
    [self.htFamilyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.htIndividualButton);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(48);
        make.width.mas_equalTo(SCREEN_WIDTH/2);
    }];
    
    self.htIndividualButton.selected = YES;
    self.htFamilyButton.selected = NO;
    
    [self.scrollView addSubview:self.mainCollectionView];
    // 权益
    [self lgjeropj_interestView];
    
    self.htHintLabel = [[UILabel alloc] init];
    self.htHintLabel.numberOfLines = 0;
    self.htHintLabel.font = [UIFont systemFontOfSize:12];
    self.htHintLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [self.scrollView addSubview:self.htHintLabel];
    [self.htHintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainCollectionView.mas_bottom).offset(10);
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
        make.height.mas_greaterThanOrEqualTo(14);
    }];
    
    self.htPayButton = [[UIButton alloc] init];
    [self.htPayButton setTitleColor:[UIColor ht_colorWithHexString:@"#685034"] forState:UIControlStateNormal];
    self.htPayButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBlack];
    self.htPayButton.backgroundColor = [UIColor colorGradientChangeWithSize:CGSizeMake(SCREEN_WIDTH-47, 44) andDirection:0 andStartColor:[UIColor ht_colorWithHexString:@"#EDC391"] andEndColor:[UIColor ht_colorWithHexString:@"#FDDDB7"]];
    self.htPayButton.layer.cornerRadius = 22;
    [[self.htPayButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        id data = [[self ht_currentArray] objectAtIndex:self.selectedIndex];
        if ([data isKindOfClass:[NSDictionary class]]) {
            // 假卡片
            NSInteger count = [[data objectForKey:AsciiString(@"c1")] integerValue];
            HTToolSubscribeAlertView *view = [[HTToolSubscribeAlertView alloc] init];
            BOOL var_activity = [[data objectForKey:AsciiString(@"activity")] boolValue];
            if (count < 30) {
                //埋点
                [self lgjeropj_clickMaidian:42 type:var_activity ? 2 : (self.htFamilyButton.selected ? 3 : 1)];
                [view lgjeropj_show:data source:self.htFamilyButton.selected ? 4 : 3];
            } else if (count == 30) {
                //埋点
                [self lgjeropj_clickMaidian:38 type:var_activity ? 2 : (self.htFamilyButton.selected ? 3 : 1)];
                [view lgjeropj_show:data source:self.htFamilyButton.selected ? 5 : 1];
            } else {
                //埋点
                [self lgjeropj_clickMaidian:39 type:var_activity ? 2 : (self.htFamilyButton.selected ? 3 : 1)];
                [view lgjeropj_show:data source:self.htFamilyButton.selected ? 6 : 2];
            }
        } else {
            SKProduct *model = (SKProduct *)data;
            if([HTPremiumNewCardItem lgjeropj_isFreeMonth:model]) {
                // 购买免费月
                [self lgjeropj_clickMaidian:34 type:1];
                SKProduct *var_freeMonth = [HTSubscribeConvert ht_getProductWithId: HT_IPA_Free_Month];
                [HTSubscribeUtils ht_startBuyProduct:var_freeMonth andDoneBlock:^(BOOL var_buySuccess) {
                    if(var_buySuccess) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"udf_showFreeMonth"];
                            [[NSUserDefaults standardUserDefaults] synchronize];
                        });
                    }
                }];
            } else {
                [self ht_handGetPreminumButtonActionWithModel:model];
            }
        }
    }];
    [self.scrollView addSubview:self.htPayButton];
    [self.htPayButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainCollectionView.mas_bottom).offset(58);
        make.left.mas_equalTo(23.5);
        make.right.mas_equalTo(-23.5);
        make.height.mas_equalTo(44);
    }];

    kself
    YYLabel *restoreLabel = [[YYLabel alloc] initWithFrame:CGRectZero];
    [self.scrollView addSubview:restoreLabel];
    [restoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.htPayButton.mas_bottom).offset(24);
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
    }];
    NSString *detail = [NSString stringWithFormat:@"%@%@", LocalString(@"If the ad still appears after purchase,", nil), LocalString(@"tap Restore.", nil)];
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithString:detail];
    textString.yy_color = [UIColor ht_colorWithHexString:@"#CCCCCC"];
    textString.yy_font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    textString.yy_lineSpacing = 3;
    textString.yy_alignment = NSTextAlignmentCenter;
    NSRange range1 = [detail rangeOfString:LocalString(@"tap Restore.", nil)];
    [textString yy_setUnderlineColor:[UIColor whiteColor] range:range1];
    [textString yy_setUnderlineStyle:(NSUnderlineStyleSingle) range:range1];
    [textString yy_setTextHighlightRange:range1 color:[UIColor whiteColor] backgroundColor:nil tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        [weakSelf lgjeropj_restoreAction];
    }];
    restoreLabel.attributedText = textString;
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectZero];
    line.backgroundColor = [[UIColor ht_colorWithHexString:@"#ffffff"] colorWithAlphaComponent:0.1];
    [self.scrollView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(restoreLabel.mas_bottom).offset(23);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    HTSubscribeRemakView *remakView = [[HTSubscribeRemakView alloc] init];
    [self.scrollView addSubview:remakView];
    [remakView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).offset(20);
        make.right.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
        
    self.emptyView = [[HTPremiumEmptyView alloc] init];
    self.emptyView.hidden = YES;
    self.emptyView.emptyBlock = ^{
        @strongify(self);
        // 导量 下架后无产品时显示
        NSDictionary *var_dataDict = [HTCommonConfiguration lgjeropj_shared].BLOCK_gdBlock();
        NSString *var_yumingStr = var_dataDict[AsciiString(@"l1")];
        NSURL *var_linkURL = [NSURL URLWithString:var_dataDict[AsciiString(@"link")]];
        if (var_yumingStr && var_yumingStr.length > 0) {
            var_linkURL = [self lgjeropj_guideDynamiclink:var_dataDict];
        }
        [[UIApplication sharedApplication] openURL:var_linkURL options:@{} completionHandler:^(BOOL success) {}];
    };

    [self.scrollView addSubview:self.emptyView];
    [self.emptyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.htIndividualButton);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}

- (void)lgjeropj_restoreAction {
    
    [self lgjeropj_clickMaidian:5 type:0];
    [HTSubscribeUtils ht_reStoreAndDoneBlock:^(BOOL var_buySuccess) {
        
    }];
}

- (NSURL *)lgjeropj_guideDynamiclink:(NSDictionary *)data
{
    NSMutableDictionary *params = [LKFPrivateFunction lgjeropj_getVipParams];
    [params setValue:@"2" forKey:AsciiString(@"type")];
    [params setValue:[data objectForKey:AsciiString(@"l2")] forKey:@"var_shopLink"];
    [params setValue:[data objectForKey:AsciiString(@"a1")] forKey:@"var_targetBundle"];
    [params setValue:[data objectForKey:AsciiString(@"l1")] forKey:@"var_targetLink"];
    [params setValue:[data objectForKey:AsciiString(@"k2")] forKey:@"var_dynamicK2"];
    [params setValue:[data objectForKey:AsciiString(@"c4")] forKey:@"var_dynamicC4"];
    [params setValue:[data objectForKey:AsciiString(@"c5")] forKey:@"var_dynamicC5"];
    [params setValue:[data objectForKey:AsciiString(@"logo")] forKey:@"var_dynamicLogo"];
    return [HTCommonConfiguration lgjeropj_shared].BLOCK_deepLinkBlock(params);
}

- (void)lgjeropj_interestView {
    
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj && obj.tag >= 321000 && [obj isKindOfClass:[UIButton class]]) {
            [obj removeFromSuperview];
        }
    }];
    NSMutableArray *array = @[LocalString(@"Remove ads", nil), LocalString(@"Unlock all movies", nil), LocalString(@"HD Resources", nil), LocalString(@"Unlimited Screen Casting", nil)].mutableCopy;
    if (self.htFamilyButton.selected) {
        [array addObject:LocalString(@"Up To 5 Members", nil)];
    }
    for (int i = 0; i < array.count; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.tag = 321000+i;
        button.userInteractionEnabled = NO;
        button.titleLabel.numberOfLines = 2;
        [button setTitle:array[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [button setTitleColor:[UIColor ht_colorWithHexString:@"#EAE9EE"] forState:UIControlStateNormal];
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [button sd_setImageWithURL:kImageNumber(212) forState:UIControlStateNormal];
        [self.scrollView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.htIndividualButton.mas_bottom).offset(8+38*(i/2));
            make.left.mas_equalTo(25+SCREEN_WIDTH/2*(i%2));
            make.width.mas_equalTo(SCREEN_WIDTH/2-30);
            make.height.mas_equalTo(38);
        }];
        if (i == [array count] - 1) {
            [self.mainCollectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(button.mas_bottom).offset(10);
                make.left.right.mas_equalTo(0);
                make.height.mas_equalTo(kWidthScale(145));
            }];
        }
    }
}

- (NSString *)lgjeropj_textForProduct:(NSString *)identifier {
    
    if ([identifier containsString:AsciiString(@"week")] || [identifier containsString:AsciiString(@"fw")]) {
        return AsciiString(@"Week");
    } else if ([identifier containsString:AsciiString(@"month")] || [identifier containsString:AsciiString(@"fm")]) {
        return AsciiString(@"Month");
    } else if ([identifier containsString:AsciiString(@"year")] || [identifier containsString:AsciiString(@"fy")]) {
        return AsciiString(@"Year");
    }
    return @"";
}

- (void)lgjeropj_refreshWithIndex:(NSInteger)index {
    
    if ([self ht_currentArray].count > index) {
        id data = [self ht_currentArray][index];
        BOOL var_fake = [data isKindOfClass:[NSDictionary class]];
        if (var_fake) {
            // 假卡片
            BOOL var_activity = [[data objectForKey:AsciiString(@"activity")] boolValue];
            if (var_activity) {
                [self.htPayButton setTitle:[NSString stringWithFormat:@"%@%@ %@ %@ %@", [data objectForKey:@"d1"], [data objectForKey:AsciiString(@"h1")], AsciiString(@"First"), [self lgjeropj_textForProduct:[data objectForKey:AsciiString(@"product")]], AsciiString(@"Trial")] forState:UIControlStateNormal];
            } else {
                NSString *var_trialPrice = [data objectForKey:AsciiString(@"h1")];
                NSString *var_trialEndPrice = [data objectForKey:AsciiString(@"h2")];
                if (![var_trialPrice isEqualToString:var_trialEndPrice] && var_trialPrice.length > 0) {
                    [self.htPayButton setTitle:[NSString stringWithFormat:@"%@%@ %@ %@ %@", [data objectForKey:@"d1"], [data objectForKey:AsciiString(@"h1")], AsciiString(@"First"), [self lgjeropj_textForProduct:[data objectForKey:AsciiString(@"product")]], AsciiString(@"Trial")] forState:UIControlStateNormal];
                } else {
                    [self.htPayButton setTitle:[NSString stringWithFormat:@"%@ %@%@", AsciiString(@"Pay"), [data objectForKey:@"d1"], [data objectForKey:@"h2"]] forState:UIControlStateNormal];
                }
            }
            NSString *string = [data objectForKey:AsciiString(@"t1")];
            if (string.length > 0) {
                NSString *var_cancel = LocalString(@"Cancel Anytime", nil);
                string = [NSString stringWithFormat:@"%@ %@ %@", @"*", string, var_cancel];
                NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:string];
                [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor ht_colorWithHexString:@"#3CDEF4"] range:NSMakeRange(0, string.length-var_cancel.length)];
                [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor ht_colorWithHexString:@"#999999"] range:NSMakeRange(string.length-var_cancel.length, var_cancel.length)];
                [attribute addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12 weight:UIFontWeightBold] range:NSMakeRange(0, string.length-var_cancel.length)];
                [attribute addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12 weight:UIFontWeightRegular] range:NSMakeRange(string.length-var_cancel.length, var_cancel.length)];
                self.htHintLabel.attributedText = attribute;
            } else {
                NSString *var_cancel = LocalString(@"Cancel Anytime", nil);
                NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:var_cancel];
                [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor ht_colorWithHexString:@"#999999"] range:NSMakeRange(0, var_cancel.length)];
                [attribute addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12 weight:UIFontWeightRegular] range:NSMakeRange(0, var_cancel.length)];
                self.htHintLabel.attributedText = attribute;
            }
        } else {
            // 真实商品
            SKProduct *product = (SKProduct *)data;
            BOOL var_hadPurchased = [HTSubscribeConvert lgjeropj_checkrReceiptInfo];
            BOOL var_first = product.introductoryPrice && !var_hadPurchased;
            NSString *var_price = [NSString stringWithFormat:@"%.2f", (var_first ? product.introductoryPrice.price.floatValue : product.price.floatValue)];
            if ([var_price integerValue] == 0) {
                var_price = LocalString(@"Free", nil);
                [self.htPayButton setTitle:[NSString stringWithFormat:@"%@ %@", AsciiString(@"Pay"), LocalString(@"Free", nil)] forState:UIControlStateNormal];
            } else {
                [self.htPayButton setTitle:[NSString stringWithFormat:@"%@ %@%@", AsciiString(@"Pay"), AsciiString(@"$"), var_price] forState:UIControlStateNormal];
            }
            NSString *var_id = product.productIdentifier;
            NSString *var_time = @"";
            if ([var_id containsString:HT_IPA_Week] || [var_id containsString:HT_IPA_Family_Week]) {
                var_time = AsciiString(@"week");
            } else if ([var_id containsString:HT_IPA_Month] || [var_id containsString:HT_IPA_Family_Month] || [var_id containsString:HT_IPA_Free_Month]) {
                var_time = AsciiString(@"month");
            } else if ([var_id containsString:HT_IPA_Year] || [var_id containsString:HT_IPA_Family_Year]) {
                var_time = AsciiString(@"year");
            }
            NSString *string = @"";
            if (var_first) {
                if ([var_price isEqualToString:LocalString(@"Free", nil)]) {
                    string = [NSString stringWithFormat:@"%@ %@ %@ %@%@ %@ %@%.2f", @"*", var_price, AsciiString(@"for the 1st"), var_time, @".", AsciiString(@"Next recurring annual renewal will be"), AsciiString(@"$"), product.price.floatValue];
                } else {
                    string = [NSString stringWithFormat:@"%@ %@%@ %@ %@%@ %@ %@%.2f", @"*", AsciiString(@"$"), var_price, AsciiString(@"for the 1st"), var_time, @".", AsciiString(@"Next recurring annual renewal will be"), AsciiString(@"$"), product.price.floatValue];
                }
            } else {
                string = [NSString stringWithFormat:@"%@ %@ %@%@ %@ %@", @"*", AsciiString(@"Auto-renewal for"), AsciiString(@"$"), var_price, AsciiString(@"per"), var_time];
            }
            NSString *var_cancel = LocalString(@"you can cancel anytime", nil);
            string = [NSString stringWithFormat:@"%@%@ %@", string, @",", var_cancel];
            NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:string];
            [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor ht_colorWithHexString:@"#3CDEF4"] range:NSMakeRange(0, string.length-var_cancel.length)];
            [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor ht_colorWithHexString:@"#999999"] range:NSMakeRange(string.length-var_cancel.length, var_cancel.length)];
            [attribute addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12 weight:UIFontWeightBold] range:NSMakeRange(0, string.length-var_cancel.length)];
            [attribute addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12 weight:UIFontWeightRegular] range:NSMakeRange(string.length-var_cancel.length, var_cancel.length)];
            self.htHintLabel.attributedText = attribute;
        }
    }
}

- (NSURL *)lgjeropj_createDynamiclink:(NSDictionary *)data {
    
    NSMutableDictionary *params = [LKFPrivateFunction lgjeropj_getVipParams];
    // type
    [params setValue:@"2" forKey:AsciiString(@"type")];
    // 导量
    [params setValue:[data objectForKey:AsciiString(@"l2")] forKey:@"var_shopLink"];
    [params setValue:[data objectForKey:AsciiString(@"a1")] forKey:@"var_targetBundle"];
    [params setValue:[data objectForKey:AsciiString(@"l1")] forKey:@"var_targetLink"];
    [params setValue:[data objectForKey:AsciiString(@"k2")] forKey:@"var_dynamicK2"];
    [params setValue:[data objectForKey:AsciiString(@"c4")] forKey:@"var_dynamicC4"];
    [params setValue:[data objectForKey:AsciiString(@"c5")] forKey:@"var_dynamicC5"];
    [params setValue:[data objectForKey:AsciiString(@"logo")] forKey:@"var_dynamicLogo"];
    return [HTCommonConfiguration lgjeropj_shared].BLOCK_deepLinkBlock(params);
}

//
- (void)lgjeropj_reloadVipStatus
{
    [self.headerView lgjeropj_refresh];
    HTAccountModel *accountResult = [HTAccountModel sharedInstance];
    if ([accountResult ht_isVip] && [accountResult var_isLogin] && [accountResult.var_familyPlanState isEqualToString:@"1"]) {
        [self.headerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(8);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(92+44);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
    } else {
        [self.headerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(8);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(92);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self ht_currentArray].count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HTPremiumNewCardItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HTPremiumNewCardItem class]) forIndexPath:indexPath];
    [cell lgjeropj_updateCellWithData:[self ht_currentArray][indexPath.row] selected:self.selectedIndex == indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selectedIndex = indexPath.row;
    [self.mainCollectionView reloadData];
    [self lgjeropj_refreshWithIndex:self.selectedIndex];
}

#pragma mark - 添加成员
- (BOOL)ht_doublePremium {
    
    HTAccountModel *model = [HTAccountModel sharedInstance];
    return [model ht_isLocalVip] && ![model ht_isDeviceVip] && [model var_toolVip];
}

- (void)ht_showRemindIcon {
    
    BOOL var_show = [[NSUserDefaults standardUserDefaults] boolForKey:@"udf_remind_unsubscribe_icon"];
    if (!var_show) {
        return;
    }
    if ([self ht_doublePremium]) {
        // 既是本地vip 又是工具包vip 且不是绑定在设备上
        UIButton *rightView = [[UIButton alloc] init];
        rightView.frame = CGRectMake(0, 0, 44, 44);
        @weakify(self);
        [[rightView rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"udf_remind_unsubscribe_red"];
            HTUnSubscribeRemindView *view = [[HTUnSubscribeRemindView alloc] init];
            [view lgjeropj_show];
            [self ht_showRemindIcon];
            // 埋点
            NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
            [params setValue:@(44) forKey:AsciiString(@"source")];
            [params setValue:@(46) forKey:@"kid"];
            [HTPointEventManager ht_eventWithCode:@"vip_cl" andParams:params];
        }];
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:kImageNumber(248)];
        [rightView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(29, 24));
        }];
        BOOL var_show_red = [[NSUserDefaults standardUserDefaults] boolForKey:@"udf_remind_unsubscribe_red"];
        if (!var_show_red) {
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = [UIColor redColor];
            view.layer.cornerRadius = 3;
            view.layer.masksToBounds = YES;
            [rightView addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.right.equalTo(imageView);
                make.size.mas_equalTo(6);
            }];
        }
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    }
}

- (void)ht_showUnsubscribeAlertView {
    
    BOOL var_reminded = [[NSUserDefaults standardUserDefaults] boolForKey:@"udf_remind_unsubscribe"];
    if (var_reminded) {
        // 弹过就不弹了
        return;
    }
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"udf_remind_unsubscribe"];
    if ([self ht_doublePremium]) {
        // 既是本地vip 又是工具包vip 且不是绑定在设备上
        HTUnSubscribeRemindView *view = [[HTUnSubscribeRemindView alloc] init];
        __weak typeof(self) weakSelf = self;
        view.block = ^() {
            // skip 显示右上角icon
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"udf_remind_unsubscribe_icon"];
            [weakSelf ht_showRemindIcon];
        };
        [view lgjeropj_show];
    }
}


#pragma mark - 埋点
- (void)lgjeropj_showMaidian:(NSInteger)type {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@(type) forKey:AsciiString(@"type")];
    [params setValue:@(self.source) forKey:AsciiString(@"source")];
    if ([[HTToolKitManager shared] lgjeropj_strip_k12] > 0) {
        [params setValue:@"3" forKey:AsciiString(@"pay_method")];
    } else {
        [params setValue:@"2" forKey:AsciiString(@"pay_method")];
    }
    [params setValue:@"1" forKey:AsciiString(@"status")];
    [HTPointEventManager ht_eventWithCode:@"vip_sh" andParams:params];
}

- (void)lgjeropj_clickMaidian:(NSInteger)kid type:(NSInteger)type {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@(kid) forKey:@"kid"];
    if (type > 0) {
        [params setValue:@(type) forKey:AsciiString(@"type")];
    }
    [params setValue:@(self.source) forKey:AsciiString(@"source")];
    if ([[HTToolKitManager shared] lgjeropj_strip_k12] > 0) {
        [params setValue:@"3" forKey:AsciiString(@"pay_type")];
    } else {
        [params setValue:@"2" forKey:AsciiString(@"pay_type")];
    }
    [params setValue:@"1" forKey:AsciiString(@"status")];
    [HTPointEventManager ht_eventWithCode:@"vip_cl" andParams:params];
}

#pragma mark - 订阅点击
- (void)ht_handGetPreminumButtonActionWithModel:(SKProduct *)model {
    
    if ([model.productIdentifier containsString:AsciiString(@"family")]) {
        // 家庭计划需要先登录
        [HTCommonConfiguration lgjeropj_shared].BLOCK_toLoginBlock(5);
        return;
    }
    if (model.introductoryPrice && [HTSubscribeConvert lgjeropj_checkrReceiptInfo]) {
        [self lgjeropj_clickMaidian:9 type:[model.productIdentifier containsString:AsciiString(@"family")] ? 3 : 1];
    } else if ([model.productIdentifier isEqualToString:HT_IPA_Month]) {
        [self lgjeropj_clickMaidian:2 type:1];
    } else if ([model.productIdentifier isEqualToString:HT_IPA_Week]) {
        [self lgjeropj_clickMaidian:7 type:1];
    } else if ([model.productIdentifier isEqualToString:HT_IPA_Year]) {
        [self lgjeropj_clickMaidian:3 type:1];
    } else if ([model.productIdentifier isEqualToString:HT_IPA_Family_Month]) {
        [self lgjeropj_clickMaidian:2 type:3];
    } else if ([model.productIdentifier isEqualToString:HT_IPA_Family_Week]) {
        [self lgjeropj_clickMaidian:7 type:3];
    } else if ([model.productIdentifier isEqualToString:HT_IPA_Family_Year]) {
        [self lgjeropj_clickMaidian:3 type:3];
    }
    [HTSubscribeUtils ht_startBuyProduct:model andDoneBlock:^(BOOL var_buySuccess) {
        
    }];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kWidthScale(108), kWidthScale(140));
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 16, 0, 16);
}

- (UICollectionView *)mainCollectionView{
    if(!_mainCollectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 12;
        layout.minimumInteritemSpacing = 10;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.backgroundColor = [UIColor clearColor];
        collectionView.contentInset = UIEdgeInsetsMake(4, 0, 0, 0);
        collectionView.showsHorizontalScrollIndicator = NO;
        //注册 item
        [collectionView registerClass:[HTPremiumNewCardItem class] forCellWithReuseIdentifier:NSStringFromClass([HTPremiumNewCardItem class])];
        _mainCollectionView = collectionView;
    }
    return _mainCollectionView;
}

- (HTSubscribeViewModel *)viewModel {
    
    if (!_viewModel) {
        _viewModel = [[HTSubscribeViewModel alloc] init];
    }
    return _viewModel;
}

@end
