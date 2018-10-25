//
//  FirstPageViewModel.m
//  党建
//
//  Created by Mac on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "FirstPageViewModel.h"

@implementation FirstPageViewModel

- (void)BannerImageRequst:(AFHTTPSessionManager *)manager
{
    [manager GET:@"/hhdj/carousel/carouselList.do?type=0" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDic = (NSDictionary *)responseObject;
        NSString *msg = responseDic[@"msg"];
        if([msg isEqualToString:@"请求成功"])
        {
            NSArray *rowsArr = responseDic[@"rows"];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
