//
//  LoginViewController.m
//  党建
//
//  Created by Mac on 2018/10/29.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
//初始化导航栏
- (void)initNav
{
    self.navigationItem.title = @"登录";
    //去除导航栏颜色差异
    self.navigationController.navigationBar.translucent = NO;
    //去除导航栏分割线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}
//懒加载
-(AFHTTPSessionManager *)manager
{
    if(!_manager)
    {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BaseURL]];
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return _manager;
}
//初始化LoginView
- (void)initLoginView
{
    _loginView = [[LoginView alloc] init];
    _loginView.delegate = self;
    [self.view addSubview:_loginView];
    [_loginView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        make.top.equalTo(0);
        make.height.equalTo(SCREENHEIGHT - NavigationBarHeight - TabBarHeight);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = NavigationColor;
    //让视图自动从导航栏下开始
    self.edgesForExtendedLayout = UIRectEdgeBottom;
    [self initNav];
    [self initLoginView];
}

#pragma mark -- LoginVeiwDelegate
- (void)DidSelectLoginBtn
{
    NSLog(@"点击登录按钮了");
    __weak typeof(self) weakSelf = self;
    NSString *IDNum = _loginView.fieldIDNum.text;
    NSString *PassWord = _loginView.fieldPassWord.text;
    NSDictionary *requestDic = @{@"id_card":IDNum, @"password":PassWord};
    NSLog(@"%@", requestDic);
    [self.manager POST:@"/hhdj/user/userLogin.do" parameters:requestDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //显式转换
        NSDictionary *responseDic = (NSDictionary *)responseObject;
        NSString *msg = responseDic[@"msg"];
        if([msg isEqualToString:@"登录成功"])
        {
            //将token值存储起来
            [SETUSERDEFAULT(responseDic[@"token"], @"token")];
            //取出data
            NSArray *dataArr = @[responseDic[@"data"]];
            //存放Model的数组
            NSMutableArray *modelArr = [[NSMutableArray alloc] initWithCapacity:1];
            //字典转模型
            modelArr = [AssignToObject customModel:@"LoginModel" ToArray:dataArr];
            //将对应用户的头像链接和用户名存储起来
            [SETUSERDEFAULT([modelArr[0] valueForKey:@"header"], @"headImg")];
            [SETUSERDEFAULT([modelArr[0] valueForKey:@"username"], @"userName")];
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
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
