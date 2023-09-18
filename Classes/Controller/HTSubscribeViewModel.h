//
//  HTSubscribeViewModel.h
//  Axcolly
//
//  Created by 李雪健 on 2023/7/4.
//

#import <Foundation/Foundation.h>
#import "HTFakeCardGuideView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTSubscribeViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *productArray;
@property (nonatomic, strong) NSMutableArray *familyArray;

- (void)lgjeropj_requestData:(BLOCK_VoidBlock)completion;

@end

NS_ASSUME_NONNULL_END
