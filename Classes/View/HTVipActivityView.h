//
//  HTVipActivityView.h

//
//  Created by admin on 2022/1/26.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>


NS_ASSUME_NONNULL_BEGIN

typedef void(^BLOCK_ActivityBlock) (SKProduct * _Nullable product);

@interface HTVipActivityView : UIView
@property (nonatomic, strong) SKProduct *tempProduct;
@property (nonatomic, strong) NSString *selPidStr;
@property (nonatomic, strong) NSString *selPtypeStr;

@property (nonatomic, copy) BLOCK_ActivityBlock block;
@property (nonatomic, strong) UIButton *iconImage;
@property (nonatomic, assign) NSInteger source;
@end

NS_ASSUME_NONNULL_END
