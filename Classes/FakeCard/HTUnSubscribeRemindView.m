//
//  HTUnSubscribeRemindView.m
//  Ziven
//
//  Created by 李雪健 on 2023/5/29.
//

#import "HTUnSubscribeRemindView.h"
#import "HTToolKitManager.h"
#import "HTNetworkApi.h"
#import "HTStringUtils.h"
#import "HTPointEventManager.h"

@interface HTUnSubscribeRemindView ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *titleLabel2;
@property (nonatomic, strong) UIButton *unsubscribeButton;
@property (nonatomic, strong) UIButton *skipButton;

@end

@implementation HTUnSubscribeRemindView

- (UIView *)contentView {
    
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor ht_colorWithHexString:@"#292A2F"];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 16;
    }
    return _contentView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = [AsciiString(@"You subscribed Both Premium in XXX") stringByReplacingOccurrencesOfString:AsciiString(@"XXX") withString:[[[HTToolKitManager shared] lgjeropj_strip_p1] objectForKey:AsciiString(@"t1")] ?: @""];
        _titleLabel.textColor = [UIColor ht_colorWithHexString:@"#FFD29D"];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _titleLabel;
}

- (UILabel *)titleLabel2 {
    
    if (!_titleLabel2) {
        _titleLabel2 = [[UILabel alloc] init];
        NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
        NSString *appName = infoDict[AsciiString(@"CFBundleDisplayName")];
        _titleLabel2.text = [AsciiString(@"and need to unsubscribe the single premium in XXX") stringByReplacingOccurrencesOfString:AsciiString(@"XXX") withString:appName ?: @""];
        _titleLabel2.textColor = [UIColor ht_colorWithHexString:@"#999999"];
        _titleLabel2.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel2.textAlignment = NSTextAlignmentCenter;
        _titleLabel2.numberOfLines = 0;
    }
    return _titleLabel2;
}

- (UIButton *)unsubscribeButton {
    
    if (!_unsubscribeButton) {
        _unsubscribeButton = [[UIButton alloc] init];
        _unsubscribeButton.backgroundColor = [UIColor ht_colorWithHexString:@"#FDDDB7"];
        _unsubscribeButton.layer.masksToBounds = YES;
        _unsubscribeButton.layer.cornerRadius = 22;
        [_unsubscribeButton setTitle:AsciiString(@"Unsubscribe") forState:UIControlStateNormal];
        [_unsubscribeButton setTitleColor:[UIColor ht_colorWithHexString:@"#685034"] forState:UIControlStateNormal];
        _unsubscribeButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_unsubscribeButton addTarget:self action:@selector(lgjeropj_subscribeAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _unsubscribeButton;
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

- (void)lgjeropj_alertView {
 
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(300);
    }];
    
    self.imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageView];
    [self.imageView sd_setImageWithURL:kImageNumber(248)];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(24);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(66);
        make.height.mas_equalTo(51);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(self.imageView.mas_bottom).offset(15);
        make.width.mas_lessThanOrEqualTo(270);
    }];
    
    [self.contentView addSubview:self.titleLabel2];
    [self.titleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.width.mas_lessThanOrEqualTo(270);
    }];
    
    [self.contentView addSubview:self.unsubscribeButton];
    [self.unsubscribeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel2.mas_bottom).offset(44);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(238);
        make.height.mas_equalTo(44);
    }];
    
    [self.contentView addSubview:self.skipButton];
    [self.skipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.unsubscribeButton.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-20);
    }];
}

- (void)lgjeropj_show {
    
    [self lgjeropj_show_maidian];
    [self lgjeropj_alertView];

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
    }];
}

- (void)lgjeropj_dismiss {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.alpha = 0;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)lgjeropj_subscribeAction {
    
    [self lgjeropj_click_maidian:47];
    [self lgjeropj_dismiss];
    NSURL *var_url = [NSURL URLWithString:AsciiString(@"https://apps.apple.com/account/subscriptions")];
    [[UIApplication sharedApplication] openURL:var_url options:@{} completionHandler:nil];
}

- (void)lgjeropj_skipAction {
    
    if (self.block) {
        self.block();
    }
    [self lgjeropj_click_maidian:48];
    [self lgjeropj_dismiss];
}

- (void)lgjeropj_click_maidian:(NSInteger)kid
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@(44) forKey:AsciiString(@"source")];
    [params setValue:@(kid) forKey:AsciiString(@"kid")];
    [HTPointEventManager ht_eventWithCode:@"vip_cl" andParams:params];
}

- (void)lgjeropj_show_maidian
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@(44) forKey:AsciiString(@"source")];
    [HTPointEventManager ht_eventWithCode:@"vip_sh" andParams:params];
}

@end
