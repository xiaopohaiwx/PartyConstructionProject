//
//  FirstViewController.m
//  党建
//
//  Created by Mac on 2018/10/24.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (nonatomic, strong) BannerView *View0;
@property (nonatomic, strong) BannerView *View1;
@property (nonatomic, strong) BannerView *View2;
@property (nonatomic, strong) BannerView *View3;
@property (nonatomic, strong) BannerView *View4;
@property (nonatomic, strong) BannerView *View5;

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
    //FirstPageViewModel回调得到view
    [viewModel CallBackBannerView:_modelArr CallBackView0:^(BannerView * _Nonnull view0) {
        weakSelf.View0 = view0;
    } CallBackView1:^(BannerView * _Nonnull view1) {
        weakSelf.View1 = view1;
    } CallBackView2:^(BannerView * _Nonnull view2) {
        weakSelf.View2 = view2;
    } CallBackView3:^(BannerView * _Nonnull view3) {
        weakSelf.View3 = view3;
    } CallBackView4:^(BannerView * _Nonnull view4) {
        weakSelf.View4 = view4;
    } CallBackView5:^(BannerView * _Nonnull view5) {
        weakSelf.View5 = view5;
    }];
    PGBanner *banner = [[PGBanner alloc] initViewWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200) ViewList:@[_View0, _View1, _View2, _View3, _View4, _View5] timeInterval:3.0];
    banner.delegate = self;
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


#pragma mark -- PGBannerDelegate
- (void)selectAction:(NSInteger)didSelectAtIndex didSelectView:(id)view
{
    NSLog(@"index = %ld  view = %@", didSelectAtIndex, view);
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
