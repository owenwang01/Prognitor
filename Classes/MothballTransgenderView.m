






#import "MothballTransgenderView.h"
#import "FryAllowanceKnapsackModel.h"

@interface MothballTransgenderView ()

@property (nonatomic, strong) UIImageView *prfrmBusy;
@property (nonatomic, strong) UILabel *dcidAgainstItemLabel;

@end
@implementation MothballTransgenderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self typhnPeriodicScabies];
    }
    return self;
}

- (void)typhnPeriodicScabies {
    
    self.backgroundColor = [UIColor swipeScabiesNomad:@"#10111d"];
    
    CGFloat rdundntCase = 300;
    self.frcKeywordEasyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, PLYHUS_REGULARIZE, rdundntCase)];
    [self addSubview:self.frcKeywordEasyView];
    [self.frcKeywordEasyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(100);
        make.width.mas_equalTo(PLYHUS_REGULARIZE);
        make.height.mas_equalTo(rdundntCase);
    }];
    self.frcKeywordEasyView.backgroundColor = [UIColor clearColor];
    
    NSString *heapMsmtch = REMAND_WLESS((@[@408, @386, @403, @399, @394, @399, @392]));
    CGFloat pushPrdct = [heapMsmtch sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}].width;
    UILabel *lossDcsn = [[UILabel alloc] initWithFrame:CGRectMake((PLYHUS_REGULARIZE - pushPrdct - 20)/2, 20, pushPrdct + 20, 40)];
    [self.frcKeywordEasyView addSubview:lossDcsn];
    lossDcsn.text = heapMsmtch;
    lossDcsn.textColor = [UIColor whiteColor];
    lossDcsn.font = [UIFont boldSystemFontOfSize:18];
    lossDcsn.textAlignment = NSTextAlignmentCenter;
    
    UIImageView *sureRspnd = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(lossDcsn.frame) -32, 32, 32, 16)];
    [sureRspnd sd_setImageWithURL:ENCOURAGE_FREEHOLD(240)];
    [self.frcKeywordEasyView addSubview:sureRspnd];
    UIImageView *rtrvMenu = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lossDcsn.frame), 32, 32, 16)];
    [rtrvMenu sd_setImageWithURL:ENCOURAGE_FREEHOLD(241)];
    [self.frcKeywordEasyView addSubview:rtrvMenu];
    
    NSString *easyUslss = MUNICIPAL_INDISCRETION(961);
    NSString *busyNtrvn = MUNICIPAL_INDISCRETION(967);
    if ([FryAllowanceKnapsackModel sharedInstance].favelaLaburnumInfect) {
        easyUslss = MUNICIPAL_INDISCRETION(964);
        busyNtrvn = MUNICIPAL_INDISCRETION(956);
    }
    NSString *caseNywhr = [NSString stringWithFormat:@"%@\n%@",easyUslss,busyNtrvn];
    CGSize ddrssMode = CGSizeMake(PLYHUS_REGULARIZE-40, MAXFLOAT);
    CGSize wiseCcdnt = [caseNywhr boundingRectWithSize:ddrssMode options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    CGFloat nearNumrc = wiseCcdnt.height + 40;
    UILabel *mstkTiny = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(lossDcsn.frame), PLYHUS_REGULARIZE-40, nearNumrc)];
    [self.frcKeywordEasyView addSubview:mstkTiny];
    mstkTiny.text = caseNywhr;
    mstkTiny.textColor = [UIColor whiteColor];
    mstkTiny.font = [UIFont systemFontOfSize:15];
    mstkTiny.textAlignment = NSTextAlignmentCenter;
    mstkTiny.numberOfLines = 0;
    
    CGFloat prducLink = CGRectGetMaxY(mstkTiny.frame)+20;
    if (prducLink + 50 > rdundntCase) {
        prducLink = rdundntCase - 50;
    }
    UIButton *vlutTrue = [[UIButton alloc] initWithFrame:CGRectMake(PLYHUS_REGULARIZE*0.15, prducLink, PLYHUS_REGULARIZE*0.7, 50)];
    [self.frcKeywordEasyView addSubview:vlutTrue];
    [vlutTrue setTitle:MUNICIPAL_INDISCRETION(966) forState:UIControlStateNormal];
    [vlutTrue setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    vlutTrue.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [vlutTrue addTarget:self action:@selector(trellisWrappGropeCell:) forControlEvents:UIControlEventTouchUpInside];
    vlutTrue.layer.masksToBounds = YES;
    vlutTrue.layer.cornerRadius = 10.0;
    vlutTrue.backgroundColor = [UIColor swipeScabiesNomad:@"#7876ff"];
}

- (void)trellisWrappGropeCell:(UIButton *)highRdfn {
    
    if (self.slidAlignmentMonoBlock) {
        self.slidAlignmentMonoBlock();
    }
}

@end