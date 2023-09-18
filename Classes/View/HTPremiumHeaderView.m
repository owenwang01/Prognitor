//
//  HTPremiumHeaderView.m
//  Axcolly
//
//  Created by 李雪健 on 2023/6/29.
//

#import "HTPremiumHeaderView.h"
#import "HTAccountModel.h"
#import <MJExtension/MJExtension.h>
#import "NSString+Extension.h"

@interface HTPremiumHeaderView ()

@property (nonatomic, strong) UILabel *var_currentLabel;

@end

@implementation HTPremiumHeaderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self lgjeropj_addSubViews];
    }
    return self;
}

- (void)lgjeropj_addSubViews {
    
    self.var_imageView = [[UIImageView alloc] init];
    self.var_imageView.userInteractionEnabled = YES;
    self.var_imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.var_imageView.layer.masksToBounds = YES;
    self.var_imageView.layer.cornerRadius = 12;
    [self.var_imageView sd_setImageWithURL:kImageNumber(250)];
    [self addSubview:self.var_imageView];
    [self.var_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.bottom.mas_equalTo(-5);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
    }];
    self.var_currentLabel = [[UILabel alloc] init];
    self.var_currentLabel.text = LocalString(@"Current Plan", nil);
    self.var_currentLabel.textColor = [UIColor ht_colorWithHexString:@"#222222"];
    self.var_currentLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.var_imageView addSubview:self.var_currentLabel];
    [self.var_currentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(72);
        make.left.mas_equalTo(20);
    }];
    self.var_planLabel = [[UILabel alloc] init];
    self.var_planLabel.numberOfLines = 2;
    self.var_planLabel.textAlignment = NSTextAlignmentRight;
    self.var_planLabel.textColor = [UIColor ht_colorWithHexString:@"#222222"];
    self.var_planLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.var_imageView addSubview:self.var_planLabel];
    [self.var_planLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.var_currentLabel);
        make.right.mas_equalTo(-20);
    }];
    
    self.var_lineView = [[UIView alloc] init];
    self.var_lineView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
    [self.var_imageView addSubview:self.var_lineView];
    [self.var_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(72);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    self.var_hintLabel = [[UILabel alloc] init];
    self.var_hintLabel.textColor = [UIColor ht_colorWithHexString:@"#222222"];
    self.var_hintLabel.font = [UIFont systemFontOfSize:14];
    self.var_hintLabel.text = LocalString(@"My Family", nil);
    [self.var_imageView addSubview:self.var_hintLabel];
    [self.var_hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    self.var_managerBtn = [[UIButton alloc] init];
    self.var_managerBtn.backgroundColor = [UIColor whiteColor];
    [self.var_managerBtn setTitleColor:[UIColor ht_colorWithHexString:@"#222222"] forState:UIControlStateNormal];
    self.var_managerBtn.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    self.var_managerBtn.layer.cornerRadius = 13;
    self.var_managerBtn.layer.masksToBounds = YES;
    [self.var_imageView addSubview:self.var_managerBtn];
    [self.var_managerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(self.var_hintLabel);
        make.width.mas_equalTo(79);
        make.height.mas_equalTo(26);
    }];
    
    self.var_redView = [[UIView alloc] init];
    self.var_redView.backgroundColor = [UIColor redColor];
    self.var_redView.layer.cornerRadius = 3;
    self.var_redView.layer.masksToBounds = YES;
    [self.var_imageView addSubview:self.var_redView];
    [self.var_redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.var_managerBtn);
        make.size.mas_equalTo(6);
    }];
}

- (void)lgjeropj_refresh {
    
    self.var_redView.hidden = YES;
    self.var_lineView.hidden = YES;
    self.var_hintLabel.hidden = YES;
    self.var_managerBtn.hidden = YES;
    
    if ([[HTAccountModel sharedInstance] ht_isVip]) {
        [self.var_imageView sd_setImageWithURL:kImageNumber(251)];
        HTAccountModel *accountResult = [HTAccountModel sharedInstance];
        if ([accountResult.var_familyPlanState isEqualToString:@"1"]) {
            NSString *planDescStr = @"";
            NSString *var_cancel = @"";
            self.var_redView.hidden = [[NSUserDefaults standardUserDefaults] boolForKey:@"udf_remind_add_family_member_red"];
            self.var_lineView.hidden = NO;
            self.var_hintLabel.hidden = NO;
            self.var_managerBtn.hidden = NO;
            BOOL var_master = [accountResult.var_identity integerValue] == 1;
            [self.var_managerBtn setTitle:var_master ? AsciiString(@"Manage") : AsciiString(@"View") forState:UIControlStateNormal];
            [self.var_managerBtn mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(var_master ? 79 : 59);
            }];
            // 家庭计划
            if ([accountResult.var_pid containsString:AsciiString(@"week")]) {
                planDescStr = LocalString(@"Weekly", nil);
            } else if ([accountResult.var_pid containsString:AsciiString(@"month")]) {
                planDescStr = LocalString(@"Monthly", nil);
            } else if ([accountResult.var_pid containsString:AsciiString(@"year")]) {
                planDescStr = LocalString(@"Annually", nil);
            }
            if (![accountResult.var_renewStatus isEqualToString:@"1"]) {
                if ([accountResult.var_vipEndTime longLongValue] > 0) {
                    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[accountResult.var_vipEndTime longLongValue]];
                    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                    [formatter setDateFormat:AsciiString(@"MMM d, yyyy")];
                    NSString *dateString = [formatter stringFromDate:date];
                    var_cancel = [NSString stringWithFormat:@"%@ %@", LocalString(@"Cancels on", nil), dateString];
                    planDescStr = [NSString stringWithFormat:@"%@\n%@", planDescStr, var_cancel];
                }
            }
            if (var_cancel.length > 0) {
                NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:planDescStr];
                [att addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14 weight:UIFontWeightSemibold] range:NSMakeRange(0, planDescStr.length)];
                [att addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10 weight:UIFontWeightRegular] range:[planDescStr rangeOfString:var_cancel]];
                self.var_planLabel.attributedText = att;
            } else {
                self.var_planLabel.attributedText = [[NSAttributedString alloc] initWithString:planDescStr attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:18]}];
            }
        } else if ([accountResult.var_bindPlanState isEqualToString:@"1"]) {
            // 个人计划
            NSString *planDescStr = @"";
            NSString *var_cancel = @"";
            if ([accountResult.var_bindPid containsString:AsciiString(@"week")]) {
                planDescStr = LocalString(@"Weekly", nil);
            } else if ([accountResult.var_bindPid containsString:AsciiString(@"month")]) {
                planDescStr = LocalString(@"Monthly", nil);
            } else if ([accountResult.var_bindPid containsString:AsciiString(@"year")]) {
                planDescStr = LocalString(@"Annually", nil);
            }
            if (![accountResult.var_bindRenewStatus isEqualToString:@"1"]) {
                if ([accountResult.var_bindEndTime longLongValue] > 0) {
                    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[accountResult.var_bindEndTime longLongValue]];
                    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                    [formatter setDateFormat:AsciiString(@"MMM d, yyyy")];
                    NSString *dateString = [formatter stringFromDate:date];
                    var_cancel = [NSString stringWithFormat:@"%@ %@", LocalString(@"Cancels on", nil), dateString];
                    planDescStr = [NSString stringWithFormat:@"%@\n%@", planDescStr, var_cancel];
                }
            }
            if (var_cancel.length > 0) {
                NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:planDescStr];
                [att addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14 weight:UIFontWeightSemibold] range:NSMakeRange(0, planDescStr.length)];
                [att addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10 weight:UIFontWeightRegular] range:[planDescStr rangeOfString:var_cancel]];
                self.var_planLabel.attributedText = att;
            } else {
                self.var_planLabel.attributedText = [[NSAttributedString alloc] initWithString:planDescStr attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:18]}];
            }
        } else if ([accountResult ht_isDeviceVip]) {
            NSString *planDescStr = @"";
            NSString *var_pid = [[NSUserDefaults standardUserDefaults] objectForKey:@"udf_devicePid"];
            if ([var_pid containsString:AsciiString(@"week")]) {
                planDescStr = LocalString(@"Weekly", nil);
            } else if ([var_pid containsString:AsciiString(@"month")]) {
                planDescStr = LocalString(@"Monthly", nil);
            } else if ([var_pid containsString:AsciiString(@"year")]) {
                planDescStr = LocalString(@"Annually", nil);
            }
            self.var_planLabel.attributedText = [[NSAttributedString alloc] initWithString:planDescStr attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:18]}];
        } else if ([accountResult ht_isLocalVip]) {
            NSString *planDescStr = @"";
            NSString *var_cancel = @"";
            NSString *idStr = [accountResult ht_pidByLocalVip];
            if ([idStr containsString:AsciiString(@"month")]) {
                planDescStr = AsciiString(@"Monthly");
            } else if ([idStr containsString:AsciiString(@"year")]) {
                planDescStr = LocalString(@"Annually", nil);
            } else if ([idStr containsString:AsciiString(@"week")]) {
                planDescStr = LocalString(@"Weekly", nil);
            }
            NSString *var_localData = [[NSUserDefaults standardUserDefaults] objectForKey:STATIC_kIsFinishSubscribe];
            NSDictionary *localDataObj = [var_localData mj_JSONObject];
            NSString *var_renewStatus = kFormat(localDataObj[kSubscribeRenewStatusKey]).ht_isEmptyStr;
            if ([var_renewStatus integerValue] > 0) {
                NSString *var_vipEndTime = kFormat(localDataObj[kSubscribeExpireDateKey]).ht_isEmptyStr;
                NSDate *date = [NSDate dateWithTimeIntervalSince1970:[var_vipEndTime longLongValue]];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:AsciiString(@"MMM d, yyyy")];
                NSString *dateString = [formatter stringFromDate:date];
                var_cancel = [NSString stringWithFormat:@"%@ %@", LocalString(@"Cancels on", nil), dateString];
                planDescStr = [NSString stringWithFormat:@"%@\n%@", planDescStr, var_cancel];
            }
            if (var_cancel.length > 0) {
                NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:planDescStr];
                [att addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14 weight:UIFontWeightSemibold] range:NSMakeRange(0, planDescStr.length)];
                [att addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10 weight:UIFontWeightRegular] range:[planDescStr rangeOfString:var_cancel]];
                self.var_planLabel.attributedText = att;
            } else {
                self.var_planLabel.attributedText = [[NSAttributedString alloc] initWithString:planDescStr attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:18]}];
            }
        }

    } else {
        self.var_planLabel.attributedText = [[NSAttributedString alloc] initWithString:AsciiString(@"Free") attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:18]}];
        [self.var_imageView sd_setImageWithURL:kImageNumber(250)];
    }
}

@end
