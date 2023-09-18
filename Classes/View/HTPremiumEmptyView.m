//
//  HTPremiumEmptyView.m
//  WillDrawApp
//
//  Created by admin on 2023/1/4.
//

#import "HTPremiumEmptyView.h"
#import "HTAccountModel.h"

@interface HTPremiumEmptyView ()

@property (nonatomic, strong) UIImageView *var_imageView;
@property (nonatomic, strong) UILabel *var_currentLabel;

@end
@implementation HTPremiumEmptyView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self ht_addCellSubViews];
    }
    return self;
}

- (void)ht_addCellSubViews {
    
    self.backgroundColor = [UIColor ht_colorWithHexString:@"#11101E"];
    
    CGFloat remindHeight = 300;
    self.remindView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, remindHeight)];
    [self addSubview:self.remindView];
    [self.remindView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(100);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(remindHeight);
    }];
    self.remindView.backgroundColor = [UIColor clearColor];
    
    NSString *warnString = AsciiString(@"WARNING");
    CGFloat warnWidth = [warnString sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}].width;
    UILabel *warnLab = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - warnWidth - 20)/2, 20, warnWidth + 20, 40)];
    [self.remindView addSubview:warnLab];
    warnLab.text = warnString;
    warnLab.textColor = [UIColor whiteColor];
    warnLab.font = [UIFont boldSystemFontOfSize:18];
    warnLab.textAlignment = NSTextAlignmentCenter;
    
    UIImageView *warnLeftImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(warnLab.frame) -32, 32, 32, 16)];
    [warnLeftImg sd_setImageWithURL:kImageNumber(240)];
    [self.remindView addSubview:warnLeftImg];
    UIImageView *warnRightImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(warnLab.frame), 32, 32, 16)];
    [warnRightImg sd_setImageWithURL:kImageNumber(241)];
    [self.remindView addSubview:warnRightImg];
    
    NSString *firstString = LocalString(@"Because of Apple Policy, you cannot subscribe here.", nil);
    NSString *secondString = LocalString(@"You can download the new APP to subscribe.", nil);
    if ([HTAccountModel sharedInstance].ht_isVip) {
        firstString = LocalString(@"Because of Apple Policy, you cannot renew or upgrade your subscription here.", nil);
        secondString = LocalString(@"You can download the new APP to renew or upgrade your subscription.", nil);
    }
    NSString *contentString = [NSString stringWithFormat:@"%@\n%@",firstString,secondString];
    CGSize boundingSize = CGSizeMake(SCREEN_WIDTH-40, MAXFLOAT);
    CGSize textSize = [contentString boundingRectWithSize:boundingSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    CGFloat contentHeight = textSize.height + 40;
    UILabel *contentLab = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(warnLab.frame), SCREEN_WIDTH-40, contentHeight)];
    [self.remindView addSubview:contentLab];
    contentLab.text = contentString;
    contentLab.textColor = [UIColor whiteColor];
    contentLab.font = [UIFont systemFontOfSize:15];
    contentLab.textAlignment = NSTextAlignmentCenter;
    contentLab.numberOfLines = 0;
    
    CGFloat tapYHeight = CGRectGetMaxY(contentLab.frame)+20;
    if (tapYHeight + 50 > remindHeight) {
        tapYHeight = remindHeight - 50;
    }
    UIButton *tapButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.15, tapYHeight, SCREEN_WIDTH*0.7, 50)];
    [self.remindView addSubview:tapButton];
    [tapButton setTitle:LocalString(@"DOWNLOAD NOW", nil) forState:UIControlStateNormal];
    [tapButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    tapButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [tapButton addTarget:self action:@selector(lgjeropj_tapButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    tapButton.layer.masksToBounds = YES;
    tapButton.layer.cornerRadius = 10.0;
    tapButton.backgroundColor = [UIColor ht_colorWithHexString:@"#7775FF"];
}

- (void)lgjeropj_tapButtonAction:(UIButton *)button {
    
    if (self.emptyBlock) {
        self.emptyBlock();
    }
}

@end
