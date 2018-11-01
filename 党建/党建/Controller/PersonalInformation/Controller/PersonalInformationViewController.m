//
//  PersonalInformationViewController.m
//  党建
//
//  Created by Mac on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "PersonalInformationViewController.h"

@interface PersonalInformationViewController ()

@end

@implementation PersonalInformationViewController
//初始化导航栏
- (void)initNav
{
    self.navigationItem.title = @"个人信息";
    _navBtn = [UIButton buttonWithText:@"编辑" SelectText:@"保存" TextColor:[UIColor whiteColor] Target:self Action:@selector(editor:)];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:_navBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}
//初始化PersonalInformationView
- (void)initPersonalInformationView
{
    _personalInformationView = [[PersonalInformationView alloc] init];
    [self.view addSubview:_personalInformationView];
    [_personalInformationView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(0);
        make.height.equalTo(SCREENHEIGHT - NavigationBarHeight - TabBarHeight);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BGCOLOR;
    [self initNav];
    [self initPersonalInformationView];
}


//导航栏button点击事件
- (void)editor:(UIButton *)btn
{
    if(btn.selected)
    {
        btn.selected = NO;
        NSLog(@"---------");
    }
    else
    {
        btn.selected = YES;
        NSLog(@"=========");
    }
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
