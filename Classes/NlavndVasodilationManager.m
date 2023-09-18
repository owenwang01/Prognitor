






#import "NlavndVasodilationManager.h"
#import "VrVisuallyReworkView.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "LayttConvincAftManager.h"
#import "TrivialityHomecomManager.h"
#import "UIViewController+MckRevelatoryGunshot.h"

@implementation NlavndVasodilationManager

+ (NlavndVasodilationManager *)shared
{
    static NlavndVasodilationManager *manager = nil;
    static dispatch_once_t dmgProgramMany;
    dispatch_once(&dmgProgramMany, ^{
        manager = [[NlavndVasodilationManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        @weakify(self);
        [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"plcInterruptWideNotification" object:nil] subscribeNext:^(NSNotification * _Nullable x) {
            @strongify(self);
            [self theaterScullerTested];
        }];
    }
    return self;
}

- (void)theaterScullerTested {
    
    BOOL toneTrvrs = [[NSUserDefaults standardUserDefaults] boolForKey:@"dbgControlTest"];
    if (toneTrvrs) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"dbgControlTest"];
    VrVisuallyReworkView *ncrsTone = [[VrVisuallyReworkView alloc] init];
    ncrsTone.block = ^() {
        
        UIViewController *meanSmlr = [[NSClassFromString(@"FryVisuallyInternetViewController") alloc] init];
        meanSmlr.hidesBottomBarWhenPushed = YES;
        [[UIViewController bllseyeKulfiOleander].navigationController pushViewController:meanSmlr animated:YES];
    };
    [ncrsTone kraalCompassNovember];
}

- (void)agnizeViandCassette:(NSDictionary *)homeSqunc
{
    if (homeSqunc == nil || homeSqunc.count == 0) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:homeSqunc forKey:@"rightIncorrectBlue"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self nstatedSisalEnliven];
}

- (void)nstatedSisalEnliven {
    
    NSMutableDictionary *pairMnmum = [[NSMutableDictionary alloc] init];
    [pairMnmum setValue:@(1) forKey:REMAND_WLESS((@[@437, @442, @433, @422]))];
    [pairMnmum setValue:@([self hssarKulfiTosser] == 1 ? 1 : 2) forKey:REMAND_WLESS((@[@436, @437, @418, @437, @438, @436]))];
    [LayttConvincAftManager bangleAwakeDoom:@"242" andLytReplaceCare:pairMnmum];
}

- (NSDictionary *)ughRedoubtOleander
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"rightIncorrectBlue"];
}

- (NSDictionary *)prprtInfectOleander
{
    NSDictionary *homeSqunc = [[NlavndVasodilationManager shared] ughRedoubtOleander];
    return homeSqunc[REMAND_WLESS((@[@421, @418, @437, @418, @371]))];
}

- (NSArray *)selfBoozerAdaptation
{
    NSDictionary *homeSqunc = [[NlavndVasodilationManager shared] ughRedoubtOleander];
    return homeSqunc[REMAND_WLESS((@[@425, @370]))];
}

- (NSDictionary *)scfflMenswearThrive
{
    NSDictionary *homeSqunc = [[NlavndVasodilationManager shared] ughRedoubtOleander];
    return homeSqunc[REMAND_WLESS((@[@433, @370]))];
}

- (NSDictionary *)peppyAttendanceSpamm
{
    NSDictionary *homeSqunc = [[NlavndVasodilationManager shared] ughRedoubtOleander];
    return homeSqunc[REMAND_WLESS((@[@433, @371]))];
}

- (NSArray *)racsRemovableHickey
{
    NSDictionary *homeSqunc = [[NlavndVasodilationManager shared] ughRedoubtOleander];
    return homeSqunc[REMAND_WLESS((@[@428, @372]))];
}

- (NSInteger)hssarKulfiTosser
{
    NSDictionary *homeSqunc = [[NlavndVasodilationManager shared] ughRedoubtOleander];
    return ([homeSqunc[REMAND_WLESS((@[@428, @370, @371]))] integerValue] > 0 && [self bedlamQuickenWrapp].count > 0) ? 1 : 0;
}

- (NSInteger)emplyableDoomCaramel
{
    NSDictionary *homeSqunc = [[NlavndVasodilationManager shared] ughRedoubtOleander];
    return [homeSqunc[REMAND_WLESS((@[@428, @370, @372]))] integerValue];
}

- (void)prprtClockSunny:(NSDictionary *)homeSqunc
{
    if (homeSqunc == nil || homeSqunc.count == 0) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:homeSqunc forKey:@"crssInstructMath"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSDictionary *)bedlamQuickenWrapp
{
    NSDictionary *nvgtOmit = [TrivialityHomecomManager typhnProspectusDoor].bjctProblemKeepDict;
    if (nvgtOmit == nil) {
        nvgtOmit = [[NSUserDefaults standardUserDefaults] objectForKey:@"crssInstructMath"];
    }
    return nvgtOmit;
}

- (BOOL)barefacedLankySisal
{
    NSDictionary *homeSqunc = [[NlavndVasodilationManager shared] bedlamQuickenWrapp];
    if (homeSqunc.count == 0) {
        return NO;
    }
    NSString *portVrus = [NSString stringWithFormat:@"%@%@", homeSqunc[@"361"], REMAND_WLESS((@[@379, @368, @368]))];
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:portVrus]];
}

@end