//
//  CommonJudge.h
//  滴滴工程
//
//  Created by 邱敏 on 2018/8/29.
//  Copyright © 2018年 ytq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonJudge : UIView
//判断是否登录
+(void)initJudgeVC:(UIViewController *)vc;

//判断是否有网
+(BOOL)isConnectionAvailable;

+ (void)showMBProgressHUD:(NSString *)showMessage andWhereView:(UIView *)view;
+ (void)hideMBprogressHUD:(UIView *)view;

//判断字符串是否为数字
+ (BOOL) deptNumInputShouldNumber:(NSString *)str;

@end
