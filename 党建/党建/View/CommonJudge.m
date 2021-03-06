//
//  CommonJudge.m
//  滴滴工程
//
//  Created by 邱敏 on 2018/8/29.
//  Copyright © 2018年 ytq. All rights reserved.
//

#import "CommonJudge.h"
#import "MBProgressHUD.h"
#import "Reachability.h"

@implementation CommonJudge
//判断是否有网络连接
+(BOOL)isConnectionAvailable
{
    BOOL isExistenceNetwork = YES;
    
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            break;
    }
    
    return isExistenceNetwork;
}
//显示加载视图
+ (void)showMBProgressHUD:(NSString *)showMessage andWhereView:(UIView *)view
{
    MBProgressHUD *loadingView = [MBProgressHUD showHUDAddedTo:view animated:YES];
    loadingView.label.text = showMessage;
}
//去掉加载视图
+ (void)hideMBprogressHUD:(UIView *)view
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

//判断字符串是否为数字
+ (BOOL) deptNumInputShouldNumber:(NSString *)str
{
    if (str.length == 0) {
        return NO;
    }
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}



//-(void)initJudge
//{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *str = [defaults objectForKey:@"judge"];
//
//    if ([str isEqualToString:@"NO"])
//    {
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"未登录账号" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"稍后" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            //返回首页
//            self.tabBarController.selectedIndex = 0;
//        }];
//        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            [self.navigationController.navigationController popViewControllerAnimated:YES];
//        }];
//        [alert addAction:action1];
//        [alert addAction:action2];
//        [self presentViewController:alert animated:YES completion:nil];
//    }
//}

@end
