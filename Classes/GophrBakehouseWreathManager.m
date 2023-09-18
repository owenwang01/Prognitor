







#import "GophrBakehouseWreathManager.h"
#import "AirflowConvincVainly.h"
#import <StoreKit/StoreKit.h>
#import "RACSubject.h"
#import "FryReassessmentTool.h"
#import "BlondExtantSisterly.h"
#import "MckEngagedSwollen.h"
#import "VrCompellHawker.h"
#import "NSString+GophrWestHegemonic.h"
#import <MJExtension/MJExtension.h>
#import "TrivialityHomecomManager.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "UIViewController+MckRevelatoryGunshot.h"
#import "NlavndVasodilationManager.h"

@interface GophrBakehouseWreathManager ()<SKProductsRequestDelegate, SKPaymentTransactionObserver>

@property (nonatomic, strong) SKProductsRequest *plinRespectSeek;
@property (nonatomic, assign) BOOL rptPreserveScan;
@end

@implementation GophrBakehouseWreathManager

+ (GophrBakehouseWreathManager *)sharedInstance{
    static GophrBakehouseWreathManager *manager;
    static dispatch_once_t dmgProgramMany;
    dispatch_once(&dmgProgramMany, ^{
        manager = [[GophrBakehouseWreathManager alloc] init];
        [manager addObserver];
    });
    return manager;
}

-(void)addObserver{
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
}


- (void)peratinBeltDoor:(NSArray *)nstncFree{
    if (![SKPaymentQueue canMakePayments]) {
        return;
    }
    
    NSSet *hugeVrvw = [NSSet setWithArray:nstncFree];
    
    _plinRespectSeek = [[SKProductsRequest alloc] initWithProductIdentifiers:hugeVrvw];
    _plinRespectSeek.delegate = self;
    [_plinRespectSeek start];
}

- (void)productsRequest:(nonnull SKProductsRequest *)knowClssfy didReceiveResponse:(nonnull SKProductsResponse *)rplcWell {
    NSArray *prgrphMany = rplcWell.products;
    if(prgrphMany && prgrphMany.count > 0){
        prgrphMany = [prgrphMany sortedArrayUsingComparator:^NSComparisonResult(SKProduct *obj1, SKProduct *obj2) {
            if (obj1.introductoryPrice) {
                return NSOrderedAscending;
            }
            return [obj2.price compare:obj1.price];
        }];
        self.pricConsumeDesk = prgrphMany;
    }
    [self.grpAlignmentRent sendNext:prgrphMany];
}


- (void)agnizeTestedRetarded:(SKProduct *)shutXclusv{
    if (![SKPaymentQueue canMakePayments]) {
        
        [FryReassessmentTool stylsAmoebaPalatal];
        [FryReassessmentTool favelaLashMalevolent:REMAND_WLESS((@[@394, @431, @366, @418, @433, @433, @353, @433, @438, @435, @420, @425, @418, @436, @422, @353, @433, @422, @435, @430, @426, @436, @436, @426, @432, @431, @353, @431, @432, @437, @353, @424, @435, @418, @431, @437, @422, @421]))];
        return;
    }
    if(!shutXclusv){
        [FryReassessmentTool stylsAmoebaPalatal];
        [FryReassessmentTool favelaLashMalevolent:REMAND_WLESS((@[@399, @432, @353, @401, @435, @432, @421, @438, @420, @437]))];
        return;
    }
    
    self.rptPreserveScan = YES;
    
    SKPayment *mstkSoft = [SKPayment paymentWithProduct:shutXclusv];
    
    [[SKPaymentQueue defaultQueue] addPayment:mstkSoft];
}


- (void)paymentQueue:(nonnull SKPaymentQueue *)nestPhnx updatedTransactions:(nonnull NSArray *)prsntOnce {
    
    if (prsntOnce.count > 1) {
        NSArray *wellClckws = [prsntOnce sortedArrayUsingComparator:^(id obj1, id obj2) {
            SKPaymentTransaction *ltrntWeek = obj1;
            SKPaymentTransaction *saveNcssry = obj2;
            if ([saveNcssry.transactionDate timeIntervalSinceDate:ltrntWeek.transactionDate] >= 0) {
                return NSOrderedAscending;
            } else {
                return NSOrderedDescending;
            }
        }];
        [self fiscallyAwakeFirth:wellClckws.lastObject];
    } else if (prsntOnce.count == 1) {
        [self fiscallyAwakeFirth:prsntOnce.firstObject];
    } else {
        [self.brkAnalystSale sendNext:MUNICIPAL_INDISCRETION(1047)];
    }
}

- (void)fiscallyAwakeFirth:(SKPaymentTransaction *)mplctRate {
    
    switch (mplctRate.transactionState) {
        case SKPaymentTransactionStatePurchasing:
            break;
        case SKPaymentTransactionStatePurchased:
        {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"mdlPreviousMean"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [[SKPaymentQueue defaultQueue] finishTransaction:mplctRate];
            [self bedlamLashNegativity:mplctRate];
            if (self.rptPreserveScan) {
                [BlondExtantSisterly ughDepartRemedy:3];
            }
        }
            break;
        case SKPaymentTransactionStateFailed:
        {
            [self.brkAnalystSale sendNext:MUNICIPAL_INDISCRETION(1047)];
            [[SKPaymentQueue defaultQueue] finishTransaction:mplctRate];
        }
            break;
        case SKPaymentTransactionStateRestored:
        {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"mdlPreviousMean"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [[SKPaymentQueue defaultQueue] finishTransaction:mplctRate];
            [self bedlamLashNegativity:mplctRate];
        }
            break;
        default:
        {
            [[SKPaymentQueue defaultQueue] finishTransaction:mplctRate];
        }
            break;
    }
}


- (void)bedlamLashNegativity:(SKPaymentTransaction *)mplctRate {
    
    if (!MckEngagedSwollen.barefacedAwakeTested.rrwBetweenHeapBlock()) {
        if ([BlondExtantSisterly ecrCentrifugalDipole:mplctRate]) {
            [[AirflowConvincVainly sharedInstance] favelaClockCrinoline:1];
        }
    } else {
        if (![FryAllowanceKnapsackModel sharedInstance].nlssSemicolonRest) {
            if ([BlondExtantSisterly ecrCentrifugalDipole:mplctRate]) {
                [self sbsidiseSunnyWelter:mplctRate andInsidNest:self.rptPreserveScan];
            }
        } else {
            [self sbsidiseSunnyWelter:mplctRate andInsidNest:self.rptPreserveScan];
        }
    }
}


- (void)sbsidiseSunnyWelter:(SKPaymentTransaction *)holdNumrc andInsidNest:(BOOL)xtnsnTalk {
    NSMutableDictionary *sntncWare = [NSMutableDictionary dictionary];
    NSString *ruleXhust = @"";
    NSString *knowGrphc = @"";
    NSString *fmlrWise = xtnsnTalk?bjctResidentDisc:mnthPerformPort;
    if (xtnsnTalk) {
        [sntncWare setValue:@"1" forKey:REMAND_WLESS((@[@423, @429, @418, @424]))];
        NSURL *cardFrgmnt = [[NSBundle mainBundle] appStoreReceiptURL];
        NSData *prfrmFind = [NSData dataWithContentsOfURL:cardFrgmnt];
        ruleXhust = [prfrmFind base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
        knowGrphc = holdNumrc.payment.productIdentifier;
    } else {
        [sntncWare setValue:@"0" forKey:REMAND_WLESS((@[@423, @429, @418, @424]))];
        if (holdNumrc) {
            NSURL *cardFrgmnt = [[NSBundle mainBundle] appStoreReceiptURL];
            NSData *prfrmFind = [NSData dataWithContentsOfURL:cardFrgmnt];
            ruleXhust = [prfrmFind base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
            knowGrphc = holdNumrc.payment.productIdentifier;
        } else {
            NSString *dgrdNote = [[NSUserDefaults standardUserDefaults] objectForKey:PARTICIPATORY_LIGNITE];
            if(![NSString saintSansPictogram:dgrdNote]){
                NSDictionary *llctFree = [dgrdNote mj_JSONObject];
                ruleXhust = LOCKDOWN_BOGAN(llctFree[MARCHER_PREPARED]).narcisssTwillMouldy;
                knowGrphc = LOCKDOWN_BOGAN(llctFree[SPRTSMNSHP_HAS]).narcisssTwillMouldy;
            } else if ([FryAllowanceKnapsackModel sharedInstance].nlssSemicolonRest) {
                knowGrphc = [FryAllowanceKnapsackModel sharedInstance].vrflwMach;
            }
        }
    }
    if ([ruleXhust isEqualToString:@""] && xtnsnTalk) {
        [FryReassessmentTool arsnHauteurAutomate];
        [VrCompellHawker ecrSisalNovember];
        return;
    }
    
    if ([FryAllowanceKnapsackModel sharedInstance].nlssSemicolonRest) {
        [sntncWare setValue:[NSString saintSansPictogram:[FryAllowanceKnapsackModel sharedInstance].uid andStckExtensionHeap:@"0"] forKey:REMAND_WLESS((@[@438, @426, @421]))];
    } else {
        [sntncWare setValue:@"0" forKey:REMAND_WLESS((@[@438, @426, @421]))];
    }
    [sntncWare setObject:LOCKDOWN_BOGAN([FryAllowanceKnapsackModel sharedInstance].rightReceiveHere).narcisssTwillMouldy forKey:REMAND_WLESS((@[@423, @426, @421]))];

    
    [sntncWare setValue:ruleXhust forKey:REMAND_WLESS((@[@435, @422, @420, @422, @426, @433, @437]))];
    [sntncWare setValue:knowGrphc forKey:REMAND_WLESS((@[@433, @426, @421]))];
    
    BOOL saleShrtcut = [FryAllowanceKnapsackModel sharedInstance].arsnTwillJurist;
    [sntncWare setValue:saleShrtcut?@"1":@"0" forKey:REMAND_WLESS((@[@439, @433]))];
    
    [self.bcmChannelTest sendNext:nil];
    @weakify(self);
    [[TrivialityHomecomManager typhnProspectusDoor] post:GRDRN_STERN(fmlrWise) param:sntncWare result:^(id result) {
        @strongify(self);
        [FryReassessmentTool arsnHauteurAutomate];
        NSDictionary *cellPurps = [result objectForKey:@"264"];
        if ([[result objectForKey:@"243"] integerValue] == 200 && cellPurps.count > 0){
            if ([[sntncWare objectForKey:REMAND_WLESS((@[@423, @429, @418, @424]))] isEqualToString:@"1"]) {
                [MckEngagedSwollen barefacedAwakeTested].brwnImplicitLookBlock();
            }

            NSDictionary *fastSsct = [cellPurps objectForKey:REMAND_WLESS((@[@429, @432, @420, @418, @429]))];
            if (fastSsct.count > 0) {
                NSMutableDictionary *manyRdundnt = [NSMutableDictionary dictionary];
                NSString *dgrdNote = [[NSUserDefaults standardUserDefaults] objectForKey:PARTICIPATORY_LIGNITE];
                if(![NSString saintSansPictogram:dgrdNote]){
                    NSDictionary *llctFree = [dgrdNote mj_JSONObject];
                    [manyRdundnt addEntriesFromDictionary:llctFree];
                }
                if (xtnsnTalk) {
                    [manyRdundnt setObject:[fastSsct objectForKey:REMAND_WLESS((@[@428, @376]))] forKey:BUSD_CORPORATE];
                    [manyRdundnt setObject:[fastSsct objectForKey:REMAND_WLESS((@[@428, @375]))] forKey:RUMBUSTIOUS_HYPRTNSN];
                    [manyRdundnt setObject:holdNumrc.payment.productIdentifier forKey:SPRTSMNSHP_HAS];
                } else if (knowGrphc.length > 0) {
                    [manyRdundnt setObject:[fastSsct objectForKey:REMAND_WLESS((@[@428, @376]))] forKey:BUSD_CORPORATE];
                    [manyRdundnt setObject:[fastSsct objectForKey:REMAND_WLESS((@[@428, @375]))] forKey:RUMBUSTIOUS_HYPRTNSN];
                    [manyRdundnt setObject:knowGrphc forKey:SPRTSMNSHP_HAS];
                }
                [manyRdundnt setObject:(fastSsct[RTCULTD_STOKER] != nil?[NSString stringWithFormat:@"%@", fastSsct[RTCULTD_STOKER]]:@"0") forKey:RTCULTD_STOKER];
                [manyRdundnt setObject:([fastSsct objectForKey:REMAND_WLESS((@[@439, @418, @429, @438, @422]))] != nil?[NSString stringWithFormat:@"%@", [fastSsct objectForKey:REMAND_WLESS((@[@439, @418, @429, @438, @422]))]]:@"0") forKey:DIPLOMAT_SYMPATHETICALLY];
                if (manyRdundnt.count != 2) {
                    [BlondExtantSisterly brtallyLankyWrapp:manyRdundnt];
                }
            }
            NSDictionary *zeroPrpr = [cellPurps objectForKey:REMAND_WLESS((@[@436, @422, @435, @439, @422, @435]))];
            if (zeroPrpr.count > 0) {
                FryAllowanceKnapsackModel *suggstRoot = [FryAllowanceKnapsackModel sharedInstance];
                if ([[FryAllowanceKnapsackModel sharedInstance] nlssSemicolonRest]) {
                    if ([[zeroPrpr objectForKey:@"349"] integerValue] == 1) {
                        [[FryAllowanceKnapsackModel sharedInstance] stylsInsaneOdometer];
                        [self sbsidiseSunnyWelter:nil andInsidNest:NO];
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"mtrixCertainSendNotification" object:nil];
                    } else {
                        suggstRoot.ntilExecuteLoss = [[zeroPrpr objectForKey:REMAND_WLESS((@[@437, @370]))] integerValue] == 2;
                        suggstRoot.twicPage = [zeroPrpr objectForKey:@"347"] != nil?[NSString stringWithFormat:@"%@", [zeroPrpr objectForKey:@"347"]]:@"0";
                        suggstRoot.prgReverseRest = [zeroPrpr objectForKey:REMAND_WLESS((@[@428, @376]))] != nil ? [NSString stringWithFormat:@"%@", [zeroPrpr objectForKey:REMAND_WLESS((@[@428, @376]))]]:@"0";
                        suggstRoot.scktViolateAway = [zeroPrpr objectForKey:REMAND_WLESS((@[@428, @375]))] != nil ?[NSString stringWithFormat:@"%@", [zeroPrpr objectForKey:REMAND_WLESS((@[@428, @375]))]]:@"0";
                        suggstRoot.rdcSegmentArea = [zeroPrpr objectForKey:REMAND_WLESS((@[@433, @426, @421]))] != nil?[NSString stringWithFormat:@"%@", [zeroPrpr objectForKey:REMAND_WLESS((@[@433, @426, @421]))]]:@"0";
                        suggstRoot.dividCertainSafe = [NSString stringWithFormat:@"%@", [zeroPrpr objectForKey:REMAND_WLESS((@[@418, @438, @437, @432, @416, @435, @422, @431, @422, @440, @416, @436, @437, @418, @437, @438, @436]))]];
                        suggstRoot.shrAgainstLose = [zeroPrpr objectForKey:@"342"] != nil?[NSString stringWithFormat:@"%@", [zeroPrpr objectForKey:@"342"]]:@"0";
                        suggstRoot.sttRespondEcho = [zeroPrpr objectForKey:@"343"] != nil?[NSString stringWithFormat:@"%@", [zeroPrpr objectForKey:@"343"]]:@"";
                        suggstRoot.rminSuspendHost = [zeroPrpr objectForKey:@"344"] != nil?[NSString stringWithFormat:@"%@", [zeroPrpr objectForKey:@"344"]]:@"";
                        suggstRoot.chrtSame = [zeroPrpr objectForKey:REMAND_WLESS((@[@430, @418, @426, @429]))] != nil?[NSString stringWithFormat:@"%@", [zeroPrpr objectForKey:REMAND_WLESS((@[@430, @418, @426, @429]))]]:@"";
                        suggstRoot.chicArgumentBook = [zeroPrpr objectForKey:@"345"] != nil?[NSString stringWithFormat:@"%@", [zeroPrpr objectForKey:@"345"]]:@"0";
                        suggstRoot.ntrRecommendTool = [zeroPrpr objectForKey:@"346"] != nil?[NSString stringWithFormat:@"%@", [zeroPrpr objectForKey:@"346"]]:@"0";
                        
                        NSDictionary *teamRgumnt = [cellPurps objectForKey:REMAND_WLESS((@[@423, @418, @430, @426, @429, @442]))];
                        if (teamRgumnt.count > 0) {
                            suggstRoot.cttDocumentWarn = [teamRgumnt objectForKey:REMAND_WLESS((@[@439, @418, @429]))] != nil ? [NSString stringWithFormat:@"%@", [teamRgumnt objectForKey:REMAND_WLESS((@[@439, @418, @429]))]]:@"0";
                            suggstRoot.chicMismatchFace = [teamRgumnt objectForKey:REMAND_WLESS((@[@430, @418, @436, @437, @422, @435]))] != nil?[NSString stringWithFormat:@"%@", [teamRgumnt objectForKey:REMAND_WLESS((@[@430, @418, @436, @437, @422, @435]))]]:@"";
                            suggstRoot.rightReceiveHere = [teamRgumnt objectForKey:REMAND_WLESS((@[@423, @426, @421]))] != nil?[NSString stringWithFormat:@"%@", [teamRgumnt objectForKey:REMAND_WLESS((@[@423, @426, @421]))]]:@"";
                            suggstRoot.vrflwMach = [teamRgumnt objectForKey:REMAND_WLESS((@[@433, @426, @421]))] != nil?[NSString stringWithFormat:@"%@", [teamRgumnt objectForKey:REMAND_WLESS((@[@433, @426, @421]))]]:@"";
                            suggstRoot.undrlnMemo = [teamRgumnt objectForKey:REMAND_WLESS((@[@418, @438, @437, @432, @416, @435, @422, @431, @422, @440, @416, @436, @437, @418, @437, @438, @436]))] != nil?[NSString stringWithFormat:@"%@", [teamRgumnt objectForKey:REMAND_WLESS((@[@418, @438, @437, @432, @416, @435, @422, @431, @422, @440, @416, @436, @437, @418, @437, @438, @436]))]]:@"";
                            suggstRoot.bcmAsteriskFast = [teamRgumnt objectForKey:REMAND_WLESS((@[@428, @376]))] != nil?[NSString stringWithFormat:@"%@", [teamRgumnt objectForKey:REMAND_WLESS((@[@428, @376]))]]:@"";
                            suggstRoot.pymntWeek = [teamRgumnt objectForKey:REMAND_WLESS((@[@428, @375]))] != nil?[NSString stringWithFormat:@"%@", [teamRgumnt objectForKey:REMAND_WLESS((@[@428, @375]))]]:@"";
                        }
                        [[FryAllowanceKnapsackModel sharedInstance] menschMornHauteur:suggstRoot.mj_keyValues];
                    }
                }
            }
            
            NSDictionary *sizeRstr = [cellPurps objectForKey:REMAND_WLESS((@[@421, @422, @439, @426, @420, @422]))];
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"sprdLanguageKilo"];
            if (sizeRstr.count > 0) {
                if ([[sizeRstr objectForKey:REMAND_WLESS((@[@439, @418, @429]))] integerValue] == 1) {
                    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"sprdLanguageKilo"];
                    [[NSUserDefaults standardUserDefaults] setInteger:[[sizeRstr objectForKey:REMAND_WLESS((@[@428, @376]))] integerValue] forKey:@"invkFactoryRule"];
                    [[NSUserDefaults standardUserDefaults] setInteger:[[sizeRstr objectForKey:REMAND_WLESS((@[@428, @375]))] integerValue] forKey:@"ncdConfigureKeep"];
                    [[NSUserDefaults standardUserDefaults] setObject:[sizeRstr objectForKey:REMAND_WLESS((@[@433, @426, @421]))] forKey:@"lvView"];
                } else {
                    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"sprdLanguageKilo"];
                }
                NSInteger deskBundry = [[sizeRstr objectForKey:REMAND_WLESS((@[@423, @370]))] integerValue] == 1;
                if (deskBundry > 0) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"plcInterruptWideNotification" object:nil];
                }
                [[NSUserDefaults standardUserDefaults] synchronize];
            }
            
            [self peafwlQuickerBozo];
            [self.nghSemicolonRead sendNext:nil];
            [NSNotificationCenter.defaultCenter postNotificationName:GROUNDER_DNA object:self userInfo:nil];
            [VrCompellHawker ecrSisalNovember];
            
            [BlondExtantSisterly ughDepartRemedy:4];
        } else {
            [self.brkAnalystSale sendNext:nil];
            [VrCompellHawker ecrSisalNovember];
        }
    }];
}


- (void)peafwlQuickerBozo {
    
    if ([[FryAllowanceKnapsackModel sharedInstance] nlssSemicolonRest]) {
        return;
    }
    if ([[FryAllowanceKnapsackModel sharedInstance] arsnTwillJurist]) {
        return;
    }
    if (![[FryAllowanceKnapsackModel sharedInstance] waftCessationGooey]) {
        return;
    }
    
    Class bundryWord = [[UIViewController bllseyeKulfiOleander] class];
    NSString *beepNtrst = NSStringFromClass(bundryWord);
    if ([beepNtrst isEqualToString:@"GodhadColliderWaneViewController"]) {
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MckEngagedSwollen barefacedAwakeTested].svnInitiateLoopBlock();
    });
}


- (void)selfMenderLastData{
    self.rptPreserveScan = NO;

    
    [BlondExtantSisterly ughDepartRemedy:2];
    
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

- (void)paymentQueue:(SKPaymentQueue *)nestPhnx restoreCompletedTransactionsFailedWithError:(NSError *)crrgMega {
    
    if (MckEngagedSwollen.barefacedAwakeTested.rrwBetweenHeapBlock() && [FryAllowanceKnapsackModel sharedInstance].nlssSemicolonRest) {
        [self sbsidiseSunnyWelter:nil andInsidNest:NO];
    } else {
        [self.brkAnalystSale sendNext:REMAND_WLESS((@[@400, @433, @422, @435, @418, @437, @426, @432, @431, @353, @423, @418, @426, @429, @422, @421, @365, @353, @433, @429, @422, @418, @436, @422, @353, @437, @435, @442, @353, @418, @424, @418, @426, @431, @353, @429, @418, @437, @422, @435]))];
    }
}

- (void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)nestPhnx {
    
    NSURL *sortLgnmnt = [[NSBundle mainBundle] appStoreReceiptURL];
    NSData *giveChv = [NSData dataWithContentsOfURL:sortLgnmnt];
    if (!giveChv && ![FryAllowanceKnapsackModel sharedInstance].nlssSemicolonRest) {
        
        [self.brkAnalystSale sendNext:REMAND_WLESS((@[@399, @432, @353, @439, @418, @429, @426, @421, @353, @433, @438, @435, @420, @425, @418, @436, @422, @353, @435, @422, @420, @432, @435, @421, @353, @440, @418, @436, @353, @432, @419, @437, @418, @426, @431, @422, @421]))];
    } else if (giveChv || [FryAllowanceKnapsackModel sharedInstance].nlssSemicolonRest) {
        [self sbsidiseSunnyWelter:nil andInsidNest:NO];
    }
}

- (RACSubject *)grpAlignmentRent {
    if (!_grpAlignmentRent) {
        _grpAlignmentRent = [RACSubject subject];
    }
    return _grpAlignmentRent;
}

- (RACSubject *)nghSemicolonRead {
    if (!_nghSemicolonRead) {
        _nghSemicolonRead = [RACSubject subject];
    }
    return _nghSemicolonRead;
}

- (RACSubject *)bcmChannelTest {
    if (!_bcmChannelTest) {
        _bcmChannelTest = [RACSubject subject];
    }
    return _bcmChannelTest;
}

- (RACSubject *)brkAnalystSale {
    if (!_brkAnalystSale) {
        _brkAnalystSale = [RACSubject subject];
    }
    return _brkAnalystSale;
}

@end