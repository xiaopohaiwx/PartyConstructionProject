//
//  FirstViewController.m
//  党建
//
//  Created by Mac on 2018/10/24.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
//懒加载
-(AFHTTPSessionManager *)manager
{
    if(!_manager)
    {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://211.67.177.56:8080"]];
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return _manager;
}

//可以放到控制器的View中，自己抽出去
- (void)initTabbarWireView
{
    _imgViewWire = [[UIImageView alloc] init];
    _imgViewWire.backgroundColor = NavigationColor;
    [self.view addSubview:_imgViewWire];
    [_imgViewWire mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(0);
        make.bottom.equalTo(-TabBarHeight);
        make.size.equalTo(CGSizeMake(SCREENWIDTH / 3, 2));
    }];
}
//初始化导航栏
- (void)initNavigationBar
{
    UIImageView *logoView = [[UIImageView alloc] init];
    logoView.image = [UIImage imageNamed:@"logo"];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:logoView];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:_loginBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}
//初始化scrollView
- (void)initScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, NavigationBarHeight, SCREENWIDTH, SCREENHEIGHT - NavigationBarHeight - TabBarHeight)];
    _scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
}
//轮播图
- (void)initBanner
{
    __weak typeof(self) weakSelf = self;
    FirstPageViewModel *viewModel = [[FirstPageViewModel alloc] init];
    [viewModel BannerImageRequst:self.manager CallBackArr:^(NSMutableArray * _Nonnull arr) {
        //接受请求下来的model
        weakSelf.modelArr = arr;
    } CallBackAlert:^(UIAlertController * _Nonnull alert) {
        //如果加载失败，弹出提示框
        [weakSelf presentViewController:alert animated:YES completion:nil];
    }];
    
    BannerView *view1 = [[BannerView alloc] init];
    [view1.imgView setImageWithURL:[NSURL URLWithString:@"http://oowantxlb.bkt.clouddn.com/upload/rear/749b4f2a7cc56b5c0068545718fd24d4.png"] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    view1.labelTitle.text = @"讲形势指方向——图解读习近平这次对省部级干部说了啥";
    
    BannerView *view2 = [[BannerView alloc] init];
    [view2.imgView setImageWithURL:[NSURL URLWithString:@"http://oowantxlb.bkt.clouddn.com/upload/rear/4bbac18c1f8f6c0521b7b6af2ae8ad6c.png"] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    view2.labelTitle.text = @"习近平：“永远做人民公仆、时代先锋、民族脊梁";
    
    BannerView *view3 = [[BannerView alloc] init];
    [view3.imgView setImageWithURL:[NSURL URLWithString:@"http://oowantxlb.bkt.clouddn.com/upload/rear/66e257fe2b5afdbb6acb8ed1127d06c9.png"] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    view3.labelTitle.text = @"校长谭贞在信息工程学院作学习中央31号文件精神专题报告";
    
    BannerView *view4 = [[BannerView alloc] init];
    [view4.imgView setImageWithURL:[NSURL URLWithString:@"http://oowantxlb.bkt.clouddn.com/upload/rear/46296e429c7cda71b941b99fa3461fd1.png"] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    view4.labelTitle.text = @"水調歌頭—慶祝黨的十九大勝利召開";
    
    BannerView *view0 = [[BannerView alloc] init];
    [view0.imgView setImageWithURL:[NSURL URLWithString:@"http://oowantxlb.bkt.clouddn.com/upload/rear/46296e429c7cda71b941b99fa3461fd1.png"] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    view0.labelTitle.text = @"水調歌頭—慶祝黨的十九大勝利召開";
    
    BannerView *view5 = [[BannerView alloc] init];
    [view5.imgView setImageWithURL:[NSURL URLWithString:@"http://oowantxlb.bkt.clouddn.com/upload/rear/749b4f2a7cc56b5c0068545718fd24d4.png"] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    view5.labelTitle.text = @"讲形势指方向——图解读习近平这次对省部级干部说了啥";
    
    PGBanner *banner = [[PGBanner alloc] initViewWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200) ViewList:@[view0, view1, view2, view3, view4, view5] timeInterval:3.0];
    [self.scrollView addSubview:banner];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BGCOLOR;
    [self initTabbarWireView];
    [self initNavigationBar];
    [self initScrollView];
    [self initBanner];
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
