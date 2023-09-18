//
//  HTSubscribeGuideManager.m
//  GuessNums
//
//  Created by 李雪健 on 2023/6/19.
//

#import "HTSubscribeGuideManager.h"

@implementation HTSubscribeGuideManager

+ (UIButton *)lgjeropj_closeButton {
    
    UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
    [view setImage:[UIImage imageNamed:@"icon_glclose"] forState:UIControlStateNormal];
    return view;
}

+ (UIScrollView *)lgjeropj_scrollView {
    
    UIScrollView *view = [[UIScrollView alloc] initWithFrame:CGRectZero];
    view.showsVerticalScrollIndicator = NO;
    view.showsHorizontalScrollIndicator = NO;
    view.userInteractionEnabled = YES;
    view.contentSize = CGSizeMake(0, SCREEN_HEIGHT - kNavHeight - SCREEN_BOTTOM_SAFEAREA);
    return view;
}

+ (UIImageView *)lgjeropj_coverView {
    
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectZero];
    [view sd_setImageWithURL:kImageNumber(237)];
    return view;
}

+ (UILabel *)lgjeropj_titleLabel {
    
    UILabel *view = [[UILabel alloc] initWithFrame:CGRectZero];
    view.font = [UIFont boldSystemFontOfSize:22.0];
    view.textColor = [UIColor ht_colorWithHexString:@"#E29F4B"];
    view.textAlignment = NSTextAlignmentCenter;
    view.text = LocalString(@"Unlock all movies", nil);
    return view;
}

+ (UILabel *)lgjeropj_subTitleLabel {
    
    UILabel *view = [[UILabel alloc] initWithFrame:CGRectZero];
    view.font = [UIFont systemFontOfSize:14.0];
    view.textColor = [UIColor ht_colorWithHexString:@"#B29167"];
    view.textAlignment = NSTextAlignmentCenter;
    view.lineBreakMode = NSLineBreakByWordWrapping;
    view.numberOfLines = 0;
    view.text = LocalString(@"Watch full movies and TV shows without sharing.", nil);
    return view;
}

+ (LoadActivityIndicatorButton *)lgjeropj_subscribeButton {
    
    LoadActivityIndicatorButton *view = [LoadActivityIndicatorButton buttonWithType:UIButtonTypeCustom];
    view.frame = CGRectMake(0, 0, SCREEN_WIDTH - 38 * 3 - 20, 60);
    [view sd_setBackgroundImageWithURL:kImageNumber(53) forState:UIControlStateNormal];
    view.layer.cornerRadius = 5;
    view.layer.masksToBounds = YES;
    [view setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    view.titleLabel.font = [UIFont boldSystemFontOfSize:24];
    return view;
}

+ (UILabel *)lgjeropj_discountLabel {
    
    UILabel *view = [[UILabel alloc] initWithFrame:CGRectZero];
    view.font = [UIFont systemFontOfSize:13.0];
    view.textColor = [UIColor whiteColor];
    view.textAlignment = NSTextAlignmentCenter;
    view.backgroundColor = [UIColor ht_colorWithHexString:@"#C18934"];
    view.frame = CGRectMake(-20, 7, 80, 20);
    view.transform = CGAffineTransformMakeRotation(-M_PI_2 * 0.42);
    view.hidden = YES;
    return view;
}

+ (UILabel *)lgjeropj_remarkLabel {
    
    UILabel *view = [[UILabel alloc] initWithFrame:CGRectZero];
    view.font = [UIFont boldSystemFontOfSize:10.0];
    view.textColor = [UIColor ht_colorWithHexString:@"#E29F4B"];
    view.textAlignment = NSTextAlignmentCenter;
    view.text = LocalString(@"Cancel Anytime", nil);
    return view;
}

+ (UIButton *)lgjeropj_morePlanButton {
    
    UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
    [view setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    view.titleLabel.font = [UIFont systemFontOfSize:14];
    NSString *planButtonText = LocalString(@"Choose more plans", nil);
    NSMutableAttributedString *remarkAttr = [[NSMutableAttributedString alloc] initWithString:planButtonText];
    [remarkAttr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, planButtonText.length)];
    [view setAttributedTitle:remarkAttr forState:UIControlStateNormal];
    return view;
}

@end
