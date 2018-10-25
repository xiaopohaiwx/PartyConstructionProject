//
//  FirstPageViewModel.m
//  党建
//
//  Created by Mac on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "FirstPageViewModel.h"

@implementation FirstPageViewModel

//轮播图图片请求
- (void)BannerImageRequst:(AFHTTPSessionManager *)manager CallBackArr:(bannerBlock)bannerBlock CallBackAlert:(alertBlock)alertBlock
{
    [manager GET:@"/hhdj/carousel/carouselList.do?type=0" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDic = (NSDictionary *)responseObject;
        NSString *msg = responseDic[@"msg"];
        if([msg isEqualToString:@"请求成功"])
        {
            //请求的数据
            NSArray *rowsArr = responseDic[@"rows"];
            //存放model的数组
            NSMutableArray *modelArr = [[NSMutableArray alloc] initWithCapacity:1];
            //字典转模型
            modelArr = [AssignToObject customModel:@"BannerModel" ToArray:rowsArr];
            //轮播图图片回调
            bannerBlock(modelArr);
        }
        else
        {
            alertBlock([self alertMessage:@"请求错误"]);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        alertBlock([self alertMessage:@"请求错误，请检查网络"]);
    }];
}

- (UIAlertController *)alertMessage:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    return alert;
}
@end
