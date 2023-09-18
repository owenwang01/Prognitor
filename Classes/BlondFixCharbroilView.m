






#import "BlondFixCharbroilView.h"
#import "NlavndVasodilationManager.h"
#import "GophrDeftQuadrantManager.h"
#import "LayttConvincAftManager.h"
#import "MckEngagedSwollen.h"

@interface BlondFixCharbroilView ()

@property (nonatomic, assign) NSInteger source;
@property (nonatomic, strong) NSDictionary *sntncWare;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *cntPrepareLoss;
@property (nonatomic, strong) UIButton *skipButton;
@property (nonatomic, strong) UILabel *thinkDynamicWantLabel;

@end

@implementation BlondFixCharbroilView

- (UIView *)contentView {
    
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor swipeScabiesNomad:@"#2a292e"];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 12;
    }
    return _contentView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = [MUNICIPAL_INDISCRETION(992) stringByReplacingOccurrencesOfString:REMAND_WLESS((@[@409, @409, @409])) withString:[[[NlavndVasodilationManager shared] scfflMenswearThrive] objectForKey:REMAND_WLESS((@[@437, @370]))] ?: @""];
        _titleLabel.textColor = [UIColor swipeScabiesNomad:@"#ffd19e"];
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}

- (UIButton *)cntPrepareLoss {
    
    if (!_cntPrepareLoss) {
        _cntPrepareLoss = [[UIButton alloc] init];
        CAGradientLayer *pastNtwrk = [CAGradientLayer layer];
        pastNtwrk.frame = CGRectMake(0, 0, 238, 44);
        pastNtwrk.startPoint = CGPointMake(0, 0);
        pastNtwrk.endPoint = CGPointMake(1, 0);
        pastNtwrk.colors = @[(__bridge id)[UIColor swipeScabiesNomad:@"#eec292"].CGColor, (__bridge id)[UIColor swipeScabiesNomad:@"#fedeb6"].CGColor];
        [_cntPrepareLoss.layer addSublayer:pastNtwrk];
        _cntPrepareLoss.layer.masksToBounds = YES;
        _cntPrepareLoss.layer.cornerRadius = 22;
        [_cntPrepareLoss setTitle:[[NlavndVasodilationManager shared] barefacedLankySisal] ? REMAND_WLESS((@[@392, @432, @353, @404, @438, @419, @436, @420, @435, @426, @419, @422])) : REMAND_WLESS((@[@394, @431, @436, @437, @418, @429, @429])) forState:UIControlStateNormal];
        [_cntPrepareLoss setTitleColor:[UIColor swipeScabiesNomad:@"#674f33"] forState:UIControlStateNormal];
        _cntPrepareLoss.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_cntPrepareLoss addTarget:self action:@selector(stylsOverboardPrion) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cntPrepareLoss;
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

- (UILabel *)thinkDynamicWantLabel {
    
    if (!_thinkDynamicWantLabel) {
        _thinkDynamicWantLabel = [[UILabel alloc] init];
        _thinkDynamicWantLabel.text = [NSString stringWithFormat:@"%@%@", [MUNICIPAL_INDISCRETION(995) stringByReplacingOccurrencesOfString:REMAND_WLESS((@[@409, @409, @409])) withString:[[[NlavndVasodilationManager shared] scfflMenswearThrive] objectForKey:REMAND_WLESS((@[@437, @370]))] ?: @""], @"..."];
        _thinkDynamicWantLabel.textColor = [UIColor swipeScabiesNomad:@"#ffd671"];
        _thinkDynamicWantLabel.font = [UIFont boldSystemFontOfSize:14];
        _thinkDynamicWantLabel.textAlignment = NSTextAlignmentCenter;
        _thinkDynamicWantLabel.numberOfLines = 0;
    }
    return _thinkDynamicWantLabel;
}

- (void)barrelOxidizeBurnish {
    
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(300);
    }];
    
    NSDictionary *homeSqunc = [[NlavndVasodilationManager shared] scfflMenswearThrive];
    NSString *nytmWide = homeSqunc[REMAND_WLESS((@[@424, @426, @423]))];
    UIImageView *lossStrc = [[UIImageView alloc] init];
    [self.contentView addSubview:lossStrc];
    [lossStrc sd_setImageWithURL:[NSURL URLWithString:nytmWide]];
    [lossStrc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(36);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(220);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(lossStrc.mas_bottom).offset(25);
    }];
    
    [self.contentView addSubview:self.cntPrepareLoss];
    [self.cntPrepareLoss mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(35);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(238);
        make.height.mas_equalTo(44);
    }];

    [self.contentView addSubview:self.skipButton];
    [self.skipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cntPrepareLoss.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-20);
    }];
}

- (void)typhnSprinkleCaramel {
    
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor swipeScabiesNomad:@"#333133"];
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 12;
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(260);
        make.height.mas_equalTo(63);
    }];
    [self.contentView addSubview:self.thinkDynamicWantLabel];
    [self.thinkDynamicWantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(240);
    }];
}

- (void)kraalCompassNovember:(NSDictionary *)homeSqunc source:(NSInteger)sureMprtnt {
    
    [MckEngagedSwollen barefacedAwakeTested].glssEdgeBlock(YES);
    self.source = sureMprtnt;
    self.sntncWare = homeSqunc;
    NSInteger mxmumStay = [[NSUserDefaults standardUserDefaults] integerForKey:@"dbgSkeletonVery"];
    BOOL eachSsct = mxmumStay < 3;
    if (eachSsct) {
        [self theaterScrambleSunny];
        [self barrelOxidizeBurnish];
        [[NSUserDefaults standardUserDefaults] setInteger:mxmumStay+1 forKey:@"dbgSkeletonVery"];
    } else {
        [self typhnSprinkleCaramel];
    }

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
    } completion:^(BOOL finished) {
        if (!eachSsct) {
            __weak typeof(self) phrsBackwardTeam = self;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (phrsBackwardTeam) {
                    [phrsBackwardTeam stylsOverboardPrion];
                }
            });
        }
    }];
}

- (void)jstlySunniQuicken {
    
    [MckEngagedSwollen barefacedAwakeTested].glssEdgeBlock(NO);
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.alpha = 0;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)stylsOverboardPrion {
    
    [MckEngagedSwollen barefacedAwakeTested].glssEdgeBlock(NO);
    [self affixGodownLash:1];
    [GophrDeftQuadrantManager stylsOverboardPrion:self.sntncWare];
    [self removeFromSuperview];
}

- (void)selfInvestmentAmoeba {
    
    [self affixGodownLash:2];
    [self jstlySunniQuicken];
}

- (void)affixGodownLash:(NSInteger)teamCmbn
{
    NSMutableDictionary *pairMnmum = [[NSMutableDictionary alloc] init];
    [pairMnmum setValue:@(self.source) forKey:REMAND_WLESS((@[@436, @432, @438, @435, @420, @422]))];
    [pairMnmum setValue:@(teamCmbn) forKey:REMAND_WLESS((@[@428, @426, @421]))];
    [LayttConvincAftManager bangleAwakeDoom:@"244" andLytReplaceCare:pairMnmum];
}

- (void)theaterScrambleSunny
{
    NSMutableDictionary *pairMnmum = [[NSMutableDictionary alloc] init];
    [pairMnmum setValue:@(self.source) forKey:REMAND_WLESS((@[@436, @432, @438, @435, @420, @422]))];
    [LayttConvincAftManager bangleAwakeDoom:@"243" andLytReplaceCare:pairMnmum];
}

@end