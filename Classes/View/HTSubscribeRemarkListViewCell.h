//
//  HTSubscribeRemarkListViewCell.h
// 
//
//  Created by Apple on 2022/11/20.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HTSubscribeRemarkListModel;
@interface HTSubscribeRemarkListViewCell : UIView

- (void)ht_updateCellWithData:(HTSubscribeRemarkListModel *)model;

@end

NS_ASSUME_NONNULL_END
