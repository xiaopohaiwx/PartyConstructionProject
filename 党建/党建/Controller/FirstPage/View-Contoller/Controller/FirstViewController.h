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
#import "FirstPageView.h"
#import "HandheldLifeViewController.h"
#import "BaseNewsDetailsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController<PGBannerDelegate, FirstPageViewDelegate>

@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, strong) NSMutableArray *modelArr;
@property (nonatomic, strong) PGBanner *banner;

/* FirstPageView */
@property (nonatomic, strong) FirstPageView *firstPageView;

@end

NS_ASSUME_NONNULL_END
