//
//  UILabel+Category.m
//  党建
//
//  Created by Mac on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

+ (UILabel *)labelWithContent:(NSString *)content SuperView:(UIView *)superView TextColor:(UIColor *)textColor Font:(UIFont *)font TextAlignment:(NSTextAlignment)textAlignment AdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth{
    UILabel *label = [[UILabel alloc] init];
    label.text = content;
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = textAlignment;
    label.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
    [superView addSubview:label];
    return label;
}

@end
