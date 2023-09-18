//
//  HTRemindAddFamilyMemberView.m
//  Ziven
//
//  Created by 李雪健 on 2023/5/29.
//

#import "HTRemindAddFamilyMemberView.h"
#import "HTToolKitManager.h"

@interface HTRemindAddFamilyMemberView ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UIButton *skipButton;

@end

@implementation HTRemindAddFamilyMemberView

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = AsciiString(@"Add Your Family Members");
        _titleLabel.textColor = [UIColor ht_colorWithHexString:@"#FFD29D"];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.text = AsciiString(@"Enjoy The Premium Journey With Your Family");
        _contentLabel.textColor = [UIColor ht_colorWithHexString:@"#999999"];
        _contentLabel.font = [UIFont boldSystemFontOfSize:14];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (UIButton *)addButton {
    
    if (!_addButton) {
        _addButton = [[UIButton alloc] init];
        _addButton.backgroundColor = [UIColor ht_colorWithHexString:@"#FDDDB7"];
        _addButton.layer.masksToBounds = YES;
        _addButton.layer.cornerRadius = 22;
        [_addButton setTitle:AsciiString(@"Add Now") forState:UIControlStateNormal];
        [_addButton setTitleColor:[UIColor ht_colorWithHexString:@"#685034"] forState:UIControlStateNormal];
        _addButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_addButton addTarget:self action:@selector(lgjeropj_addAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
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
 
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor ht_colorWithHexString:@"#292A2F"];
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 16;
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(300);
    }];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView sd_setImageWithURL:kImageNumber(265)];
    imageView.layer.cornerRadius = 12;
    imageView.layer.masksToBounds = YES;
    [self.contentView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(140);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(imageView.mas_bottom).offset(5);
        make.width.mas_lessThanOrEqualTo(270);
    }];
    
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.width.mas_lessThanOrEqualTo(270);
    }];
    
    [self.contentView addSubview:self.addButton];
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(44);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(238);
        make.height.mas_equalTo(44);
    }];
    
    [self.contentView addSubview:self.skipButton];
    [self.skipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addButton.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-20);
    }];
}

- (void)lgjeropj_show {
    
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

- (void)lgjeropj_addAction {
    
    if (self.block) {
        self.block();
    }
    [self lgjeropj_dismiss];
}

- (void)lgjeropj_skipAction {
    
    [self lgjeropj_dismiss];
}

@end
