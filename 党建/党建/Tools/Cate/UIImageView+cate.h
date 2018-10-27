//
//  UIImageView+cate.h
//  党建
//
//  Created by apple on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (cate)
//快速创建imageView
+(UIImageView *)imageWithName:(NSString *)name
                    superView:(UIView *)superView;
@end

NS_ASSUME_NONNULL_END
