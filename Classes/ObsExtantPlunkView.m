






#import "ObsExtantPlunkView.h"
#import "NlavndVasodilationManager.h"

@interface ObsExtantPlunkView ()

@property (nonatomic, strong) UIView *timsManifestKeepView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, copy) dispatch_block_t srisMountainLink;
@property (nonatomic, copy) tgglRepaintSameBlock dthRearrangeHigh;
@property (nonatomic, copy) tgglRepaintSameBlock byndConsistFact;

@end

@implementation ObsExtantPlunkView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self peppyCassetteRosebud];
    }
    return self;
}

- (void)peppyCassetteRosebud {

    [self addTarget:self action:@selector(ughUncontestedTester) forControlEvents:UIControlEventTouchUpInside];

    self.timsManifestKeepView = [[UIView alloc] init];
    self.timsManifestKeepView.backgroundColor = [UIColor swipeScabiesNomad:@"#2a292e"];
    UIBezierPath *rgumntLess = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, PLYHUS_REGULARIZE, 375) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(24, 24)];
    CAShapeLayer *areaVrflw = [CAShapeLayer layer];
    areaVrflw.frame = CGRectMake(0, 0, PLYHUS_REGULARIZE, 375);
    areaVrflw.path = rgumntLess.CGPath;
    self.timsManifestKeepView.layer.mask = areaVrflw;
    [self addSubview:self.timsManifestKeepView];
    
    self.imageView = [[UIImageView alloc] init];
    [self.timsManifestKeepView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(360);
        make.height.mas_equalTo(260);
    }];
    
    NSDictionary *homeSqunc = [[NlavndVasodilationManager shared] scfflMenswearThrive];
    UILabel *callHghlght = [[UILabel alloc] init];
    callHghlght.text = [MUNICIPAL_INDISCRETION(995) stringByReplacingOccurrencesOfString:REMAND_WLESS((@[@409, @409, @409])) withString:homeSqunc[REMAND_WLESS((@[@437, @370]))] ?: @""];
    callHghlght.textColor = [UIColor swipeScabiesNomad:@"#ffd671"];
    callHghlght.font = [UIFont boldSystemFontOfSize:14];
    [self.timsManifestKeepView addSubview:callHghlght];
    [callHghlght mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(self.imageView.mas_bottom).offset(20);
    }];
}

- (void)masterNosegayCaramel:(tgglRepaintSameBlock)codeLtrnt dismiss:(tgglRepaintSameBlock)backNumrus {
    
    self.dthRearrangeHigh = codeLtrnt;
    self.byndConsistFact = backNumrus;
    
    UIView *unshftLine = [[UIApplication sharedApplication] keyWindow];
    self.frame = CGRectMake(0, 0, PLYHUS_REGULARIZE, PERFUNCTORILY_CONCOCTION);
    [unshftLine addSubview:self];
    
    if (!self.srisMountainLink) {
        __weak typeof(self) phrsBackwardTeam = self;
        self.srisMountainLink = dispatch_block_create(0, ^{
            if (phrsBackwardTeam.dthRearrangeHigh) {
                phrsBackwardTeam.dthRearrangeHigh();
            }
            [phrsBackwardTeam removeFromSuperview];
        });
    }
    NSDictionary *homeSqunc = [[NlavndVasodilationManager shared] scfflMenswearThrive];
    NSString *nytmWide = homeSqunc[REMAND_WLESS((@[@424, @426, @423]))];
    __weak typeof(self) phrsBackwardTeam = self;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:nytmWide] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
        if (phrsBackwardTeam && phrsBackwardTeam.srisMountainLink) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), phrsBackwardTeam.srisMountainLink);
        }
    }];
    
    self.timsManifestKeepView.frame = CGRectMake(0, PERFUNCTORILY_CONCOCTION, PLYHUS_REGULARIZE, 375);
    [UIView animateWithDuration:0.2 animations:^{
        self.timsManifestKeepView.frame = CGRectMake(0, PERFUNCTORILY_CONCOCTION-375, PLYHUS_REGULARIZE, 375);
    }];
}

- (void)ughUncontestedTester {
    
    if (self.srisMountainLink) {
        dispatch_block_cancel(self.srisMountainLink);
        self.srisMountainLink = nil;
    }
    if (self.byndConsistFact) {
        self.byndConsistFact();
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.timsManifestKeepView.frame = CGRectMake(0, PERFUNCTORILY_CONCOCTION, PLYHUS_REGULARIZE, 334);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end