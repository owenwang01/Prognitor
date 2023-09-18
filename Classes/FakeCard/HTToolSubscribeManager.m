//
//  HTToolSubscribeManager.m
//  Axcolly
//
//  Created by 李雪健 on 2023/7/4.
//

#import "HTToolSubscribeManager.h"
#import "HTNetworkApi.h"
#import "HTStringUtils.h"
#import "HTToolKitManager.h"
#import "HTCommonConfiguration.h"

@implementation HTToolSubscribeManager

+ (void)lgjeropj_subscribeAction:(NSDictionary *)dic {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@"1" forKey:AsciiString(@"type")];
    NSString *var_product = dic[AsciiString(@"product")];
    if ([var_product isEqualToString:AsciiString(@"week")]) {
        var_product = @"1";
    } else if ([var_product isEqualToString:AsciiString(@"month")]) {
        var_product = @"2";
    } else if ([var_product isEqualToString:AsciiString(@"year")]) {
        var_product = @"3";
    } else if ([var_product isEqualToString:AsciiString(@"fw")]) {
        var_product = @"4";
    } else if ([var_product isEqualToString:AsciiString(@"fm")]) {
        var_product = @"5";
    } else if ([var_product isEqualToString:AsciiString(@"fy")]) {
        var_product = @"6";
    }
    // 1:个人周 2:个人月 3:个人年 4:家庭周 5:家庭月 6:家庭年
    [params setValue:var_product forKey:AsciiString(@"product")];
    NSInteger var_activity = [dic[AsciiString(@"activity")] integerValue];
    [params setValue:var_activity > 0 ? var_product : @"0" forKey:AsciiString(@"activityProduct")];
    // var_shopLink var_targetBundle var_targetLink
    
    NSDictionary *data = [[HTToolKitManager shared] lgjeropj_airplay];
    NSString *var_appleId = data[@"appleid"];
    NSString *var_shopLink = [NSString stringWithFormat:@"%@%@", AsciiString(@"https://apps.apple.com/app/id"), var_appleId];
    [params setValue:var_shopLink forKey:@"var_shopLink"];
    [params setValue:[data objectForKey:@"bundleid"] forKey:@"var_targetBundle"];
    [params setValue:[data objectForKey:AsciiString(@"l1")] forKey:@"var_targetLink"];
    [params setValue:[data objectForKey:AsciiString(@"k2")] forKey:@"var_dynamicK2"];
    [params setValue:[data objectForKey:AsciiString(@"c4")] forKey:@"var_dynamicC4"];
    [params setValue:[data objectForKey:AsciiString(@"c5")] forKey:@"var_dynamicC5"];
    [params setValue:[data objectForKey:AsciiString(@"logo")] forKey:@"var_dynamicLogo"];
    [[UIApplication sharedApplication] openURL:[HTCommonConfiguration lgjeropj_shared].BLOCK_deepLinkBlock(params) options:@{} completionHandler:^(BOOL success) {}];
}

@end
