//
//  LoginViewController.h
//  党建
//
//  Created by Mac on 2018/10/29.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"
#import "MineViewController.h"
#import "LoginModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController<LoginVeiwDelegate>

@property (nonatomic, strong) LoginView *loginView;
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

NS_ASSUME_NONNULL_END
