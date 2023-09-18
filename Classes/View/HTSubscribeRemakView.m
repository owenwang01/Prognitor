//
//  HTSubscribeRemakView.m
// 
//
//  Created by Apple on 2022/11/20.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTSubscribeRemakView.h"
#import "HTSubscribeRemarkListViewCell.h"
#import "HTSubscribeRemarkListModel.h"

@interface HTSubscribeRemakView ()

@property (nonatomic, strong) NSMutableArray *infoArray;

@end

@implementation HTSubscribeRemakView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self lgjeropj_addSubViews];
    }
    return self;
}

- (void)lgjeropj_addSubViews {
    
    self.infoArray = @[].mutableCopy;
    HTSubscribeRemarkListModel *var_model1 = [HTSubscribeRemarkListModel modelWithTitle:LocalString(@"Subscription automatically renews unless auto-renewal is disabled at least 24 hours before the end of the current period.", nil) andDescribe:LocalString(@"Subscription automatically renews", nil)];
    [self.infoArray addObject:var_model1];
    
    HTSubscribeRemarkListModel *var_model2 = [HTSubscribeRemarkListModel modelWithTitle:LocalString(@"Subscriptions can be managed by the user and automatic renewal can be disabled by going to the User Account Settings after purchase.", nil) andDescribe:LocalString(@"automatic renewal can be disabled", nil)];
    [self.infoArray addObject:var_model2];
    
    HTSubscribeRemarkListModel *var_model3 = [HTSubscribeRemarkListModel modelWithTitle:LocalString(@"You must confirm and pay the VIP subscription through the iTunes account in the purchase confirmation.", nil) andDescribe:@""];
    [self.infoArray addObject:var_model3];
    
    HTSubscribeRemarkListModel *var_model4 = [HTSubscribeRemarkListModel modelWithTitle:LocalString(@"Any unused portion of a free trial period, if offered, will be forfeited when the user purchases a subscription to that publication, where applicable.", nil) andDescribe:@""];
    [self.infoArray addObject:var_model4];
    
    HTSubscribeRemarkListModel *var_model5 = [HTSubscribeRemarkListModel modelWithTitle:LocalString(@"The VIP subscription is automatically renewed.", nil) andDescribe:LocalString(@"The VIP subscription is automatically renewed.", nil)];
    [self.infoArray addObject:var_model5];
    
    HTSubscribeRemarkListModel *var_model6 = [HTSubscribeRemarkListModel modelWithTitle:LocalString(@"Subscriptions length: Weekly,Monthly,Annually.", nil) andDescribe:@""];
    [self.infoArray addObject:var_model6];
    
    NSString *messageStringOne = LocalString(@"Terms of Service", nil);
    HTSubscribeRemarkListModel *var_model7 = [HTSubscribeRemarkListModel modelWithTitle:[NSString stringWithFormat:@"%@:%@", messageStringOne, kTermsURL] andDescribe:kTermsURL];
    var_model7.var_highUnderline = YES;
    var_model7.var_canTap = YES;
    [self.infoArray addObject:var_model7];
    
    NSString *messageString = LocalString(@"Privacy Policy", nil);
    HTSubscribeRemarkListModel *var_model8 = [HTSubscribeRemarkListModel modelWithTitle:[NSString stringWithFormat:@"%@:%@", messageString, kPrivacyPolicyURL] andDescribe:kPrivacyPolicyURL];
    var_model8.var_highUnderline = YES;
    var_model8.var_canTap = YES;
    [self.infoArray addObject:var_model8];
    
    HTSubscribeRemarkListViewCell *tempView = nil;
    for (int i = 0; i < [self.infoArray count]; i++) {
        HTSubscribeRemarkListModel *model = self.infoArray[i];
        HTSubscribeRemarkListViewCell *view = [[HTSubscribeRemarkListViewCell alloc] init];
        [view ht_updateCellWithData:model];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.top.mas_equalTo(0);
            } else {
                make.top.equalTo(tempView.mas_bottom);
            }
            make.height.mas_equalTo(model.var_textHeight);
            make.left.right.mas_equalTo(0);
            if (i == self.infoArray.count - 1) {
                make.bottom.mas_equalTo(0);
            }
        }];
        tempView = view;
    }
}

@end
