//
//  UIImageView+cate.m
//  党建
//
//  Created by apple on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "UIImageView+cate.h"

@implementation UIImageView (cate)
+(UIImageView *)imageWithName:(NSString *)name superView:(UIView *)superView{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:name];
    [superView addSubview:imageView];
    return imageView;
}
@end
