//
//  UIButton+Category.h
//  党建
//
//  Created by Mac on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Category)
//快速创建button, 传图片
+ (UIButton *)buttonWithName:(NSString *)name SuperView:(UIView *)superView Tag:(NSInteger)tag Target:(id)target Action:(SEL)action;
//快速创建button, 不传图片名
+ (UIButton *)buttonWithSuperView:(UIView *)superView Tag:(NSInteger)tag Target:(id)target Action:(SEL)action;

+ (UIButton *)buttonWithSuperView:(UIView *)superView TitleFont:(float)Titlefont Tag:(NSInteger)tag Target:(id)target Action:(SEL)action;
//快速创建button, 不传图片, 设置字体
+ (UIButton *)buttonWithText:(NSString *)text TextColor:(UIColor *)color TextSize:(NSInteger)size SuperView:(UIView *)superView Tag:(NSInteger)tag Target:(id)target Action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
