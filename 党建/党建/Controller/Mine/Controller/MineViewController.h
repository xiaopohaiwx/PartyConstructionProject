//
//  MineViewController.h
//  党建
//
//  Created by Mac on 2018/10/24.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MineView.h"
#import "LoginViewController.h"
#import "PersonalInformationViewController.h"
#import "PersonalIntegralViewController.h"
#import "ChangePWDViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MineViewController : UIViewController<MineViewDelegate>

@property (nonatomic, strong) MineView *mineView;

@end

NS_ASSUME_NONNULL_END
