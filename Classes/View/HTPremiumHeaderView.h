//
//  HTPremiumHeaderView.h
//  Axcolly
//
//  Created by 李雪健 on 2023/6/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTPremiumHeaderView : UIView

@property (nonatomic, strong) UILabel *var_planLabel;
@property (nonatomic, strong) UIImageView *var_imageView;
@property (nonatomic, strong) UIView *var_lineView;
@property (nonatomic, strong) UILabel *var_hintLabel;
@property (nonatomic, strong) UIButton *var_managerBtn;
@property (nonatomic, strong) UIView *var_redView;

- (void)lgjeropj_refresh;

@end

NS_ASSUME_NONNULL_END
