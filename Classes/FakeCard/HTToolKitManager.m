//
//  HTToolKitManager.m
//  Ziven
//
//  Created by 李雪健 on 2023/5/29.
//

#import "HTToolKitManager.h"
#import "HTRemindAddFamilyMemberView.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "HTPointEventManager.h"
#import "HTNetworkManager.h"
#import "UIViewController+Navigation.h"

@implementation HTToolKitManager

+ (HTToolKitManager *)shared
{
    static HTToolKitManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HTToolKitManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        @weakify(self);
        [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"NTFCTString_RemindAddFamilyMember" object:nil] subscribeNext:^(NSNotification * _Nullable x) {
            @strongify(self);
            [self ht_remind_add_member];
        }];
    }
    return self;
}

- (void)ht_remind_add_member {
    
    BOOL var_remind = [[NSUserDefaults standardUserDefaults] boolForKey:@"udf_remind_add_member"];
    if (var_remind) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"udf_remind_add_member"];
    HTRemindAddFamilyMemberView *view = [[HTRemindAddFamilyMemberView alloc] init];
    view.block = ^() {
        // 添加家庭成员
        UIViewController *vc = [[NSClassFromString(@"HTFamilyViewController") alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [[UIViewController lgjeropj_currentViewController].navigationController pushViewController:vc animated:YES];
    };
    [view lgjeropj_show];
}

- (void)lgjeropj_save_strip_product:(NSDictionary *)dic
{
    if (dic == nil || dic.count == 0) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:dic forKey:@"udf_strip_product_data"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self lgjeropj_switchMaidian];
}

- (void)lgjeropj_switchMaidian {
    // 埋点
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@(1) forKey:AsciiString(@"type")];
    [params setValue:@([self lgjeropj_strip_k12] == 1 ? 1 : 2) forKey:AsciiString(@"status")];
    [HTPointEventManager ht_eventWithCode:@"tool_switch" andParams:params];
}

- (NSDictionary *)lgjeropj_strip_product
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"udf_strip_product_data"];
}

- (NSDictionary *)lgjeropj_server_products
{
    NSDictionary *dic = [[HTToolKitManager shared] lgjeropj_strip_product];
    return dic[AsciiString(@"data2")];
}

- (NSArray *)lgjeropj_hidden_products
{
    NSDictionary *dic = [[HTToolKitManager shared] lgjeropj_strip_product];
    return dic[AsciiString(@"h1")];
}

- (NSDictionary *)lgjeropj_strip_p1
{
    NSDictionary *dic = [[HTToolKitManager shared] lgjeropj_strip_product];
    return dic[AsciiString(@"p1")];
}

- (NSDictionary *)lgjeropj_strip_p2
{
    NSDictionary *dic = [[HTToolKitManager shared] lgjeropj_strip_product];
    return dic[AsciiString(@"p2")];
}

- (NSArray *)lgjeropj_strip_k3
{
    NSDictionary *dic = [[HTToolKitManager shared] lgjeropj_strip_product];
    return dic[AsciiString(@"k3")];
}

- (NSInteger)lgjeropj_strip_k12
{
    NSDictionary *dic = [[HTToolKitManager shared] lgjeropj_strip_product];
    return ([dic[AsciiString(@"k12")] integerValue] > 0 && [self lgjeropj_airplay].count > 0) ? 1 : 0;
}

- (NSInteger)lgjeropj_strip_k13
{
    NSDictionary *dic = [[HTToolKitManager shared] lgjeropj_strip_product];
    return [dic[AsciiString(@"k13")] integerValue];
}

- (void)lgjeropj_save_airplay:(NSDictionary *)dic
{
    if (dic == nil || dic.count == 0) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:dic forKey:@"udf_airplay"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSDictionary *)lgjeropj_airplay
{
    NSDictionary *data = [HTNetworkManager shareInstance].var_airDict;
    if (data == nil) {
        data = [[NSUserDefaults standardUserDefaults] objectForKey:@"udf_airplay"];
    }
    return data;
}

- (BOOL)lgjeropj_installed
{
    NSDictionary *dic = [[HTToolKitManager shared] lgjeropj_airplay];
    if (dic.count == 0) {
        return NO;
    }
    NSString *var_scheme = [NSString stringWithFormat:@"%@%@", dic[@"scheme"], AsciiString(@"://")];
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:var_scheme]];
}

@end
