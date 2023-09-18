//
//  HTFreeMonthManager.m
//  GuessNums
//
//  Created by 李雪健 on 2023/6/16.
//

#import "HTFreeMonthManager.h"
#import "HTPointEventManager.h"

@implementation HTFreeMonthManager

+ (void)lgjeropj_vipguideShow {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"28" forKey:@"source"];
    [HTPointEventManager ht_eventWithCode:@"vipguide_sh" andParams:params];
}

+ (void)lgjeropj_vipguideClickAndkid:(NSString *)kid {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:kid forKey:@"kid"];
    [params setObject:@"28" forKey:@"source"];
    [HTPointEventManager ht_eventWithCode:@"vipguide_cl" andParams:params];
}

@end
