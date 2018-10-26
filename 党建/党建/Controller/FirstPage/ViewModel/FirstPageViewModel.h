//
//  FirstPageViewModel.h
//  党建
//
//  Created by Mac on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BannerModel.h"
#import "AssignToObject.h"
#import "BannerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstPageViewModel : NSObject
//请求回调block
typedef void(^bannerBlock)(NSMutableArray *arr);
typedef void(^alertBlock)(UIAlertController *alert);
//BannerView回调block
typedef void(^view0Block)(BannerView *view0);
typedef void(^view1Block)(BannerView *view1);
typedef void(^view2Block)(BannerView *view2);
typedef void(^view3Block)(BannerView *view3);
typedef void(^view4Block)(BannerView *view4);
typedef void(^view5Block)(BannerView *view5);

//轮播图图片请求
- (void)BannerImageRequst:(AFHTTPSessionManager *)manager CallBackArr:(bannerBlock)bannerBlock CallBackAlert:(alertBlock)alertBlock;
//轮播图view回调
- (void)CallBackBannerView:(NSMutableArray *)modelArr CallBackView0:(view0Block)block0 CallBackView1:(view1Block)block1 CallBackView2:(view2Block)block2 CallBackView3:(view3Block)block3 CallBackView4:(view4Block)block4 CallBackView5:(view5Block)block5;

@end

NS_ASSUME_NONNULL_END
