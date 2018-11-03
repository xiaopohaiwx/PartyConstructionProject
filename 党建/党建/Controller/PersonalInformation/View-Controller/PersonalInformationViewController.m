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
//懒加载
-(AFHTTPSessionManager *)manager
{
    if(!_manager)
    {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BaseURL]];
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        [_manager.requestSerializer setValue:[USERDEFAULT(@"token")] forHTTPHeaderField:@"token"];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return _manager;
}
//初始化导航栏
- (void)initNav
{
    self.navigationItem.title = @"个人信息";
    _navBtn = [UIButton buttonWithText:@"编辑" TextColor:[UIColor whiteColor] Target:self Action:@selector(editor:)];
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
//初始化PersonalInformationView
- (void)initPersonalInformationView
{
    //通过PersonalInformationViewModel获得用户信息
    __weak typeof(self) weakSelf = self;
    PersonalInformationViewModel *personalInformationViewModel = [[PersonalInformationViewModel alloc] init];
    [personalInformationViewModel getPersonalInformationManager:self.manager ModelArrCallBack:^(NSMutableArray * _Nonnull array) {
        weakSelf.modelMutArr = array;
    } Alert:^(UIAlertController * _Nonnull alert) {
        [weakSelf presentViewController:alert animated:YES completion:nil];
    }] ;
    
    _personalInformationView = [[PersonalInformationView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 0) ContentArr:self.modelMutArr];
    [_scrollView addSubview:_personalInformationView];
    [_personalInformationView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.scrollView.top).offset(0);
        make.height.equalTo(770);
    }];
    
    [self.view layoutIfNeeded];
    _scrollView.contentSize = CGSizeMake(SCREENWIDTH, _personalInformationView.frame.origin.y + _personalInformationView.frame.size.height + 10);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BGCOLOR;
    [self initNav];
    [self initScrollView];
    [self initPersonalInformationView];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_personalInformationView removeFromSuperview];
    [self initPersonalInformationView];
}


//导航栏button点击事件
- (void)editor:(UIButton *)btn
{
    ChangeInformationViewController *CView = [[ChangeInformationViewController alloc] init];
    CView.modelMutArr = self.modelMutArr;
    [self.navigationController pushViewController:CView animated:YES];
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
