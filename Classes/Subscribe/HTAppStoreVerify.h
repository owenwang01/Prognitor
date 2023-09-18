//
//  HTAppStoreVerify.h
//  GuessNums
//
//  Created by 张强 on 2023/6/16.
//

#import <Foundation/Foundation.h>
#import "RACSignal.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTAppStoreVerify : NSObject

@property (nonatomic, strong) RACSubject *subscribeVerifySignal;
@property (nonatomic, strong) RACSubject *subscribeFinishedSignal;
@property (nonatomic, strong) RACSubject *subscribeFailSignal;

+ (HTAppStoreVerify *)sharedInstance;
- (void)ht_verifyTransactionWithIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
