//
//  HTSubscribeListCellManager.m
//  GuessNums
//
//  Created by 李雪健 on 2023/6/16.
//

#import "HTSubscribeListCellManager.h"

@implementation HTSubscribeListCellManager

+ (UIView *)lgjeropj_backgroundView {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.layer.cornerRadius = 12.0;
    view.layer.masksToBounds = YES;
    return view;
}

+ (UIView *)lgjeropj_lineView {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [[UIColor ht_colorWithHexString:@"#000000"] colorWithAlphaComponent:0.1];
    return view;
}

+ (UILabel *)lgjeropj_unitLabel {
    
    UILabel *view = [[UILabel alloc] initWithFrame:CGRectZero];
    view.frame = CGRectMake(26, 162, 8, 16);
    view.numberOfLines = 0;
    view.font = [UIFont systemFontOfSize:14];
    view.textColor = [UIColor ht_colorWithHexString:@"#685034"];
    view.text = AsciiString(@"$");
    return view;
}

+ (UIButton *)lgjeropj_bestButton
{
    UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
    view.titleLabel.font = [UIFont systemFontOfSize:11];
    view.titleLabel.textAlignment = NSTextAlignmentCenter;
    [view setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [view sd_setBackgroundImageWithURL:kImageNumber(234) forState:UIControlStateNormal];
    view.hidden = YES;
    return view;
}

+ (UIButton *)lgjeropj_premiumButton {
    
    UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 16.0f;
    view.layer.masksToBounds = YES;
    [view setTitle:LocalString(@"Get Premium", nil) forState:UIControlStateNormal];
    view.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [view setTitleColor:[UIColor ht_colorWithHexString:@"#111111"] forState:UIControlStateNormal];
    return view;
}

+ (UILabel *)lgjeropj_trialView {
    
    UILabel *view = [[UILabel alloc] init];
    view.font = [UIFont systemFontOfSize:14];
    view.textColor = [UIColor ht_colorWithHexString:@"#222222"];
    view.text = LocalString(@"Trial", nil);
    view.textAlignment = NSTextAlignmentCenter;
    view.backgroundColor = [UIColor ht_colorWithHexString:@"#FFB054"];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 69, 24) byRoundingCorners:(UIRectCornerBottomLeft) cornerRadii:CGSizeMake(12, 12)];
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.frame = view.bounds;
    shapeLayer.path = bezierPath.CGPath;
    view.layer.mask = shapeLayer;
    return view;
}

+ (UILabel *)lgjeropj_timeLabel {
    
    UILabel *view = [[UILabel alloc] init];
    view.font = [UIFont boldSystemFontOfSize:14];
    view.textColor = [UIColor ht_colorWithHexString:@"#685034"];
    return view;
}

+ (UILabel *)lgjeropj_priceLabel {
    
    UILabel *view = [[UILabel alloc] init];
    view.font = [UIFont boldSystemFontOfSize:32];
    view.textColor = [UIColor ht_colorWithHexString:@"#685034"];
    return view;
}

+ (UILabel *)lgjeropj_priceRemarkLabel {
    
    UILabel *view = [[UILabel alloc] init];
    view.font = [UIFont systemFontOfSize:12];
    view.textColor = [UIColor ht_colorWithHexString:@"#685034"];
    view.numberOfLines = 0;
    view.lineBreakMode = NSLineBreakByCharWrapping;
    return view;
}

+ (UILabel *)lgjeropj_introduceLabel {
    
    UILabel *view = [[UILabel alloc] init];
    view.font = [UIFont boldSystemFontOfSize:12];
    view.textColor = [UIColor ht_colorWithHexString:@"#222222"];
    view.numberOfLines = 0;
    view.lineBreakMode = NSLineBreakByWordWrapping;
    return view;
}

+ (UILabel *)lgjeropj_discountNumLabel {
    
    UILabel *view = [[UILabel alloc] init];
    view.font = [UIFont boldSystemFontOfSize:10];
    view.backgroundColor = [UIColor ht_colorWithHexString:@"#000000"];
    view.textColor = [UIColor whiteColor];
    view.textAlignment = NSTextAlignmentCenter;
    return view;
}

+ (UILabel *)lgjeropj_discountLabel {
    
    UILabel *view = [[UILabel alloc] init];
    view.font = [UIFont systemFontOfSize:10];
    view.textColor = [UIColor ht_colorWithHexString:@"#222222"];
    view.backgroundColor = [UIColor ht_colorWithHexString:@"#FFB054"];
    view.textAlignment = NSTextAlignmentCenter;
    return view;
}

+ (UILabel *)lgjeropj_originPriceLabel {
    
    UILabel *view = [[UILabel alloc] init];
    view.font = [UIFont systemFontOfSize:12];
    view.textColor = [UIColor ht_colorWithHexString:@"#685034"];
    view.numberOfLines = 0;
    view.lineBreakMode = NSLineBreakByCharWrapping;
    view.text = @"";
    return view;
}

@end
