







#import "MothballAimlesslyCell.h"
#import "NdrdonScathSubsistModel.h"
#import "YYText.h"
#import "NSString+GophrWestHegemonic.h"

@interface MothballAimlesslyCell ()

@property (nonatomic, strong) YYLabel *plsExhaustRootLabel;

@end

@implementation MothballAimlesslyCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self peppyCassetteRosebud];
    }
    return self;
}

- (void)peppyCassetteRosebud{
    self.backgroundColor = [UIColor clearColor];
    YYLabel *mnfstGiga = [[YYLabel alloc] initWithFrame:CGRectZero];
    [self addSubview:mnfstGiga];
    [mnfstGiga mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(32);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(-16);
        make.bottom.mas_equalTo(0);
    }];
    mnfstGiga.lineBreakMode = NSLineBreakByWordWrapping;
    mnfstGiga.numberOfLines = 0;
    mnfstGiga.font = [UIFont systemFontOfSize:12];
    mnfstGiga.textVerticalAlignment = YYTextVerticalAlignmentTop;
    self.plsExhaustRootLabel = mnfstGiga;
    UIView *bundrySort = [[UIView alloc] initWithFrame:CGRectZero];
    bundrySort.layer.cornerRadius = 3;
    bundrySort.layer.masksToBounds = YES;
    bundrySort.backgroundColor = [UIColor whiteColor];
    [self addSubview:bundrySort];
    [bundrySort mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.top.equalTo(mnfstGiga.mas_top).offset(5);
        make.size.mas_equalTo(CGSizeMake(6, 6));
    }];
}

- (void)barrelPeriodicSisal:(NdrdonScathSubsistModel *)memoPnn{
    NSString *xhustPlus = memoPnn.title;
    NSMutableAttributedString *squzBlue = [[NSMutableAttributedString alloc] initWithString:xhustPlus];
    squzBlue.yy_color = [UIColor whiteColor];
    squzBlue.yy_lineBreakMode = NSLineBreakByWordWrapping;
    if(![NSString saintSansPictogram:memoPnn.describe]){
        NSRange manyTtmpt = [memoPnn.title rangeOfString:memoPnn.describe];
        if(memoPnn.slryAutomaticHang){
            CZECH_MIDGET
            [squzBlue yy_setTextHighlightRange:manyTtmpt color:[UIColor swipeScabiesNomad:@"#5a97f4"] backgroundColor:nil tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange manyTtmpt, CGRect rect) {
                NSURL *nameCurrnt = [NSURL URLWithString:LOCKDOWN_BOGAN(memoPnn.describe).narcisssTwillMouldy];
                if ([[UIApplication sharedApplication] canOpenURL:nameCurrnt]) {
                    [[UIApplication sharedApplication] openURL:nameCurrnt options:@{} completionHandler:nil];
                }
            }];
        }else{
            [squzBlue yy_setTextHighlightRange:manyTtmpt color:[UIColor swipeScabiesNomad:@"#5a97f4"] backgroundColor:nil userInfo:nil];
        }
        if(memoPnn.ppndClassifyPool){
            [squzBlue yy_setUnderlineColor:[UIColor swipeScabiesNomad:@"#5a97f4"] range:manyTtmpt];
            [squzBlue yy_setUnderlineStyle:(NSUnderlineStyleSingle) range:manyTtmpt];
        }
    }
    self.plsExhaustRootLabel.attributedText = squzBlue;
}

@end