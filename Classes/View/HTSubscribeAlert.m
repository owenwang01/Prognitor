//
//  HTSubscribeAlert.m
// 
//
//  Created by Apple on 2023/3/1.
//  Copyright © 2023 Apple. All rights reserved.
//

#import "HTSubscribeAlert.h"
#import "NSString+Extension.h"
#import "UIViewController+Navigation.h"
#import "UIView+Extension.h"

#define DEFAULT_ANIMATION_TIME 0.2
#define CONTENT_WIDTH 270


@interface HTSubscribeAlert ()

//内容视图
@property (nonatomic, strong) UIView *contentView;
//标题
@property (nonatomic, strong) UILabel *titleLabel;
//文字描述
@property (nonatomic, strong) UILabel *messageLabel;
//按钮
@property (nonatomic, strong) UIButton *cancelButton;
//按钮
@property (nonatomic, strong) UIButton *confirmButton;
//背景图片
@property (nonatomic, strong) UIImageView *imgView;
//钻图片
@property (nonatomic, strong) UIImageView *iconView;
@end


@implementation HTSubscribeAlert


+ (instancetype)shareInstance
{
    static HTSubscribeAlert *alert = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alert = [[HTSubscribeAlert alloc]init];
    });
    return alert;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self config];
    }
    return self;
}


- (void)config
{
    _message = LocalString(@"Month Free Premium For You", nil);
    _confirmTitle = LocalString(@"Receive", nil);
    _cancelTitle = LocalString(@"Give Up Discount", nil);
}

#pragma mark - 显示
- (void)ht_show
{
    [self lgjeropj_setupUI];
    
    self.hidden = NO;
    [UIView animateWithDuration:DEFAULT_ANIMATION_TIME animations:^{
        self.alpha = 1;
        self.contentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
    
    if ([NSString ht_isEmpty:self.cancelTitle] && [NSString ht_isEmpty:self.confirmTitle]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(( DEFAULT_ANIMATION_TIME) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self ht_dismiss];
        });
    }
}

- (void)ht_dismiss
{
    [UIView animateWithDuration:DEFAULT_ANIMATION_TIME animations:^{
        self.alpha = 0;
        self.contentView.transform = CGAffineTransformMakeScale(0.001, 0.001);
    } completion:^(BOOL finished) {
        self.hidden = YES;
        [self removeFromSuperview];
    }];
}

#pragma mark - 设置UI
- (void)lgjeropj_setupUI
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.frame = UIScreen.mainScreen.bounds;
    
    [[UIViewController lgjeropj_currentViewController].view addSubview:self];
    [[UIViewController lgjeropj_currentViewController].view bringSubviewToFront:self];
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    self.alpha = 0;
    
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.imgView];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.messageLabel];
    [self.contentView addSubview:self.cancelButton];
    [self.contentView addSubview:self.confirmButton];
    
    [self setConstraints];
    self.contentView.transform = CGAffineTransformMakeScale(0.001, 0.001);
    
    
    NSMutableAttributedString* tncString = [[NSMutableAttributedString alloc] initWithString:self.cancelTitle];
    [tncString addAttribute:NSUnderlineStyleAttributeName
                      value:@(NSUnderlineStyleSingle)
                      range:(NSRange){0,[tncString length]}];
    [tncString addAttribute:NSForegroundColorAttributeName value:[UIColor ht_colorWithHexString:@"#666666"]  range:NSMakeRange(0,[tncString length])];
    [tncString addAttribute:NSUnderlineColorAttributeName value:[UIColor ht_colorWithHexString:@"#666666"] range:(NSRange){0,[tncString length]}];
    [self.cancelButton setAttributedTitle:tncString forState:UIControlStateNormal];
    
    [self.confirmButton setTitle:self.confirmTitle forState:UIControlStateNormal];
    self.titleLabel.text = @"1";
    self.messageLabel.text = self.message;
    
    
}

- (void)setConstraints
{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.mas_equalTo(CONTENT_WIDTH);
        make.height.mas_equalTo(200);
    }];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(-20);
        make.left.equalTo(self.contentView).offset(25);
        make.right.equalTo(self.contentView).offset(-25);
        make.height.mas_equalTo(100);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(25);
        make.right.equalTo(self.contentView).offset(-25);
        make.top.equalTo(self.contentView).offset(-50);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView).offset(10);
        make.left.equalTo(self.imgView).offset(10);
    }];
    
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.left.equalTo(self.imgView).offset(10);
        make.right.equalTo(self.imgView).offset(-10);
    }];
    
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.confirmButton.mas_bottom).offset(15);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(20);
    }];
    
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(30);
        make.right.equalTo(self.contentView).offset(-30);
        make.top.equalTo(self.imgView.mas_bottom).offset(25);
        make.height.mas_equalTo(44);
    }];
    [self.confirmButton layoutIfNeeded];
    [UIView ht_gradientLayerForView:self.confirmButton andFromColor:[UIColor ht_colorWithHexString:@"#7775FF"] andToColor:[UIColor ht_colorWithHexString:@"#403DFF"] andDirection:ENUM_CMGradientDirectionHorizontal];
    
}

- (void)removeSubviews
{
    if (self.subviews.count) {
        for (UIView *view in self.subviews) {
            [view removeFromSuperview];
        }
    }
}

- (void)cancelButtonClick
{
    if (self.BLOCK_cancelClickBlock) {
        self.BLOCK_cancelClickBlock(self);
    }
    
    [self ht_dismiss];
}

- (void)confirmButtonClick
{
    if (self.BLOCK_confirmClickBlock) {
        self.BLOCK_confirmClickBlock(self);
    }
    
    [self ht_dismiss];
}


#pragma mark - lazy
- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.cornerRadius = 12;
//        _contentView.layer.masksToBounds = YES;
    }
    return _contentView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont boldSystemFontOfSize:40];
        _titleLabel.text  = @"1";
        _titleLabel.textColor = UIColor.whiteColor;
    }
    return _titleLabel;
}

- (UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [UILabel new];
        _messageLabel.numberOfLines = 0;
        _messageLabel.font = [UIFont systemFontOfSize:12];
        _messageLabel.textColor = UIColor.whiteColor;
    }
    return _messageLabel;
}

- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _cancelButton.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _cancelButton;
}

- (UIButton *)confirmButton
{
    if (!_confirmButton) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_confirmButton addTarget:self action:@selector(confirmButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _confirmButton.layer.cornerRadius = 12;
        _confirmButton.layer.masksToBounds = YES;
        _confirmButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _confirmButton;
}

- (UIImageView *)imgView
{
    if(!_imgView){
        _imgView = [UIImageView new];
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        [_imgView sd_setImageWithURL:kImageNumber(246)];
    }
    return _imgView;
}

- (UIImageView *)iconView
{
    if(!_iconView){
        _iconView = [UIImageView new];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
        [_iconView sd_setImageWithURL:kImageNumber(247)];
    }
    return _iconView;
}

- (void)dealloc {
    NSLog(@"♦️dealloc♦️ %@ '%@'", NSStringFromSelector(_cmd), self.class);
}


@end

