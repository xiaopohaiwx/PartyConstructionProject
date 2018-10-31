//
//  LoginView.m
//  党建
//
//  Created by Mac on 2018/10/29.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView{
    UIImageView *imgViewLogo;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        imgViewLogo = [UIImageView imageViewWithName:@"logo" SuperView:self];
        [imgViewLogo makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(20);
            make.size.equalTo(CGSizeMake(200, 50));
        }];
        
        UIImageView *imgViewDialog1 = [UIImageView imageViewWithName:@"loginDialog" SuperView:self];
        [imgViewDialog1 makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->imgViewLogo.left).offset(-40);
            make.right.equalTo(self->imgViewLogo.right).offset(40);
            make.top.equalTo(self->imgViewLogo.bottom).offset(30);
            make.height.equalTo(45);
        }];
        
        UIImageView *imgViewDialog2 = [UIImageView imageViewWithName:@"loginDialog" SuperView:self];
        [imgViewDialog2 makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->imgViewLogo.left).offset(-40);
            make.right.equalTo(self->imgViewLogo.right).offset(40);
            make.top.equalTo(imgViewDialog1.bottom).offset(10);
            make.height.equalTo(45);
        }];
        
        _fieldIDNum = [UITextField textFieldWithSuperView:self Placehold:@"身份证号" PlaceholdColor:[UIColor whiteColor]];
        [_fieldIDNum makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imgViewDialog1.left).offset(10);
            make.right.equalTo(imgViewDialog1.right).offset(-10);
            make.centerY.equalTo(imgViewDialog1);
            make.height.equalTo(40);
        }];
        
        _fieldPassWord = [UITextField textFieldWithSuperView:self Placehold:@"密码" PlaceholdColor:[UIColor whiteColor]];
        [_fieldPassWord makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imgViewDialog2.left).offset(10);
            make.right.equalTo(imgViewDialog2.right).offset(-10);
            make.centerY.equalTo(imgViewDialog2);
            make.height.equalTo(40);
        }];
        
        UIButton *button = [UIButton buttonWithName:@"login_btn" SuperView:self Title:@"登录" Target:self Action:@selector(loginBtn)];
        [button makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imgViewDialog1.left).offset(0);
            make.right.equalTo(imgViewDialog1.right).offset(0);
            make.top.equalTo(imgViewDialog2.bottom).offset(10);
            make.height.equalTo(45);
        }];
    }
    return self;
}

//登录点击事件
- (void)loginBtn
{
    if(_delegate)
    {
        [_delegate DidSelectLoginBtn];
    }
}

@end
