//
//  NoticeViewController.m
//  党建
//
//  Created by Mac on 2018/10/24.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "NoticeViewController.h"
#import "BaseTableViewController.h"

@interface NoticeViewController ()

@end

@implementation NoticeViewController

//可以放到控制器的View中，自己抽出去
- (void)initTabbarWireView
{
    _imgViewWire = [[UIImageView alloc] init];
    _imgViewWire.backgroundColor = NavigationColor;
    [self.view addSubview:_imgViewWire];
    [_imgViewWire mas_makeConstraints:^(MASConstraintMaker *make) {
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

//测试按钮
-(void)getCustom
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(200);
        make.left.equalTo(100);
        make.width.equalTo(50);
        make.height.equalTo(50);
    }];
}
-(void)pressBtn:(UIButton *)btn
{
    [self.navigationController pushViewController:[[BaseTableViewController alloc] init] animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BGCOLOR;
    [self initTabbarWireView];
    [self initNavigationBar];
    [self getCustom];//测试用
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
