//
//  UITextField+Category.m
//  党建
//
//  Created by Mac on 2018/10/30.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "UITextField+Category.h"

@implementation UITextField (Category)

+ (UITextField *)textFieldWithSuperView:(UIView *)superView Placehold:(NSString *)placehold PlaceholdColor:(UIColor *)placeholdColor
{
    UITextField *textField = [[UITextField alloc] init];
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placehold attributes:[NSDictionary dictionaryWithObjectsAndKeys:placeholdColor, NSForegroundColorAttributeName,nil]];
    [superView addSubview:textField];
    return textField;
}

@end
