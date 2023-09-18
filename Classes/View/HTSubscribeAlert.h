//
//  HTSubscribeAlert.h
// 
//
//  Created by Apple on 2023/3/1.
//  Copyright © 2023 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class HTSubscribeAlert;
@interface HTSubscribeAlert : UIView


@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, copy) NSString *cancelTitle;

@property (nonatomic, copy) NSString *confirmTitle;

@property (nonatomic, copy) void (^BLOCK_cancelClickBlock)(HTSubscribeAlert *alert);

@property (nonatomic, copy) void (^BLOCK_confirmClickBlock)(HTSubscribeAlert *alert);

+ (instancetype)shareInstance;

- (void)ht_show;

- (void)ht_dismiss;

@end

NS_ASSUME_NONNULL_END

