//
//  MineViewController.m
//  党建
//
//  Created by Mac on 2018/10/24.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

//导航线
- (void)initTabbarWireView
{
    UIImageView *imgView = [UIImageView imageViewWithSuperView:self.view BGColor:NavigationColor];
    [imgView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(0);
        make.bottom.equalTo(-TabBarHeight);
        make.size.equalTo(CGSizeMake(SCREENWIDTH / 3, 2));
    }];
}
//初始化导航栏
- (void)initNavigationBar
{
    self.navigationItem.title = @"我的党建";
    //去除导航栏颜色差异
    self.navigationController.navigationBar.translucent = NO;
    //去除导航栏分割线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}
//初始化MineView
- (void)initMineView
{
    _mineView = [[MineView alloc] init];
    _mineView.delegate = self;
    [self.view addSubview:_mineView];
    [_mineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        make.top.equalTo(0);
        make.height.equalTo(SCREENHEIGHT - NavigationBarHeight - TabBarHeight);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BGCOLOR;
    [self initTabbarWireView];
    [self initNavigationBar];
    [self initMineView];
}

#pragma mark -- MineViewDelegate
- (void)DidSelectItem:(NSInteger)tag
{
    switch (tag) {
        case 0:
        {
            [self jumpLoginView];
        }
            break;
        case 1:
        {
            if([USERDEFAULT(@"token")])
            {
                
            }
            else
            {
                [self jumpLoginView];
            }
        }
            break;
        case 2:
        {
            if([USERDEFAULT(@"token")])
            {
                
            }
            else
            {
                [self jumpLoginView];
            }
        }
            break;
        case 3:
        {
            if([USERDEFAULT(@"token")])
            {
                
            }
            else
            {
                [self jumpLoginView];
            }
        }
            break;
        case 4:
        {
            if([USERDEFAULT(@"token")])
            {
                
            }
            else
            {
                [self jumpLoginView];
            }
        }
            break;
            
        default:
            break;
    }
}

- (void)jumpLoginView
{
    LoginViewController *LoginView = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:LoginView animated:YES];
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
