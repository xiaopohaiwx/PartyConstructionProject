//
//  UITextField+Category.h
//  党建
//
//  Created by Mac on 2018/10/30.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Category)
//快速创建textField
+ (UITextField *)textFieldWithSuperView:(UIView *)superView Placehold:(NSString *)placehold PlaceholdColor:(UIColor *)placeholdColor;

@end

NS_ASSUME_NONNULL_END
