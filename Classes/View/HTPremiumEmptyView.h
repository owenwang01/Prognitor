//
//  HTPremiumEmptyView.h
//  WillDrawApp
//
//  Created by admin on 2023/1/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^BLOCK_HTVoidBlock)(void);

@interface HTPremiumEmptyView : UIView

@property (nonatomic, copy) BLOCK_HTVoidBlock emptyBlock;
@property (nonatomic, strong) UIView *remindView;

@end

NS_ASSUME_NONNULL_END
