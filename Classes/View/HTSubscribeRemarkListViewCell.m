//
//  HTSubscribeRemarkListViewCell.m
// 
//
//  Created by Apple on 2022/11/20.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTSubscribeRemarkListViewCell.h"
#import "HTSubscribeRemarkListModel.h"
#import "YYText.h"
#import "NSString+Extension.h"

@interface HTSubscribeRemarkListViewCell ()

@property (nonatomic, strong) YYLabel *contentLabel;

@end

@implementation HTSubscribeRemarkListViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self lgjeropj_addSubViews];
    }
    return self;
}

- (void)lgjeropj_addSubViews{
    self.backgroundColor = [UIColor clearColor];
    YYLabel *contentLabel = [[YYLabel alloc] initWithFrame:CGRectZero];
    [self addSubview:contentLabel];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(32);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(-16);
        make.bottom.mas_equalTo(0);
    }];
    contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    contentLabel.numberOfLines = 0;
    contentLabel.font = [UIFont systemFontOfSize:12];
    contentLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
    self.contentLabel = contentLabel;
    UIView *dotView = [[UIView alloc] initWithFrame:CGRectZero];
    dotView.layer.cornerRadius = 3;
    dotView.layer.masksToBounds = YES;
    dotView.backgroundColor = [UIColor whiteColor];
    [self addSubview:dotView];
    [dotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.top.equalTo(contentLabel.mas_top).offset(5);
        make.size.mas_equalTo(CGSizeMake(6, 6));
    }];
}

- (void)ht_updateCellWithData:(HTSubscribeRemarkListModel *)model{
    NSString *contentText = model.title;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:contentText];
    attr.yy_color = [UIColor whiteColor];
    attr.yy_lineBreakMode = NSLineBreakByWordWrapping;
    if(![NSString ht_isEmpty:model.describe]){
        NSRange range = [model.title rangeOfString:model.describe];
        if(model.var_canTap){
            kself
            [attr yy_setTextHighlightRange:range color:[UIColor ht_colorWithHexString:@"#5B98F3"] backgroundColor:nil tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                NSURL *url = [NSURL URLWithString:kFormat(model.describe).ht_isEmptyStr];
                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
                }
            }];
        }else{
            [attr yy_setTextHighlightRange:range color:[UIColor ht_colorWithHexString:@"#5B98F3"] backgroundColor:nil userInfo:nil];
        }
        if(model.var_highUnderline){
            [attr yy_setUnderlineColor:[UIColor ht_colorWithHexString:@"#5B98F3"] range:range];
            [attr yy_setUnderlineStyle:(NSUnderlineStyleSingle) range:range];
        }
    }
    self.contentLabel.attributedText = attr;
}

@end
