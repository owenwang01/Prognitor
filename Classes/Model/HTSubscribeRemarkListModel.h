//
//  HTSubscribeRemarkListModel.h
// 
//
//  Created by Apple on 2022/11/20.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "FLBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTSubscribeRemarkListModel : FLBaseModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *describe;
@property (nonatomic, assign) BOOL var_highUnderline;
@property (nonatomic, assign) BOOL var_canTap;
@property (nonatomic, assign, readonly) CGFloat var_textHeight;

+ (HTSubscribeRemarkListModel *)modelWithTitle:(NSString *)title andDescribe:(NSString *)describe;

@end

NS_ASSUME_NONNULL_END
