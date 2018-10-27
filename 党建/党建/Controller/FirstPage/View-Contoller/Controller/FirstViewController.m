//
//  FirstViewController.m
//  党建
//
//  Created by Mac on 2018/10/24.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "FirstViewController.h"
#import "BaseTableViewController.h"
#import "PictureViewController.h"

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

//导航线
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
//初始化FirstPageView
- (void)initFirstPageView
{
    _firstPageView = [[FirstPageView alloc] init];
    _firstPageView.delegate = self;
    [_scrollView addSubview:_firstPageView];
    [_firstPageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.banner.bottom).offset(0);
        make.height.equalTo(462);
    }];
    
    [self.view layoutIfNeeded];
    _scrollView.contentSize = CGSizeMake(SCREENWIDTH, _firstPageView.frame.origin.y + _firstPageView.frame.size.height);
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
    _banner = [[PGBanner alloc] initViewWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200) ViewList:@[_View0, _View1, _View2, _View3, _View4, _View5] timeInterval:3.0];
    _banner.delegate = self;
    [self.scrollView addSubview:_banner];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BGCOLOR;
    [self initNavigationBar];
    [self initScrollView];
    [self initBanner];
    [self initFirstPageView];
    [self initTabbarWireView];
}

#pragma mark -- FirstPageViewDelegate
- (void)itemDidSelect:(NSInteger)tag
{
    switch (tag) {
        case 1:
        {
            NSLog(@"信工新闻眼");
            //初始化新闻页面
            BaseTableViewController *base = [[BaseTableViewController alloc] init];
            base.titleString = @"信工新闻眼";
            base.type = @"0";
            [self.navigationController pushViewController:base animated:YES];
        }
            break;
        case 2:
        {
            NSLog(@"掌上组织生活");
            //掌上组织生活页面
            HandheldLifeViewController *HLView = [[HandheldLifeViewController alloc] init];
            HLView.titleStr = @"掌上组织生活";
            [self.navigationController pushViewController:HLView animated:YES];
        }
            break;
        case 3:
        {
            NSLog(@"党员云互动");
        }
            break;
        case 4:
        {
            NSLog(@"党建一点通");
            //初始化新闻页面
            BaseTableViewController *base = [[BaseTableViewController alloc] init];
            base.titleString = @"党建一点通";
            base.type = @"3";
            [self.navigationController pushViewController:base animated:YES];
        }
            break;
        case 5:
        {
            NSLog(@"党员亮身份");
            //初始化新闻页面
            BaseTableViewController *base = [[BaseTableViewController alloc] init];
            base.titleString = @"党员亮身份";
            base.type = @"5";
            [self.navigationController pushViewController:base animated:YES];
        }
            break;
        case 6:
        {
            NSLog(@"党史上的今天");
        }
            break;
        case 7:
        {
            NSLog(@"随时随地学");
            //初始化新闻页面
            BaseTableViewController *base = [[BaseTableViewController alloc] init];
            base.titleString = @"随时随地学";
            base.type = @"6";
            [self.navigationController pushViewController:base animated:YES];
        }
            break;
        case 8:
        {
            NSLog(@"随时随地拍");
        }
            break;
        case 9:
        {
            NSLog(@"制度建设");
            //初始化新闻页面
            BaseTableViewController *base = [[BaseTableViewController alloc] init];
            base.titleString = @"制度建设";
            base.type = @"4";
            [self.navigationController pushViewController:base animated:YES];
        }
            break;
        case 10:
        {
            NSLog(@"特色活动");
            //初始化新闻页面
            BaseTableViewController *base = [[BaseTableViewController alloc] init];
            base.titleString = @"特色活动";
            base.type = @"1";
            [self.navigationController pushViewController:base animated:YES];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark -- PGBannerDelegate
- (void)selectAction:(NSInteger)didSelectAtIndex didSelectView:(id)view
{
    NSLog(@"index = %ld  view = %@", didSelectAtIndex, view);
    NSLog(@"url = %@", [_modelArr[didSelectAtIndex] valueForKey:@"url"]);
    BaseNewsDetailsViewController *BNDView = [[BaseNewsDetailsViewController alloc] init];
    switch (didSelectAtIndex) {
        case 1:
        {
            BNDView.topString = @"随时随地学";
        }
            break;
        case 2:
        {
            BNDView.topString = @"信工新闻眼";
        }
        case 3:
        {
            BNDView.topString = @"信工新闻眼";
        }
        case 4:
        {
            BNDView.topString = @"随时随地学";
        }
            
        default:
            break;
    }
    BNDView.newsID = [_modelArr[didSelectAtIndex] valueForKey:@"url"];
    [self.navigationController pushViewController:BNDView animated:YES];
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
