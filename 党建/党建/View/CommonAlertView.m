//
//  CommonAlertView.m
//  滴滴工程
//
//  Created by 邱敏 on 2018/8/29.
//  Copyright © 2018年 ytq. All rights reserved.
//

#import "CommonAlertView.h"

@implementation CommonAlertView

+ (void)initMessage:(NSString *)m andVC:(UIViewController *)uivc
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:m preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [uivc presentViewController:alert animated:YES completion:nil];
}



@end
