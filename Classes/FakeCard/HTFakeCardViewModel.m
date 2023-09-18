//
//  HTFakeCardViewModel.m
//  Axcolly
//
//  Created by 李雪健 on 2023/7/4.
//

#import "HTFakeCardViewModel.h"
#import "HTCommonConfiguration.h"
#import "HTToolKitManager.h"
#import "HTPointEventManager.h"

@implementation HTFakeCardViewModel

- (void)lgjeropj_deepLinkOpenTool {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@"1" forKey:AsciiString(@"type")];
    // 1:个人周 2:个人月 3:个人年 4:家庭周 5:家庭月 6:家庭年
    [params setValue:@"2" forKey:AsciiString(@"product")];
    [params setValue:@"0" forKey:AsciiString(@"activityProduct")];
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
    [[UIApplication sharedApplication] openURL:HTCommonConfiguration.lgjeropj_shared.BLOCK_deepLinkBlock(params) options:@{} completionHandler:^(BOOL success) {}];
}

- (void)lgjeropj_show_maidian {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@1 forKey:AsciiString(@"type")];
    [params setValue:@14 forKey:AsciiString(@"source")];
    [params setValue:@3 forKey:AsciiString(@"pay_method")];
    [params setValue:@1 forKey:AsciiString(@"status")];
    [HTPointEventManager ht_eventWithCode:@"vip_sh" andParams:params];
}

- (void)lgjeropj_click_maidian:(NSInteger)kid {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@1 forKey:AsciiString(@"type")];
    [params setValue:@14 forKey:AsciiString(@"source")];
    [params setValue:@3 forKey:AsciiString(@"pay_method")];
    [params setValue:@1 forKey:AsciiString(@"status")];
    [params setValue:@(kid) forKey:AsciiString(@"kid")];
    [HTPointEventManager ht_eventWithCode:@"vip_cl" andParams:params];
}

- (void)lgjeropj_guide_show_maidian {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@8 forKey:AsciiString(@"source")];
    [HTPointEventManager ht_eventWithCode:@"tspop_sh" andParams:params];
}

- (void)lgjeropj_guide_click_maidian:(NSInteger)kid {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@(kid) forKey:AsciiString(@"kid")];
    [params setValue:@(8) forKey:AsciiString(@"source")];
    [HTPointEventManager ht_eventWithCode:@"tspop_cl" andParams:params];
}

@end
