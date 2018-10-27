//
//  UIImageView+Category.h
//  党建
//
//  Created by Mac on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Category)

//快速创建UIImageView
+ (UIImageView *)imageViewWithName:(NSString *)name SuperView:(UIView *)superView;

@end

NS_ASSUME_NONNULL_END
