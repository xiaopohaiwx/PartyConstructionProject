//
//  HandheldLifeViewController.m
//  党建
//
//  Created by Mac on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "HandheldLifeViewController.h"

@interface HandheldLifeViewController ()

@end

@implementation HandheldLifeViewController
//初始化导航栏
- (void)initNav
{
    self.navigationItem.title = _titleStr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BGCOLOR;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
