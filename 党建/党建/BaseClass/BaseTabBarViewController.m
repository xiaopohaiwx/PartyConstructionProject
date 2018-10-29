//
//  BaseTabBarViewController.m
//  党建
//
//  Created by Mac on 2018/10/24.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "BaseTabBarViewController.h"

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setBarTintColor:ssRGBHex(0xFFFFFF)];
    
    [self setAllChirdViewController];
}

- (void)setAllChirdViewController
{
    BaseNavigationViewController *firstPage = [[BaseNavigationViewController alloc] initWithRootViewController:[[FirstViewController alloc] init]];
    [self setBaseNav:firstPage Title:@"首页" ImageName:@"firstPage" ImageNameSelect:@"firstPageSelect"];
    
    NoticeViewController *tice = [[NoticeViewController alloc] init];
    tice.type = @"2";
    BaseNavigationViewController *notice = [[BaseNavigationViewController alloc] initWithRootViewController:tice];
    [self setBaseNav:notice Title:@"通知早知道" ImageName:@"notice" ImageNameSelect:@"noticeSelect"];
    
    BaseNavigationViewController *mine = [[BaseNavigationViewController alloc] initWithRootViewController:[[MineViewController alloc] init]];
    [self setBaseNav:mine Title:@"我的党建" ImageName:@"mine" ImageNameSelect:@"mineSelect"];
}

- (void)setBaseNav:(BaseNavigationViewController *)nav Title:(NSString *)title ImageName:(NSString *)imageName ImageNameSelect:(NSString *)imageNameSelect
{
    nav.tabBarItem.title = title;
    [nav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:ssRGBHex(0x999999), NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [nav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:ssRGBHex(0xF6443F), NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    nav.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:imageNameSelect] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:nav];
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
