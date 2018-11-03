//
//  PersonalInformationViewController.h
//  党建
//
//  Created by Mac on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalInformationView.h"
#import "PersonalInformationViewModel.h"
#import "ChangeInformationViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonalInformationViewController : UIViewController
//导航栏编辑保存button
@property (nonatomic, strong) UIButton *navBtn;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) PersonalInformationView *personalInformationView;

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@property (nonatomic, strong) NSMutableArray *modelMutArr;

@end

NS_ASSUME_NONNULL_END
