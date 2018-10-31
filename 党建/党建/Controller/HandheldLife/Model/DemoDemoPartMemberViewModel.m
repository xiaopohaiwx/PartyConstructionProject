//
//  DemoDemoPartMemberViewModel.m
//  党建
//
//  Created by 邱敏 on 2018/10/30.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "DemoDemoPartMemberViewModel.h"
#import "CommonJudge.h"
#import "CommonAlertView.h"
#import "AssignToObject.h"
#import "DemoDemoPartMemberModel.h"


@implementation DemoDemoPartMemberViewModel

+(NSArray *)GET:(NSString *)url ObjectArray:(void (^)(NSArray *arr))array ViewController:(UIViewController *)vc
{
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://211.67.177.56:8080"]];
    //设置请求方式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //接收数据是json形式给出
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //判断是否有网络
    if ([CommonJudge isConnectionAvailable])
    {
        //加载提示
        [CommonJudge showMBProgressHUD:@"加载中..." andWhereView:vc.view];

        [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //数据加载成功时，去掉模块
            [CommonJudge hideMBprogressHUD:vc.view];
            
//            NSLog(@"%@", responseObject);
            //获取党员信息
            NSArray *objArr = responseObject[@"rows"];
            //字典转模型
            NSArray *arr = [AssignToObject customModel:@"DemoDemoPartMemberModel" ToArray:objArr];
            //传到控制器
            array(arr);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //数据加载成功时，去掉模块
            [CommonJudge hideMBprogressHUD:vc.view];
            NSLog(@"%@", error);
        }];
    }
    else
    {
        //警告框提示
        [CommonAlertView initMessage:@"请检查网络" andVC:vc];
    }
    return nil;
}


@end
