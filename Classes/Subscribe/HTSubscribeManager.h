//
//  HTSubscribeManager.h
// 
//
//  Created by Apple on 2022/11/21.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RACSignal.h"
#import <StoreKit/StoreKitDefines.h>
#import <StoreKit/StoreKit.h>


@interface HTSubscribeManager : NSObject

@property (nonatomic, strong) NSArray *productList;
@property (nonatomic, strong) RACSubject *requestProductDownSignal;
@property (nonatomic, strong) RACSubject *subscribeFinishedSignal;
@property (nonatomic, strong) RACSubject *subscribeVerifySignal;
@property (nonatomic, strong) RACSubject *subscribeFailSignal;

+ (HTSubscribeManager *)sharedInstance;

- (void)ht_requestProduct:(NSArray *)productIds;

- (void)ht_byProduct:(SKProduct *)product;

- (void)ht_reStore;

- (void)lgjeropj_iapVerifyWithReceipt:(SKPaymentTransaction *)transaction andflag:(BOOL)bflag;
@end

