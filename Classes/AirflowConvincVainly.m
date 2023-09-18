






#import "AirflowConvincVainly.h"
#import "TrivialityHomecomManager.h"
#import <StoreKit/StoreKit.h>
#import "BlondExtantSisterly.h"
#import "NSString+GophrWestHegemonic.h"
#import "RACSignal.h"
#import "RACSubject.h"

@implementation AirflowConvincVainly

+ (AirflowConvincVainly *)sharedInstance{
    static AirflowConvincVainly *manager;
    static dispatch_once_t dmgProgramMany;
    dispatch_once(&dmgProgramMany, ^{
        manager = [[AirflowConvincVainly alloc] init];
    });
    return manager;
}

- (void)favelaClockCrinoline:(NSInteger)suchSssn{
    NSURL *sortLgnmnt = [[NSBundle mainBundle] appStoreReceiptURL];
    NSData *giveChv = [NSData dataWithContentsOfURL:sortLgnmnt];
    if (!giveChv){
        return;
    }
    NSDictionary *params = @{
        REMAND_WLESS((@[@435, @422, @420, @422, @426, @433, @437, @366, @421, @418, @437, @418])): [giveChv base64EncodedStringWithOptions:0],
        REMAND_WLESS((@[@433, @418, @436, @436, @440, @432, @435, @421])): CL_SOOTH
    };
    NSString *wareStrg = @[FLDSPR_PROSTRATE, ORIGINALITY_PLANGENT][suchSssn];
    [self.bcmChannelTest sendNext:nil];
    [[TrivialityHomecomManager typhnProspectusDoor] post:wareStrg body:params result:^(id result) {
        
        NSString *cellRcmmnd = [NSString stringWithFormat:@"%@",result[REMAND_WLESS((@[@436, @437, @418, @437, @438, @436]))]];
        if (cellRcmmnd && [cellRcmmnd isEqualToString:REMAND_WLESS((@[@371, @370, @369, @369, @376]))]) {
            
            [self favelaClockCrinoline:0];
        }else if(cellRcmmnd && [cellRcmmnd isEqualToString:@"0"]){
            
            [self ecrSansProfiterole];
            
            NSArray *rrrngPush = [result objectForKey:REMAND_WLESS((@[@429, @418, @437, @422, @436, @437, @416, @435, @422, @420, @422, @426, @433, @437, @416, @426, @431, @423, @432]))];
            [self seizeUncoolCassette:rrrngPush];
            [self.nghSemicolonRead sendNext:nil];
            [NSNotificationCenter.defaultCenter postNotificationName:GROUNDER_DNA object:self userInfo:nil];
            
            [BlondExtantSisterly ughDepartRemedy:4];
        } else {
            [self.brkAnalystSale sendNext:nil];
        }
    }];
}

- (void)ecrSansProfiterole{
    NSArray* prsntOnce = [SKPaymentQueue defaultQueue].transactions;
    if (prsntOnce.count > 0) {
        for (SKPaymentTransaction* transaction in prsntOnce){
            if (transaction.transactionState == SKPaymentTransactionStatePurchased) {
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
            }
        }
    }
}

- (void)seizeUncoolCassette:(NSArray *)prgrphMany{
    if (prgrphMany){
        if (prgrphMany && prgrphMany.count > 0){
            
            prgrphMany = [prgrphMany sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *obj1, NSDictionary *obj2) {
                NSString *dvncMenu = LOCKDOWN_BOGAN(obj1[REMAND_WLESS((@[@422, @441, @433, @426, @435, @422, @436, @416, @421, @418, @437, @422, @416, @430, @436]))]).narcisssTwillMouldy;
                NSString *pastNstd = LOCKDOWN_BOGAN(obj2[REMAND_WLESS((@[@422, @441, @433, @426, @435, @422, @436, @416, @421, @418, @437, @422, @416, @430, @436]))]).narcisssTwillMouldy;
                return [pastNstd compare:dvncMenu];
            }];
            NSDictionary *stepXclusv = prgrphMany.firstObject;
            if (stepXclusv){
                
                [BlondExtantSisterly brtallyLankyWrapp:stepXclusv];
            }
        }
    }
}

- (RACSubject *)bcmChannelTest {
    if (!_bcmChannelTest) {
        _bcmChannelTest = [RACSubject subject];
    }
    return _bcmChannelTest;
}

- (RACSubject *)nghSemicolonRead {
    if (!_nghSemicolonRead) {
        _nghSemicolonRead = [RACSubject subject];
    }
    return _nghSemicolonRead;
}

- (RACSubject *)brkAnalystSale {
    if (!_brkAnalystSale) {
        _brkAnalystSale = [RACSubject subject];
    }
    return _brkAnalystSale;
}

@end