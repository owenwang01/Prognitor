






#import "VrVisuallyReworkView.h"
#import "NlavndVasodilationManager.h"

@interface VrVisuallyReworkView ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *plsExhaustRootLabel;
@property (nonatomic, strong) UIButton *figrUnshiftLoop;
@property (nonatomic, strong) UIButton *skipButton;

@end

@implementation VrVisuallyReworkView

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = REMAND_WLESS((@[@386, @421, @421, @353, @410, @432, @438, @435, @353, @391, @418, @430, @426, @429, @442, @353, @398, @422, @430, @419, @422, @435, @436]));
        _titleLabel.textColor = [UIColor swipeScabiesNomad:@"#ffd19e"];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _titleLabel;
}

- (UILabel *)plsExhaustRootLabel {
    
    if (!_plsExhaustRootLabel) {
        _plsExhaustRootLabel = [[UILabel alloc] init];
        _plsExhaustRootLabel.text = REMAND_WLESS((@[@390, @431, @427, @432, @442, @353, @405, @425, @422, @353, @401, @435, @422, @430, @426, @438, @430, @353, @395, @432, @438, @435, @431, @422, @442, @353, @408, @426, @437, @425, @353, @410, @432, @438, @435, @353, @391, @418, @430, @426, @429, @442]));
        _plsExhaustRootLabel.textColor = [UIColor swipeScabiesNomad:@"#9a9898"];
        _plsExhaustRootLabel.font = [UIFont boldSystemFontOfSize:14];
        _plsExhaustRootLabel.textAlignment = NSTextAlignmentCenter;
        _plsExhaustRootLabel.numberOfLines = 0;
    }
    return _plsExhaustRootLabel;
}

- (UIButton *)figrUnshiftLoop {
    
    if (!_figrUnshiftLoop) {
        _figrUnshiftLoop = [[UIButton alloc] init];
        _figrUnshiftLoop.backgroundColor = [UIColor swipeScabiesNomad:@"#fedeb6"];
        _figrUnshiftLoop.layer.masksToBounds = YES;
        _figrUnshiftLoop.layer.cornerRadius = 22;
        [_figrUnshiftLoop setTitle:REMAND_WLESS((@[@386, @421, @421, @353, @399, @432, @440])) forState:UIControlStateNormal];
        [_figrUnshiftLoop setTitleColor:[UIColor swipeScabiesNomad:@"#674f33"] forState:UIControlStateNormal];
        _figrUnshiftLoop.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_figrUnshiftLoop addTarget:self action:@selector(peppyMornSinuous) forControlEvents:UIControlEventTouchUpInside];
    }
    return _figrUnshiftLoop;
}

- (UIButton *)skipButton {
    
    if (!_skipButton) {
        _skipButton = [[UIButton alloc] init];
        [_skipButton setTitle:MUNICIPAL_INDISCRETION(196) forState:UIControlStateNormal];
        [_skipButton setTitleColor:[UIColor swipeScabiesNomad:@"#9a9898"] forState:UIControlStateNormal];
        [_skipButton.titleLabel setFont:[UIFont systemFontOfSize:12.0]];
        [_skipButton.titleLabel setAttributedText:[[NSAttributedString alloc] initWithString:MUNICIPAL_INDISCRETION(196) attributes:@{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)}]];
        [_skipButton addTarget:self action:@selector(selfInvestmentAmoeba) forControlEvents:UIControlEventTouchUpInside];
    }
    return _skipButton;
}

- (void)barrelOxidizeBurnish {
 
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor swipeScabiesNomad:@"#2a292e"];
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 16;
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(300);
    }];
    
    UIImageView *lossStrc = [[UIImageView alloc] init];
    [lossStrc sd_setImageWithURL:ENCOURAGE_FREEHOLD(265)];
    lossStrc.layer.cornerRadius = 12;
    lossStrc.layer.masksToBounds = YES;
    [self.contentView addSubview:lossStrc];
    [lossStrc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(140);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(lossStrc.mas_bottom).offset(5);
        make.width.mas_lessThanOrEqualTo(270);
    }];
    
    [self.contentView addSubview:self.plsExhaustRootLabel];
    [self.plsExhaustRootLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.width.mas_lessThanOrEqualTo(270);
    }];
    
    [self.contentView addSubview:self.figrUnshiftLoop];
    [self.figrUnshiftLoop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.plsExhaustRootLabel.mas_bottom).offset(44);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(238);
        make.height.mas_equalTo(44);
    }];
    
    [self.contentView addSubview:self.skipButton];
    [self.skipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.figrUnshiftLoop.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-20);
    }];
}

- (void)kraalCompassNovember {
    
    [self barrelOxidizeBurnish];

    UIWindow *wlcmFlag = [[UIApplication sharedApplication] keyWindow];
    if ([self isDescendantOfView:wlcmFlag] == NO) {
        [wlcmFlag addSubview:self];
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

- (void)jstlySunniQuicken {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.alpha = 0;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)peppyMornSinuous {
    
    if (self.block) {
        self.block();
    }
    [self jstlySunniQuicken];
}

- (void)selfInvestmentAmoeba {
    
    [self jstlySunniQuicken];
}

@end