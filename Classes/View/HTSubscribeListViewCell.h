//
//  HTSubscribeListViewCell.h
// 
//
//  Created by Apple on 2022/11/20.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SKProduct;
@interface HTSubscribeListViewCell : UICollectionViewCell

@property (nonatomic, strong) void(^BLOCK_preminumButtonActionBlock)(SKProduct *model);

- (void)ht_updateCellWithData:(SKProduct *)data;

// yes:导量过来的免费月
+ (BOOL)lgjeropj_isFreeMonth:(SKProduct *)model;

@end

NS_ASSUME_NONNULL_END
