






#import "NionStraightenSnatchView.h"
#import "NlavndVasodilationManager.h"
#import "TrivialityCarrion.h"
#import "FreSlimeball.h"
#import "LayttConvincAftManager.h"

@interface NionStraightenSnatchView ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *xctDelimitKnow;
@property (nonatomic, strong) UIButton *lignHistoryWare;
@property (nonatomic, strong) UIButton *skipButton;

@end

@implementation NionStraightenSnatchView

- (UIView *)contentView {
    
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor swipeScabiesNomad:@"#2a292e"];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 16;
    }
    return _contentView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = [REMAND_WLESS((@[@410, @432, @438, @353, @436, @438, @419, @436, @420, @435, @426, @419, @422, @421, @353, @387, @432, @437, @425, @353, @401, @435, @422, @430, @426, @438, @430, @353, @426, @431, @353, @409, @409, @409])) stringByReplacingOccurrencesOfString:REMAND_WLESS((@[@409, @409, @409])) withString:[[[NlavndVasodilationManager shared] scfflMenswearThrive] objectForKey:REMAND_WLESS((@[@437, @370]))] ?: @""];
        _titleLabel.textColor = [UIColor swipeScabiesNomad:@"#ffd19e"];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _titleLabel;
}

- (UILabel *)xctDelimitKnow {
    
    if (!_xctDelimitKnow) {
        _xctDelimitKnow = [[UILabel alloc] init];
        NSDictionary *runtmNote = [[NSBundle mainBundle] infoDictionary];
        NSString *dscussThen = runtmNote[REMAND_WLESS((@[@388, @391, @387, @438, @431, @421, @429, @422, @389, @426, @436, @433, @429, @418, @442, @399, @418, @430, @422]))];
        _xctDelimitKnow.text = [REMAND_WLESS((@[@418, @431, @421, @353, @431, @422, @422, @421, @353, @437, @432, @353, @438, @431, @436, @438, @419, @436, @420, @435, @426, @419, @422, @353, @437, @425, @422, @353, @436, @426, @431, @424, @429, @422, @353, @433, @435, @422, @430, @426, @438, @430, @353, @426, @431, @353, @409, @409, @409])) stringByReplacingOccurrencesOfString:REMAND_WLESS((@[@409, @409, @409])) withString:dscussThen ?: @""];
        _xctDelimitKnow.textColor = [UIColor swipeScabiesNomad:@"#9a9898"];
        _xctDelimitKnow.font = [UIFont boldSystemFontOfSize:14];
        _xctDelimitKnow.textAlignment = NSTextAlignmentCenter;
        _xctDelimitKnow.numberOfLines = 0;
    }
    return _xctDelimitKnow;
}

- (UIButton *)lignHistoryWare {
    
    if (!_lignHistoryWare) {
        _lignHistoryWare = [[UIButton alloc] init];
        _lignHistoryWare.backgroundColor = [UIColor swipeScabiesNomad:@"#fedeb6"];
        _lignHistoryWare.layer.masksToBounds = YES;
        _lignHistoryWare.layer.cornerRadius = 22;
        [_lignHistoryWare setTitle:REMAND_WLESS((@[@406, @431, @436, @438, @419, @436, @420, @435, @426, @419, @422])) forState:UIControlStateNormal];
        [_lignHistoryWare setTitleColor:[UIColor swipeScabiesNomad:@"#674f33"] forState:UIControlStateNormal];
        _lignHistoryWare.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_lignHistoryWare addTarget:self action:@selector(stylsOverboardPrion) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lignHistoryWare;
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
 
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(300);
    }];
    
    self.imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageView];
    [self.imageView sd_setImageWithURL:ENCOURAGE_FREEHOLD(248)];
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
    
    [self.contentView addSubview:self.xctDelimitKnow];
    [self.xctDelimitKnow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.width.mas_lessThanOrEqualTo(270);
    }];
    
    [self.contentView addSubview:self.lignHistoryWare];
    [self.lignHistoryWare mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.xctDelimitKnow.mas_bottom).offset(44);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(238);
        make.height.mas_equalTo(44);
    }];
    
    [self.contentView addSubview:self.skipButton];
    [self.skipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lignHistoryWare.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-20);
    }];
}

- (void)kraalCompassNovember {
    
    [self theaterScrambleSunny];
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

- (void)stylsOverboardPrion {
    
    [self affixGodownLash:47];
    [self jstlySunniQuicken];
    NSURL *fmlrWise = [NSURL URLWithString:REMAND_WLESS((@[@425, @437, @437, @433, @436, @379, @368, @368, @418, @433, @433, @436, @367, @418, @433, @433, @429, @422, @367, @420, @432, @430, @368, @418, @420, @420, @432, @438, @431, @437, @368, @436, @438, @419, @436, @420, @435, @426, @433, @437, @426, @432, @431, @436]))];
    [[UIApplication sharedApplication] openURL:fmlrWise options:@{} completionHandler:nil];
}

- (void)selfInvestmentAmoeba {
    
    if (self.block) {
        self.block();
    }
    [self affixGodownLash:48];
    [self jstlySunniQuicken];
}

- (void)affixGodownLash:(NSInteger)teamCmbn
{
    NSMutableDictionary *pairMnmum = [[NSMutableDictionary alloc] init];
    [pairMnmum setValue:@(44) forKey:REMAND_WLESS((@[@436, @432, @438, @435, @420, @422]))];
    [pairMnmum setValue:@(teamCmbn) forKey:REMAND_WLESS((@[@428, @426, @421]))];
    [LayttConvincAftManager bangleAwakeDoom:@"142" andLytReplaceCare:pairMnmum];
}

- (void)theaterScrambleSunny
{
    NSMutableDictionary *pairMnmum = [[NSMutableDictionary alloc] init];
    [pairMnmum setValue:@(44) forKey:REMAND_WLESS((@[@436, @432, @438, @435, @420, @422]))];
    [LayttConvincAftManager bangleAwakeDoom:@"144" andLytReplaceCare:pairMnmum];
}

@end