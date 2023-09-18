//
//  HTPremiumNewCardItem.h
//  Axcolly
//
//  Created by 李雪健 on 2023/6/25.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTPremiumNewCardItem : UICollectionViewCell

- (void)lgjeropj_updateCellWithData:(NSDictionary *)data selected:(BOOL)selected;

+ (BOOL)lgjeropj_isFreeMonth:(SKProduct *)model;

@end

NS_ASSUME_NONNULL_END
