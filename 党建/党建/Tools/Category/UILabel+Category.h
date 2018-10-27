//
//  UILabel+Category.h
//  党建
//
//  Created by Mac on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Category)

//快速创建UILabel
+ (UILabel *)labelWithContent:(NSString *)content SuperView:(UIView *)superView TextColor:(UIColor *)textColor Font:(UIFont *)font TextAlignment:(NSTextAlignment)textAlignment AdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth;

@end

NS_ASSUME_NONNULL_END
