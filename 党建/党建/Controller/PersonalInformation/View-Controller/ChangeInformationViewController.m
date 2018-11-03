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
//懒加载
-(AFHTTPSessionManager *)manager
{
    if(!_manager)
    {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BaseURL]];
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        [_manager.requestSerializer setValue:[USERDEFAULT(@"token")] forHTTPHeaderField:@"token"];
    }
    return _manager;
}
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
    _changeInformationView.delegate = self;
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
//日期确定按钮
- (void)setButton
{
    _enterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_enterBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_enterBtn addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
    _enterBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    [_enterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:_enterBtn];
    [_enterBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.datePicker.bottom).offset(0);
        make.left.right.equalTo(0);
        make.height.equalTo(50);
    }];
}
//导航栏按钮点击事件
- (void)editor:(UIButton *)btn
{
    //创建字典
    _Dic = [[NSMutableDictionary alloc] initWithCapacity:1];
    //textFiled标题数组
    NSArray *arr = @[@"username", @"idCard", @"hometown", @"address", @"nation", @"wxNum", @"qqNum", @"education", @"jobRank", @"salary"];
    for(NSInteger i = 0; i < 10; ++i)
    {
        if(i == 1)
        {
            continue;
        }
        [_Dic setObject:[_changeInformationView.fieldArr[i] valueForKey:@"text"] forKey:arr[i]];
    }
    [_Dic setObject:[NSNumber numberWithInteger:_changeInformationView.sex] forKey:@"sex"];
    //labelb标题数组
    NSArray *arr1 = @[@"joinPartyTime", @"lastPayTime"];
    for (NSInteger i = 0; i < 2; ++i)
    {
        [_Dic setObject:[_changeInformationView.labelArr[i] valueForKey:@"text"] forKey:arr1[i]];
    }
    [_Dic setObject:[NSNumber numberWithInteger:_changeInformationView.partyStatus] forKey:@"partyStatus"];
    NSLog(@"%@", _Dic);
    
    [self.manager POST:@"/hhdj/user/modifyInfo.do" parameters:_Dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDic = (NSDictionary *)responseObject;
        NSString *msg = responseDic[@"msg"];
        if([msg isEqualToString:@"修改成功"])
        {
            //跳转控制器
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            //提示框
            [CommonAlertView initMessage:msg andVC:self];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //提示框
        [CommonAlertView initMessage:@"请求失败，请检查网络" andVC:self];
    }];
}
//日期确定按钮点击事件
- (void)hidden
{
    _datePicker.hidden = YES;
    _enterBtn.hidden = YES;
}

#pragma mark -- ChangeInformationViewDelegate
- (void)getDatePicker:(UIDatePicker *)datePicker
{
    _datePicker = datePicker;
    [self.view addSubview:_datePicker];
    [self setButton];
}

@end
