//
//  ChangePWDViewController.m
//  党建
//
//  Created by apple on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "ChangePWDViewController.h"
#import "InputPWDView.h"

@interface ChangePWDViewController ()

@property(nonatomic , strong) InputPWDView * inputPWDView;
@property(nonatomic , strong) NSString * oldPWD;
@property(nonatomic , strong) NSString * PWD1;
@property(nonatomic , strong) NSString * PWD2;
@property(nonatomic , strong) AFHTTPSessionManager * manager;

@end

@implementation ChangePWDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"修改密码";
    
    self.view.backgroundColor = BGCOLOR;
    
    [self initInputPWDView];
    
    //确定按钮
    UIButton * button = [UIButton buttonWithName:@"login_btn" SuperView:self.view Title:@"确定" Target:self Action:@selector(changePWD)];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(SCREENWIDTH-60, 50));
        make.left.equalTo(30);
        make.top.equalTo(self.inputPWDView.bottom).offset(10);
    }];
    
}

//初始化三个输入框
- (void)initInputPWDView
{
    NSArray * arr = [NSArray arrayWithObjects:@"旧密码:",@"新密码:",@"确认密码:", nil];
    for (int i = 0; i < [arr count]; i++)
    {
        _inputPWDView = [[InputPWDView alloc] initWithFrame:CGRectMake(30, 40+80*i, SCREENWIDTH-60, 80)];
        _inputPWDView.textFile.delegate = self;
        _inputPWDView.textFile.tag = i;
        _inputPWDView.titleLab.text = arr[i];
        [self.view addSubview:_inputPWDView];
    }
}

//编辑结束
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 0:
            _oldPWD = textField.text;
            NSLog(@"%@",textField.text);
            break;
        case 1:
            _PWD1 = textField.text;
            NSLog(@"%@",textField.text);
            break;
        case 2:
            _PWD2 = textField.text;
            NSLog(@"%@",textField.text);
            break;
        default:
            break;
    }
}

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

//点击确定
- (void)changePWD
{
    __weak typeof(self) weakSelf = self;
    NSDictionary * dic = @{@"user_id":@"3",@"oldPwd":_oldPWD,@"newPwd":_PWD1};
    if([_PWD1 isEqualToString:_PWD2])
    {
        [weakSelf.manager POST:@"/hhdj/user/updatePwd.do" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary * objDic = (NSDictionary *)responseObject;
            //long类型为基本数据类型
            if([objDic[@"code"] isEqual:[NSNumber numberWithLong:1]])
            {
                UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码修改成功" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                }];
                
                [alert addAction:action];
                [weakSelf presentViewController:alert animated:YES completion:nil];
            }
            else
            {
                [CommonAlertView initMessage:objDic[@"msg"] andVC:weakSelf];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    }
    else
    {
        [CommonAlertView initMessage:@"确认密码不正确" andVC:weakSelf];
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
