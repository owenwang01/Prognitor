







#import "TrivialityPlungView.h"
#import "MothballAimlesslyCell.h"
#import "NdrdonScathSubsistModel.h"

@interface TrivialityPlungView ()

@property (nonatomic, strong) NSMutableArray *infoArray;

@end

@implementation TrivialityPlungView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self peppyCassetteRosebud];
    }
    return self;
}

- (void)peppyCassetteRosebud {
    
    self.infoArray = @[].mutableCopy;
    NdrdonScathSubsistModel *strgTell = [NdrdonScathSubsistModel lipstickDepartBelt:MUNICIPAL_INDISCRETION(601) andDtctStatementHigh:MUNICIPAL_INDISCRETION(604)];
    [self.infoArray addObject:strgTell];
    
    NdrdonScathSubsistModel *roomUndrln = [NdrdonScathSubsistModel lipstickDepartBelt:MUNICIPAL_INDISCRETION(631) andDtctStatementHigh:MUNICIPAL_INDISCRETION(624)];
    [self.infoArray addObject:roomUndrln];
    
    NdrdonScathSubsistModel *stndrdThen = [NdrdonScathSubsistModel lipstickDepartBelt:MUNICIPAL_INDISCRETION(633) andDtctStatementHigh:@""];
    [self.infoArray addObject:stndrdThen];
    
    NdrdonScathSubsistModel *highSquz = [NdrdonScathSubsistModel lipstickDepartBelt:MUNICIPAL_INDISCRETION(610) andDtctStatementHigh:@""];
    [self.infoArray addObject:highSquz];
    
    NdrdonScathSubsistModel *meanSummry = [NdrdonScathSubsistModel lipstickDepartBelt:MUNICIPAL_INDISCRETION(628) andDtctStatementHigh:MUNICIPAL_INDISCRETION(628)];
    [self.infoArray addObject:meanSummry];
    
    NdrdonScathSubsistModel *sprtHard = [NdrdonScathSubsistModel lipstickDepartBelt:MUNICIPAL_INDISCRETION(605) andDtctStatementHigh:@""];
    [self.infoArray addObject:sprtHard];
    
    NSString *cntnuBoth = MUNICIPAL_INDISCRETION(204);
    NdrdonScathSubsistModel *prdctTurn = [NdrdonScathSubsistModel lipstickDepartBelt:[NSString stringWithFormat:@"%@:%@", cntnuBoth, ACHLY_GAMEPLAY] andDtctStatementHigh:ACHLY_GAMEPLAY];
    prdctTurn.ppndClassifyPool = YES;
    prdctTurn.slryAutomaticHang = YES;
    [self.infoArray addObject:prdctTurn];
    
    NSString *warnRdundnt = MUNICIPAL_INDISCRETION(195);
    NdrdonScathSubsistModel *zoomNdct = [NdrdonScathSubsistModel lipstickDepartBelt:[NSString stringWithFormat:@"%@:%@", warnRdundnt, DEFLECTION_DOWNTREND] andDtctStatementHigh:DEFLECTION_DOWNTREND];
    zoomNdct.ppndClassifyPool = YES;
    zoomNdct.slryAutomaticHang = YES;
    [self.infoArray addObject:zoomNdct];
    
    MothballAimlesslyCell *diskRfrmt = nil;
    for (int i = 0; i < [self.infoArray count]; i++) {
        NdrdonScathSubsistModel *memoPnn = self.infoArray[i];
        MothballAimlesslyCell *ncrsTone = [[MothballAimlesslyCell alloc] init];
        [ncrsTone barrelPeriodicSisal:memoPnn];
        [self addSubview:ncrsTone];
        [ncrsTone mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.top.mas_equalTo(0);
            } else {
                make.top.equalTo(diskRfrmt.mas_bottom);
            }
            make.height.mas_equalTo(memoPnn.grnContentExit);
            make.left.right.mas_equalTo(0);
            if (i == self.infoArray.count - 1) {
                make.bottom.mas_equalTo(0);
            }
        }];
        diskRfrmt = ncrsTone;
    }
}

@end