//
//  NoticeViewController.m
//  党建
//
//  Created by Mac on 2018/10/24.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "NoticeViewController.h"

@interface NoticeViewController ()

@end

@implementation NoticeViewController
//导航线
- (void)initTabbarWireView
{
    UIImageView *imgView = [UIImageView imageViewWithSuperView:self.view BGColor:NavigationColor];
    [imgView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(SCREENWIDTH / 3);
        make.bottom.equalTo(-TabBarHeight);
        make.size.equalTo(CGSizeMake(SCREENWIDTH / 3, 2));
    }];
}

//初始化导航栏
- (void)initNavigationBar
{
    self.navigationItem.title = @"通知早知道";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BGCOLOR;
    [self initTabbarWireView];
    [self initNavigationBar];
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
