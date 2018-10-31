//
//  LoginViewController.m
//  党建
//
//  Created by Mac on 2018/10/29.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
//初始化导航栏
- (void)initNav
{
    self.navigationItem.title = @"登录";
}
//初始化LoginView
- (void)initLoginView
{
    _loginView = [[LoginView alloc] init];
    _loginView.delegate = self;
    [self.view addSubview:_loginView];
    [_loginView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        make.top.equalTo(0);
        make.height.equalTo(SCREENHEIGHT - NavigationBarHeight - TabBarHeight);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = NavigationColor;
    [self initNav];
    [self initLoginView];
}

#pragma mark -- LoginVeiwDelegate
- (void)DidSelectLoginBtn
{
    NSLog(@"点击登录按钮了");
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
