//
//  ChangeInformationViewController.m
//  党建
//
//  Created by Mac on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "ChangeInformationViewController.h"

@interface ChangeInformationViewController ()

@end

@implementation ChangeInformationViewController
//初始化导航栏
- (void)initNav
{
    self.navigationItem.title = @"修改个人信息";
    _navBtn = [UIButton buttonWithText:@"保存" TextColor:[UIColor whiteColor] Target:self Action:@selector(editor:)];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:_navBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}
//初始化ScrollView
- (void)initScrollView
{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    [_scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(0);
        make.height.equalTo(SCREENHEIGHT - NavigationBarHeight - TabBarHeight);
    }];
}
//初始化ChangeInformationView
- (void)initChangeInformationView
{
    _changeInformationView = [[ChangeInformationView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 0) ContentArr:self.modelMutArr];
    [_scrollView addSubview:_changeInformationView];
    [_changeInformationView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.scrollView.top).offset(0);
        make.height.equalTo(770);
    }];
    
    [self.view layoutIfNeeded];
    _scrollView.contentSize = CGSizeMake(SCREENWIDTH, _changeInformationView.frame.origin.y + _changeInformationView.frame.size.height + 10);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BGCOLOR;
    [self initNav];
    [self initScrollView];
    [self initChangeInformationView];
}

//导航栏按钮点击事件
- (void)editor:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
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
