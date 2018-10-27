//
//  UIImageView+Category.m
//  党建
//
//  Created by Mac on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "UIImageView+Category.h"

@implementation UIImageView (Category)

+ (UIImageView *)imageViewWithName:(NSString *)name SuperView:(UIView *)superView{
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:name];
    [superView addSubview:imgView];
    return imgView;
}

@end
