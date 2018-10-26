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

//提示框
- (UIAlertController *)alertMessage:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    return alert;
}
//轮播图view回调
- (void)CallBackBannerView:(NSMutableArray *)modelArr CallBackView0:(view0Block)block0 CallBackView1:(view1Block)block1 CallBackView2:(view2Block)block2 CallBackView3:(view3Block)block3 CallBackView4:(view4Block)block4 CallBackView5:(view5Block)block5
{
    BannerView *view1 = [[BannerView alloc] init];
    [view1.imgView setImageWithURL:[NSURL URLWithString:[modelArr[0] valueForKey:@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    view1.labelTitle.text = [modelArr[0] valueForKey:@"title"];
    
    BannerView *view2 = [[BannerView alloc] init];
    [view2.imgView setImageWithURL:[NSURL URLWithString:[modelArr[1] valueForKey:@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    view2.labelTitle.text = [modelArr[1] valueForKey:@"title"];
    
    BannerView *view3 = [[BannerView alloc] init];
    [view3.imgView setImageWithURL:[NSURL URLWithString:[modelArr[2] valueForKey:@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    view3.labelTitle.text = [modelArr[2] valueForKey:@"title"];
    
    BannerView *view4 = [[BannerView alloc] init];
    [view4.imgView setImageWithURL:[NSURL URLWithString:[modelArr[3] valueForKey:@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    view4.labelTitle.text = [modelArr[3] valueForKey:@"title"];
    
    BannerView *view0 = [[BannerView alloc] init];
    [view0.imgView setImageWithURL:[NSURL URLWithString:[modelArr[3] valueForKey:@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    view0.labelTitle.text = [modelArr[3] valueForKey:@"title"];
    
    BannerView *view5 = [[BannerView alloc] init];
    [view5.imgView setImageWithURL:[NSURL URLWithString:[modelArr[0] valueForKey:@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    view5.labelTitle.text = [modelArr[0] valueForKey:@"title"];
    
    block0(view0);
    block1(view1);
    block2(view2);
    block3(view3);
    block4(view4);
    block5(view5);
}

@end
