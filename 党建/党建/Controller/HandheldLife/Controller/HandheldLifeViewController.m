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
//初始化HandheldLifeView
- (void)initHandheldLifeView
{
    _handheldLifeView = [[HandheldLifeView alloc] init];
    _handheldLifeView.delegate = self;
    [self.view addSubview:_handheldLifeView];
    [_handheldLifeView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        make.top.equalTo(NavigationBarHeight);
        make.size.equalTo(SCREENHEIGHT);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BGCOLOR;
    [self initNav];
    [self initHandheldLifeView];
}

#pragma mark -- HandheldLifeViewDelegate
- (void)itemDidSelect:(NSInteger)tag
{
    switch (tag) {
        case 1:
        {
            NSLog(@"政治学习");
        }
            break;
        case 2:
        {
            NSLog(@"思想汇报");
        }
            break;
        case 3:
        {
            NSLog(@"心得总结");
        }
            break;
        case 4:
        {
            NSLog(@"民主评议");
        }
            break;
        case 5:
        {
            NSLog(@"流动党员找组织");
        }
            break;
            
        default:
            break;
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
