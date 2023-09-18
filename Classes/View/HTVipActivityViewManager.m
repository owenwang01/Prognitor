//
//  HTVipActivityViewManager.m
//  GuessNums
//
//  Created by 李雪健 on 2023/6/16.
//

#import "HTVipActivityViewManager.h"
#import "HTPointEventManager.h"

@implementation HTVipActivityViewManager

+ (void)lgjeropj_maidianVipShow {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@(14) forKey:@"source"];
    [params setObject:@"2" forKey:@"type"];
    [HTPointEventManager ht_eventWithCode:@"vip_sh" andParams:params];
}

+ (void)lgjeropj_maidianVipClick:(NSString *)kid {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:kid forKey:@"kid"];
    [params setObject:@"2" forKey:@"type"];
    [params setObject:@(14) forKey:@"source"];
    [HTPointEventManager ht_eventWithCode:@"vip_cl" andParams:params];
}

@end
