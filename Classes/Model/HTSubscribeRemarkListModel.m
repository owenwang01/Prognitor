//
//  HTSubscribeRemarkListModel.m
// 
//
//  Created by Apple on 2022/11/20.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTSubscribeRemarkListModel.h"
#import "NSString+Extension.h"

@implementation HTSubscribeRemarkListModel

+ (HTSubscribeRemarkListModel *)modelWithTitle:(NSString *)title andDescribe:(NSString *)describe{
    HTSubscribeRemarkListModel *model = [[HTSubscribeRemarkListModel alloc] init];
    model.title = title;
    model.describe = describe;
    return model;
}

- (CGFloat)var_textHeight{
    CGFloat result = 0.0f;
    if(![NSString ht_isEmpty:self.title]){
        result = [self.title ht_getHeightWithFontSize:12 width:SCREEN_WIDTH-16*3-6];
    }
    if(result < 20){
        //单行
        return MAX(result, 30.0f);
    }else{
        //多行
        return MAX(result, 40.0f);
    }
}

@end
