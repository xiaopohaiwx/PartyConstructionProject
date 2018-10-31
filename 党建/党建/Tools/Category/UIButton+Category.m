//
//  UIButton+Category.m
//  党建
//
//  Created by Mac on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "UIButton+Category.h"

@implementation UIButton (Category)

+ (UIButton *)buttonWithName:(NSString *)name SuperView:(UIView *)superView Tag:(NSInteger)tag Target:(id)target Action:(SEL)action{
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    button.tag = tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:button];
    return button;
}

+ (UIButton *)buttonWithSuperView:(UIView *)superView Tag:(NSInteger)tag Target:(id)target Action:(SEL)action{
    UIButton *button = [[UIButton alloc] init];
    button.tag = tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:button];
    return button;
}

+ (UIButton *)buttonWithText:(NSString *)title TextColor:(UIColor *)color TextSize:(NSInteger)size SuperView:(UIView *)superView Tag:(NSInteger)tag Target:(id)target Action:(SEL)action{
    UIButton *button = [[UIButton alloc] init];
    button.tag = tag;
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:size];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:button];
    return button;
}
@end
