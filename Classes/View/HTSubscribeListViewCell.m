//
//  HTSubscribeListViewCell.m
// 
//
//  Created by Apple on 2022/11/20.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTSubscribeListViewCell.h"
#import <StoreKit/StoreKit.h>
#import "HTSubscribeListCellManager.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "HTSubscribeConvert.h"

@interface HTSubscribeListViewCell ()

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *trialLabel;
@property (nonatomic, strong) UILabel *originPriceLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *priceRemarkLabel;
@property (nonatomic, strong) UILabel *introduceLabel;
@property (nonatomic, strong) UILabel *discountNumLabel;
@property (nonatomic, strong) UILabel *discountLabel;
@property (nonatomic, strong) SKProduct *product;
@property (nonatomic, strong) UIButton *bestButton;
@property (nonatomic, strong) UILabel *unitLabel;
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *getPreminumButton;

@end

@implementation HTSubscribeListViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self ht_addCellSubviews];
    }
    return self;
}

- (void)ht_addCellSubviews {
    
    self.backgroundColor = [UIColor clearColor];
    self.backGroundView = [HTSubscribeListCellManager lgjeropj_backgroundView];
    [self.contentView addSubview:self.backGroundView];
    [self.backGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    self.trialLabel = [HTSubscribeListCellManager lgjeropj_trialView];
    [self.backGroundView addSubview:self.trialLabel];
    [self.trialLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(69, 24));
    }];
    
    self.originPriceLabel = [HTSubscribeListCellManager lgjeropj_originPriceLabel];
    [self.backGroundView addSubview:self.originPriceLabel];
    [self.originPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.inset(8);
        make.top.mas_equalTo(16);
    }];
    
    self.timeLabel = [HTSubscribeListCellManager lgjeropj_timeLabel];
    self.timeLabel.text = LocalString(@"Monthly", nil);
    [self.backGroundView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(16);
    }];
    
    self.lineView = [HTSubscribeListCellManager lgjeropj_lineView];
    [self.backGroundView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(.5);
        make.top.equalTo(self.timeLabel.mas_bottom).offset(8);
    }];
    
    self.unitLabel = [HTSubscribeListCellManager lgjeropj_unitLabel];
    [self.backGroundView addSubview:self.unitLabel];
    [self.unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self.lineView.mas_bottom).offset(16);
    }];
    
    self.priceLabel = [HTSubscribeListCellManager lgjeropj_priceLabel];
    self.priceLabel.text = AsciiString(@"2.99");
    [self.backGroundView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.unitLabel.mas_right).offset(0);
        make.top.equalTo(self.lineView.mas_bottom).offset(16);
    }];
    
    self.priceRemarkLabel = [HTSubscribeListCellManager lgjeropj_priceRemarkLabel];
    self.priceRemarkLabel.text = LocalString(@"for the 1 month", nil);
    [self.backGroundView addSubview:self.priceRemarkLabel];
    [self.priceRemarkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLabel.mas_right).offset(5);
        make.top.equalTo(self.priceLabel.mas_top);
        make.bottom.equalTo(self.priceLabel.mas_bottom);
        make.right.mas_equalTo(-12);
    }];
    
    self.introduceLabel = [HTSubscribeListCellManager lgjeropj_introduceLabel];
    NSString *messageString = LocalString(@"Then %@%@/%@ After Trial Ends.", nil);
    self.introduceLabel.text = [NSString stringWithFormat:messageString,AsciiString(@"$"), AsciiString(@"4.99"), LocalString(@"month", nil)];
    self.introduceLabel.hidden = YES;
    [self.backGroundView addSubview:self.introduceLabel];
    [self.introduceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self.priceLabel.mas_bottom).offset(5);
        make.right.mas_equalTo(-12);
    }];
    
    self.discountNumLabel = [HTSubscribeListCellManager lgjeropj_discountNumLabel];
    self.discountNumLabel.text = AsciiString(@"-71%");
    self.discountNumLabel.hidden = YES;
    [self.backGroundView addSubview:self.discountNumLabel];
    [self.discountNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self.priceLabel.mas_bottom).offset(5);
        make.width.mas_equalTo(44);
    }];
    
    self.discountLabel = [HTSubscribeListCellManager lgjeropj_discountLabel];
    self.discountLabel.text = AsciiString(@"Discount");
    self.discountLabel.hidden = YES;
    [self.backGroundView addSubview:self.discountLabel];
    [self.discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.discountNumLabel.mas_right);
        make.top.equalTo(self.discountNumLabel.mas_top);
        make.bottom.equalTo(self.discountNumLabel.mas_bottom);
        make.width.mas_equalTo(60);
    }];
    
    self.getPreminumButton = [HTSubscribeListCellManager lgjeropj_premiumButton];
    [self.backGroundView addSubview:self.getPreminumButton];
    [self.getPreminumButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(11);
        make.right.mas_equalTo(-11);
        make.bottom.mas_equalTo(-11);
        make.height.mas_equalTo(32);
    }];
    __weak typeof(self) weakSelf = self;
    [[self.getPreminumButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        if(weakSelf.BLOCK_preminumButtonActionBlock){
            weakSelf.BLOCK_preminumButtonActionBlock(weakSelf.product);
        }
    }];
    
    self.bestButton = [HTSubscribeListCellManager lgjeropj_bestButton];
    NSString *bestTitle = LocalString(@"Your Best Choice", nil);
    [self.bestButton setTitle:bestTitle forState:UIControlStateNormal];
    CGFloat bestWidth = [self.bestButton.titleLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, 11)].width;
    [self.contentView addSubview:self.bestButton];
    [self.bestButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.getPreminumButton);
        make.bottom.mas_equalTo(self.getPreminumButton.mas_top).offset(5);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(bestWidth + 15);
    }];
}

- (void)lgjeropj_changeColor:(BOOL)white
{
    if(white) {
        self.unitLabel.textColor = [UIColor whiteColor];
        self.timeLabel.textColor = [UIColor whiteColor];
        self.priceLabel.textColor = [UIColor whiteColor];
        self.priceRemarkLabel.textColor = [UIColor whiteColor];
        self.introduceLabel.textColor = [UIColor whiteColor];
        self.originPriceLabel.textColor = [UIColor whiteColor];
    } else {
        self.unitLabel.textColor = [UIColor ht_colorWithHexString:@"#685034"];
        self.timeLabel.textColor =  [UIColor ht_colorWithHexString:@"#685034"];
        self.priceLabel.textColor =  [UIColor ht_colorWithHexString:@"#685034"];
        self.priceRemarkLabel.textColor =  [UIColor ht_colorWithHexString:@"#685034"];
        self.introduceLabel.textColor =  [UIColor ht_colorWithHexString:@"#685034"];
        self.originPriceLabel.textColor =  [UIColor ht_colorWithHexString:@"#685034"];
    }
}

- (void)ht_updateCellWithData:(SKProduct *)model{
    self.product = model;
    self.backGroundView.backgroundColor = [UIColor ht_colorWithHexString:@"#2F2F43"];
    [self lgjeropj_changeColor:YES];

    self.bestButton.hidden = YES;
    self.unitLabel.hidden = NO;

    if(![model isKindOfClass:[SKProduct class]] && [model isKindOfClass:[NSDictionary class]]) {
                
        NSDictionary *localDict = (NSDictionary *)model;
        if([localDict[@"type"] intValue] == 3){
            //假卡片
            self.backGroundView.backgroundColor = [UIColor ht_colorWithHexString:@"#FDDDB8"];
            [self lgjeropj_changeColor:NO];
            NSInteger count = [localDict[@"count"] intValue];
            self.timeLabel.text = [HTSubscribeConvert lgjeropj_getLocalSubscripTitleWithCount:count];
            self.priceLabel.text = [NSString stringWithFormat:@"%@", localDict[AsciiString(@"tp")]];
            self.priceRemarkLabel.text = LocalString(@"for the 1 month", nil);

            
            NSString *messageString = LocalString(@"Then %@%@/%@ After Trial Ends.", nil);
            self.introduceLabel.text = [NSString stringWithFormat:messageString,localDict[@"unit"], localDict[AsciiString(@"price")], [HTSubscribeConvert lgjeropj_getLocalSubscripTitleWithCount:count]];
            self.introduceLabel.hidden = NO;
            self.bestButton.hidden = NO;
            self.trialLabel.hidden = NO;
            
            self.discountNumLabel.hidden = YES;
            self.discountLabel.hidden = YES;
            self.originPriceLabel.hidden = YES;
            
        }
    } else {
        //是否购买过,是否享受过trial
        BOOL var_hadPurchased = [HTSubscribeConvert lgjeropj_checkrReceiptInfo];
        NSString *var_timeText = [HTSubscribeConvert ht_getSubscriptiopPeriodWithUnit:model.subscriptionPeriod.unit andNumberOfUnits:model.subscriptionPeriod.numberOfUnits];
        self.timeLabel.text = var_timeText;
        NSString *priceText = [NSString stringWithFormat:@"%.2f", model.price.floatValue];
        self.priceLabel.text = priceText;
        self.originPriceLabel.hidden = YES;
        self.discountNumLabel.hidden = YES;
        self.discountLabel.hidden = YES;
        if([model.productIdentifier isEqualToString:HT_IPA_Week]){
            NSString *weekStr = [NSString stringWithFormat:@"%@ %@",@"/", LocalString(@"week", nil)];
            self.priceRemarkLabel.text = weekStr;
        }
        if([model.productIdentifier isEqualToString:HT_IPA_Month]){
            
            if(model.introductoryPrice && !var_hadPurchased){
                self.priceRemarkLabel.text = LocalString(@"for the 1 month", nil);
                if(var_hadPurchased){
                    NSString *var_yearStr = [NSString stringWithFormat:@"%@ %@",@"/", LocalString(@"month", nil)];
                    self.priceRemarkLabel.text = var_yearStr;
                }
            } else {
                [self lgjeropj_uiTypeWithProductType:1 andModel:model];
            }
            
        }
        if([model.productIdentifier isEqualToString:HT_IPA_Year]){
            [self lgjeropj_uiTypeWithProductType:2 andModel:model];
        }
        if(model.introductoryPrice && !var_hadPurchased){
            //试用价格
            self.trialLabel.hidden = NO;
            NSString *messageString = LocalString(@"Then %@%@/%@ After Trial Ends.", nil);
            self.introduceLabel.text = [NSString stringWithFormat:messageString,AsciiString(@"$"), priceText, var_timeText];
            NSString *priceText = [NSString stringWithFormat:@"%.2f", model.introductoryPrice.price.floatValue];
            self.priceLabel.text = priceText;
            self.discountNumLabel.hidden = YES;
            self.discountLabel.hidden = YES;
            self.introduceLabel.hidden = NO;
            self.originPriceLabel.hidden = YES;
            self.backGroundView.backgroundColor = [UIColor ht_colorWithHexString:@"#403DFF"];
            [self lgjeropj_changeColor:YES];
        }else{
            self.trialLabel.hidden = YES;
            self.introduceLabel.hidden = YES;
//            self.backGroundView.backgroundColor = [UIColor ht_colorWithHexString:@"#FDDDB8"];
        }
        //month判断-导量的免费月
        BOOL var_need = [self.class lgjeropj_isFreeMonth:model];
        if(var_need) {
            //
            self.backGroundView.backgroundColor = [UIColor ht_colorWithHexString:@"#403DFF"];
            [self lgjeropj_changeColor:YES];
            self.priceLabel.textColor = [UIColor ht_colorWithHexString:@"#FDDDB8"];
            self.priceRemarkLabel.textColor = [UIColor ht_colorWithHexString:@"#FDDDB8"];

            self.timeLabel.text = LocalString(@"Monthly", nil);
            self.priceLabel.text = LocalString(@"Free", nil);
            self.priceRemarkLabel.text = LocalString(@"for the 1 month", nil);
            self.introduceLabel.hidden = NO;
            NSString *messageString = LocalString(@"Then %@%@/%@ After Trial Ends.", nil);
            self.introduceLabel.text = [NSString stringWithFormat:messageString,AsciiString(@"$"), AsciiString(@"4.99"), LocalString(@"month", nil)];
            
            self.trialLabel.hidden = NO;
            self.unitLabel.hidden = YES;
        }
    }
}

+ (BOOL)lgjeropj_isFreeMonth:(SKProduct *)model
{
    BOOL var_showFree = [[NSUserDefaults standardUserDefaults] boolForKey:@"udf_showFreeMonth"];
    BOOL isMonth = [model.productIdentifier isEqualToString:HT_IPA_Month];
    return  isMonth && var_showFree;
}

//公共样式  type: 1:月订阅 2:年订阅
- (void)lgjeropj_uiTypeWithProductType:(NSInteger)type andModel:(SKProduct *)model
{
    NSInteger dayCount = type == 1 ? 30: 365;
    self.originPriceLabel.hidden = NO;
    self.discountNumLabel.hidden = NO;
    self.discountLabel.hidden = NO;
    NSString *var_yearStr = [NSString stringWithFormat:@"%@ %@",@"/", LocalString(@"month", nil)];
    if(type == 2){
        var_yearStr = [NSString stringWithFormat:@"%@ %@",@"/", LocalString(@"year", nil)];
    }
    self.priceRemarkLabel.text = var_yearStr;
    CGFloat dis = 1.99 / 7 * dayCount;
    SKProduct *product = [HTSubscribeConvert ht_getProductWithId:HT_IPA_Week];
    if(product){
        dis = product.price.floatValue / 7 * dayCount;
    }
    NSString *messageSing = LocalString(@"Price", nil);
    NSString *showDisText = [NSString stringWithFormat:AsciiString(@"%@:%@%.2f"), messageSing, AsciiString(@"$"), dis];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:showDisText];
    [attr addAttributes:@{
        NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle),
    } range:NSMakeRange(0, showDisText.length)];
    self.originPriceLabel.attributedText = attr;
    CGFloat disNum = (dis - model.price.floatValue) / dis;
    self.discountNumLabel.text = [NSString stringWithFormat:AsciiString(@"-%.0f%%"), disNum * 100];
    self.discountLabel.text = AsciiString(@"Discount");
}

@end
