//
//  HTFakeCardGuideView.m
//  Axcolly
//
//  Created by 李雪健 on 2023/7/4.
//

#import "HTFakeCardGuideView.h"
#import "HTToolKitManager.h"

@interface HTFakeCardGuideView ()

@property (nonatomic, strong) UIView *var_contentView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, copy) dispatch_block_t var_after;
@property (nonatomic, copy) BLOCK_VoidBlock installAction;
@property (nonatomic, copy) BLOCK_VoidBlock dismissAction;

@end

@implementation HTFakeCardGuideView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self lgjeropj_addSubViews];
    }
    return self;
}

- (void)lgjeropj_addSubViews {

    [self addTarget:self action:@selector(lgjeropj_dismissAction) forControlEvents:UIControlEventTouchUpInside];

    self.var_contentView = [[UIView alloc] init];
    self.var_contentView.backgroundColor = [UIColor ht_colorWithHexString:@"#292A2F"];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, SCREEN_WIDTH, 375) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(24, 24)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = CGRectMake(0, 0, SCREEN_WIDTH, 375);
    maskLayer.path = maskPath.CGPath;
    self.var_contentView.layer.mask = maskLayer;
    [self addSubview:self.var_contentView];
    
    self.imageView = [[UIImageView alloc] init];
    [self.var_contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(360);
        make.height.mas_equalTo(260);
    }];
    
    NSDictionary *dic = [[HTToolKitManager shared] lgjeropj_strip_p1];
    UILabel *var_payment = [[UILabel alloc] init];
    var_payment.text = [LocalString(@"Proceeding to XXX to complete payment", nil) stringByReplacingOccurrencesOfString:AsciiString(@"XXX") withString:dic[AsciiString(@"t1")] ?: @""];
    var_payment.textColor = [UIColor ht_colorWithHexString:@"#FFD770"];
    var_payment.font = [UIFont boldSystemFontOfSize:14];
    [self.var_contentView addSubview:var_payment];
    [var_payment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(self.imageView.mas_bottom).offset(20);
    }];
}

- (void)lgjeropj_showAction:(BLOCK_VoidBlock)installAction dismiss:(BLOCK_VoidBlock)dismissAction {
    
    self.installAction = installAction;
    self.dismissAction = dismissAction;
    
    UIView *var_super = [[UIApplication sharedApplication] keyWindow];
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [var_super addSubview:self];
    
    if (!self.var_after) {
        __weak typeof(self) weakSelf = self;
        self.var_after = dispatch_block_create(0, ^{
            if (weakSelf.installAction) {
                weakSelf.installAction();
            }
            [weakSelf removeFromSuperview];
        });
    }
    NSDictionary *dic = [[HTToolKitManager shared] lgjeropj_strip_p1];
    NSString *var_gif = dic[AsciiString(@"gif")];
    __weak typeof(self) weakSelf = self;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:var_gif] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        // 未释放
        if (weakSelf && weakSelf.var_after) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), weakSelf.var_after);
        }
    }];
    
    self.var_contentView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 375);
    [UIView animateWithDuration:0.2 animations:^{
        self.var_contentView.frame = CGRectMake(0, SCREEN_HEIGHT-375, SCREEN_WIDTH, 375);
    }];
}

- (void)lgjeropj_dismissAction {
    
    if (self.var_after) {
        dispatch_block_cancel(self.var_after);
        self.var_after = nil;
    }
    if (self.dismissAction) {
        self.dismissAction();
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.var_contentView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 334);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
