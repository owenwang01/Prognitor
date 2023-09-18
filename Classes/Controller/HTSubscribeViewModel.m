//
//  HTSubscribeViewModel.m
//  Axcolly
//
//  Created by 李雪健 on 2023/7/4.
//

#import "HTSubscribeViewModel.h"
#import <StoreKit/StoreKit.h>
#import "HTSubscribeManager.h"
#import "HTSubscribeUtils.h"
#import "RACSignal.h"
#import "RACSubject.h"
#import "HTAccountModel.h"
#import "HTToolKitManager.h"

@interface HTSubscribeViewModel ()

@property (nonatomic, copy) BLOCK_VoidBlock completion;

@end

@implementation HTSubscribeViewModel

- (void)lgjeropj_requestData:(BLOCK_VoidBlock)completion {
    
    self.completion = completion;
    NSArray *dataArray = [HTSubscribeManager sharedInstance].productList;
    if (!dataArray || dataArray.count == 0) {
        [HTSubscribeUtils ht_requetProduct];
        __weak typeof(self) weakSelf = self;
        [[HTSubscribeManager sharedInstance].requestProductDownSignal subscribeNext:^(id  _Nullable x) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf ht_requestProductSuccess:x];
            });
        }];
    } else {
        self.productArray = [dataArray filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(SKProduct * _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
            NSString *var_id = evaluatedObject.productIdentifier;
            return ![var_id containsString:AsciiString(@"family")];
        }]].mutableCopy;
        self.familyArray = [dataArray filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(SKProduct * _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
            NSString *var_id = evaluatedObject.productIdentifier;
            return [var_id containsString:AsciiString(@"family")];
        }]].mutableCopy;
        // 假卡片数据
        [self ht_setupFakeCardData];
    }
}

- (void)ht_requestProductSuccess:(NSArray *)array {
    
    NSMutableArray *dataArray = [NSMutableArray arrayWithArray:array];
    self.productArray = [dataArray filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(SKProduct * _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        NSString *var_id = evaluatedObject.productIdentifier;
        return ![var_id containsString:AsciiString(@"family")];
    }]].mutableCopy;
    self.familyArray = [dataArray filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(SKProduct * _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        NSString *var_id = evaluatedObject.productIdentifier;
        return [var_id containsString:AsciiString(@"family")];
    }]].mutableCopy;
    // 假卡片数据
    [self ht_setupFakeCardData];
}

- (void)ht_setupFakeCardData {

    BOOL var_isLocalVip = [[HTAccountModel sharedInstance] ht_isLocalVip];
    BOOL var_isToolVip = [HTAccountModel sharedInstance].var_toolVip;
    // 非本地订阅用户 或 是工具包订阅用户
    if (!var_isLocalVip || var_isToolVip) {
        if ([[HTToolKitManager shared] lgjeropj_strip_k12] > 0) {
            // 假卡片数据
            NSDictionary *var_server = [[HTToolKitManager shared] lgjeropj_server_products];
            if (var_server.count > 0) {
                // 家庭计划
                NSMutableDictionary *var_fm = [NSMutableDictionary dictionaryWithDictionary:[var_server objectForKey:AsciiString(@"fm")]];
                [var_fm setValue:AsciiString(@"fm") forKey:AsciiString(@"product")];
                // 假月 真月 真年 真周
                [self.familyArray insertObject:[self ht_translateModel:var_fm] atIndex:0];
                NSMutableDictionary *var_fy = [NSMutableDictionary dictionaryWithDictionary:[var_server objectForKey:AsciiString(@"fy")]];
                [var_fy setValue:AsciiString(@"fy") forKey:AsciiString(@"product")];
                // 假月 真月 假年 真年 真周
                [self.familyArray insertObject:[self ht_translateModel:var_fy] atIndex:2];
                NSMutableDictionary *var_fw = [NSMutableDictionary dictionaryWithDictionary:[var_server objectForKey:AsciiString(@"fw")]];
                [var_fw setValue:AsciiString(@"fw") forKey:AsciiString(@"product")];
                // 假月 真月 假年 真年 假周 真周
                [self.familyArray insertObject:[self ht_translateModel:var_fw] atIndex:4];
                // 个人计划
                NSMutableDictionary *var_month = [NSMutableDictionary dictionaryWithDictionary:[var_server objectForKey:AsciiString(@"month")]];
                [var_month setValue:AsciiString(@"month") forKey:AsciiString(@"product")];
                // 假月 真月 真年 真周
                [self.productArray insertObject:[self ht_translateModel:var_month] atIndex:0];
                NSMutableDictionary *var_year = [NSMutableDictionary dictionaryWithDictionary:[var_server objectForKey:AsciiString(@"year")]];
                [var_year setValue:AsciiString(@"year") forKey:AsciiString(@"product")];
                // 假月 真月 假年 真年 真周
                [self.productArray insertObject:[self ht_translateModel:var_year] atIndex:2];
                NSMutableDictionary *var_week = [NSMutableDictionary dictionaryWithDictionary:[var_server objectForKey:AsciiString(@"week")]];
                [var_week setValue:AsciiString(@"week") forKey:AsciiString(@"product")];
                // 假月 真月 假年 真年 假周 真周
                [self.productArray insertObject:[self ht_translateModel:var_week] atIndex:4];
            }
            NSArray *var_hidden = [[HTToolKitManager shared] lgjeropj_hidden_products];
            if (var_hidden.count > 0) {
                // 移除真实商品
                NSArray *array = [self.productArray filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
                    return [evaluatedObject isKindOfClass:[SKProduct class]];
                }]];
                for (NSInteger i = self.productArray.count-1; i >= 0; i--) {
                    SKProduct *product = self.productArray[i];
                    if ([array containsObject:product]) {
                        [self.productArray removeObject:product];
                    }
                }
                array = [self.familyArray filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSDictionary *evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
                    return [evaluatedObject isKindOfClass:[SKProduct class]];
                }]];
                for (NSInteger i = self.familyArray.count-1; i >= 0; i--) {
                    SKProduct *product = self.familyArray[i];
                    if ([array containsObject:product]) {
                        [self.familyArray removeObject:product];
                    }
                }
            }
            NSString *var_activity_product = @"";
            NSArray *var_k3 = [[HTToolKitManager shared] lgjeropj_strip_k3];
            if (var_k3.count > 0) {
                NSInteger var_activity = [[var_k3 firstObject] integerValue];
                if (var_activity == 1) {
                    // 有活动
                    if (var_k3.count > 2) {
                        var_activity_product = [NSString stringWithFormat:@"%@", [var_k3 objectAtIndex:2]];
                    }
                }
            }
            if (var_activity_product.length > 0) {
                if ([var_activity_product containsString:AsciiString(@"year")]) {
                    var_activity_product = AsciiString(@"year");
                } else if ([var_activity_product containsString:AsciiString(@"month")]) {
                    var_activity_product = AsciiString(@"month");
                }
                NSDictionary *var_trial_product = [var_server objectForKey:AsciiString(@"trial")];
                NSInteger index = -1;
                for (int i = 0; i < self.productArray.count; i++) {
                    NSDictionary *dic = [self.productArray objectAtIndex:i];
                    if ([dic isKindOfClass:[NSDictionary class]]) {
                        if ([[dic objectForKey:AsciiString(@"id")] isEqualToString:var_activity_product]) {
                            index = i;
                            break;
                        }
                    }
                }
                if (index >= 0) {
                    NSDictionary *replace = self.productArray[index];
                    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:var_trial_product];
                    dic[AsciiString(@"activity")] = @"1";
                    [dic setValue:replace[AsciiString(@"product")] forKey:AsciiString(@"product")];
                    [self.productArray removeObjectAtIndex:index];
                    [self.productArray insertObject:[self ht_translateModel:dic] atIndex:0];
                }
            }
        }
    }
    // 回调
    if (self.completion) {
        self.completion();
    }
}

// 假卡片数据拼接
- (NSDictionary *)ht_translateModel:(NSDictionary *)dic {
    
    NSMutableDictionary *var_fake = [NSMutableDictionary dictionaryWithDictionary:dic];
    NSString *var_id = [dic objectForKey:AsciiString(@"product")];
    // id price discount first
    [var_fake setValue:var_id forKey:AsciiString(@"id")];
    NSString *var_h2 = [NSString stringWithFormat:@"%@", [dic objectForKey:AsciiString(@"h2")]];
    [var_fake setValue:var_h2 forKey:AsciiString(@"price")];
    return var_fake;
}

@end
