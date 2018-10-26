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
    //创建信号量
    manager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
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
            NSLog(@"%@", modelArr);
            //轮播图图片回调
            bannerBlock(modelArr);
        }
        else
        {
            alertBlock([self alertMessage:@"请求错误"]);
        }
        
        //信号量信号
        dispatch_semaphore_signal(semaphore);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        alertBlock([self alertMessage:@"请求错误，请检查网络"]);
        //信号量信号
        dispatch_semaphore_signal(semaphore);
    }];
    
    //等待
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}

- (UIAlertController *)alertMessage:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    return alert;
}
@end
