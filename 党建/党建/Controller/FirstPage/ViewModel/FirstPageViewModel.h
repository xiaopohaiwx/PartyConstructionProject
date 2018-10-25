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

NS_ASSUME_NONNULL_BEGIN

@interface FirstPageViewModel : NSObject

typedef void(^bannerBlock)(NSMutableArray *arr);
typedef void(^alertBlock)(UIAlertController *alert);

//轮播图图片请求
- (void)BannerImageRequst:(AFHTTPSessionManager *)manager CallBackArr:(bannerBlock)bannerBlock CallBackAlert:(alertBlock)alertBlock;

@end

NS_ASSUME_NONNULL_END
