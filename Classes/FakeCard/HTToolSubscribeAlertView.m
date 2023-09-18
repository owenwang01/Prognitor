//
//  HTToolSubscribeAlertView.m
//  Ziven
//
//  Created by 李雪健 on 2023/5/29.
//

#import "HTToolSubscribeAlertView.h"
#import "HTToolKitManager.h"
#import "HTToolSubscribeManager.h"
#import "HTPointEventManager.h"
#import "HTCommonConfiguration.h"

@interface HTToolSubscribeAlertView ()

@property (nonatomic, assign) NSInteger source;
@property (nonatomic, strong) NSDictionary *var_params;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *installButton;
@property (nonatomic, strong) UIButton *skipButton;
@property (nonatomic, strong) UILabel *toastLabel;

@end

@implementation HTToolSubscribeAlertView

- (UIView *)contentView {
    
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor ht_colorWithHexString:@"#292A2F"];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 12;
    }
    return _contentView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = [LocalString(@"Subscribe at XXX to become PREM", nil) stringByReplacingOccurrencesOfString:AsciiString(@"XXX") withString:[[[HTToolKitManager shared] lgjeropj_strip_p1] objectForKey:AsciiString(@"t1")] ?: @""];
        _titleLabel.textColor = [UIColor ht_colorWithHexString:@"#FFD29D"];
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}

- (UIButton *)installButton {
    
    if (!_installButton) {
        _installButton = [[UIButton alloc] init];
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = CGRectMake(0, 0, 238, 44);
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1, 0);
        gradientLayer.colors = @[(__bridge id)[UIColor ht_colorWithHexString:@"#EDC391"].CGColor, (__bridge id)[UIColor ht_colorWithHexString:@"#FDDDB7"].CGColor];
        [_installButton.layer addSublayer:gradientLayer];
        _installButton.layer.masksToBounds = YES;
        _installButton.layer.cornerRadius = 22;
        [_installButton setTitle:[[HTToolKitManager shared] lgjeropj_installed] ? AsciiString(@"Go Subscribe") : AsciiString(@"Install") forState:UIControlStateNormal];
        [_installButton setTitleColor:[UIColor ht_colorWithHexString:@"#685034"] forState:UIControlStateNormal];
        _installButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_installButton addTarget:self action:@selector(lgjeropj_subscribeAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _installButton;
}

- (UIButton *)skipButton {
    
    if (!_skipButton) {
        _skipButton = [[UIButton alloc] init];
        [_skipButton setTitle:LocalString(@"Later", nil) forState:UIControlStateNormal];
        [_skipButton setTitleColor:[UIColor ht_colorWithHexString:@"#999999"] forState:UIControlStateNormal];
        [_skipButton.titleLabel setFont:[UIFont systemFontOfSize:12.0]];
        [_skipButton.titleLabel setAttributedText:[[NSAttributedString alloc] initWithString:LocalString(@"Later", nil) attributes:@{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)}]];
        [_skipButton addTarget:self action:@selector(lgjeropj_skipAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _skipButton;
}

- (UILabel *)toastLabel {
    
    if (!_toastLabel) {
        _toastLabel = [[UILabel alloc] init];
        _toastLabel.text = [NSString stringWithFormat:@"%@%@", [LocalString(@"Proceeding to XXX to complete payment", nil) stringByReplacingOccurrencesOfString:AsciiString(@"XXX") withString:[[[HTToolKitManager shared] lgjeropj_strip_p1] objectForKey:AsciiString(@"t1")] ?: @""], @"..."];
        _toastLabel.textColor = [UIColor ht_colorWithHexString:@"#FFD770"];
        _toastLabel.font = [UIFont boldSystemFontOfSize:14];
        _toastLabel.textAlignment = NSTextAlignmentCenter;
        _toastLabel.numberOfLines = 0;
    }
    return _toastLabel;
}

- (void)lgjeropj_alertView {
    
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(300);
    }];
    
    NSDictionary *dic = [[HTToolKitManager shared] lgjeropj_strip_p1];
    NSString *var_gif = dic[AsciiString(@"gif")];
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:imageView];
    [imageView sd_setImageWithURL:[NSURL URLWithString:var_gif]];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(36);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(220);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(imageView.mas_bottom).offset(25);
    }];
    
    [self.contentView addSubview:self.installButton];
    [self.installButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(35);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(238);
        make.height.mas_equalTo(44);
    }];

    [self.contentView addSubview:self.skipButton];
    [self.skipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.installButton.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-20);
    }];
}

- (void)lgjeropj_toastView {
    
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor ht_colorWithHexString:@"#323232"];
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 12;
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(260);
        make.height.mas_equalTo(63);
    }];
    [self.contentView addSubview:self.toastLabel];
    [self.toastLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(240);
    }];
}

- (void)lgjeropj_show:(NSDictionary *)dic source:(NSInteger)source {
    
    [HTCommonConfiguration lgjeropj_shared].BLOCK_stopAdBlock(YES);
    self.source = source;
    self.var_params = dic;
    NSInteger var_count = [[NSUserDefaults standardUserDefaults] integerForKey:@"udf_toolkit_guide_count"];
    BOOL var_alert = var_count < 3;
    if (var_alert) {
        [self lgjeropj_show_maidian];
        [self lgjeropj_alertView];
        [[NSUserDefaults standardUserDefaults] setInteger:var_count+1 forKey:@"udf_toolkit_guide_count"];
    } else {
        [self lgjeropj_toastView];
    }

    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if ([self isDescendantOfView:window] == NO) {
        [window addSubview:self];
    }
    self.frame = [UIScreen mainScreen].bounds;
    self.contentView.alpha = 0;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    [self layoutIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.alpha = 1;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (!var_alert) {
            __weak typeof(self) weakSelf = self;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (weakSelf) {
                    [weakSelf lgjeropj_subscribeAction];
                }
            });
        }
    }];
}

- (void)lgjeropj_dismiss {
    
    [HTCommonConfiguration lgjeropj_shared].BLOCK_stopAdBlock(NO);
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.alpha = 0;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)lgjeropj_subscribeAction {
    
    [HTCommonConfiguration lgjeropj_shared].BLOCK_stopAdBlock(NO);
    [self lgjeropj_click_maidian:1];
    [HTToolSubscribeManager lgjeropj_subscribeAction:self.var_params];
    [self removeFromSuperview];
}

- (void)lgjeropj_skipAction {
    
    [self lgjeropj_click_maidian:2];
    [self lgjeropj_dismiss];
}

- (void)lgjeropj_click_maidian:(NSInteger)kid
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@(self.source) forKey:AsciiString(@"source")];
    [params setValue:@(kid) forKey:AsciiString(@"kid")];
    [HTPointEventManager ht_eventWithCode:@"tspop_cl" andParams:params];
}

- (void)lgjeropj_show_maidian
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@(self.source) forKey:AsciiString(@"source")];
    [HTPointEventManager ht_eventWithCode:@"tspop_sh" andParams:params];
}

@end
