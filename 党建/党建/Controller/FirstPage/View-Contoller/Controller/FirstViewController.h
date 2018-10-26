//
//  FirstViewController.h
//  党建
//
//  Created by Mac on 2018/10/24.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGBanner.h"
#import "BannerView.h"
#import "FirstPageViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController<PGBannerDelegate>

@property (nonatomic, strong) UIImageView *imgViewWire;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, strong) NSMutableArray *modelArr;

@end

NS_ASSUME_NONNULL_END
