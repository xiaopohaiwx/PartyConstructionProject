//
//  NewsDetailsViewModel.m
//  党建
//
//  Created by 邱敏 on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "NewsDetailsViewModel.h"
#import "CommonJudge.h"
#import "CommonAlertView.h"
#import "AssignToObject.h"
#import "TableCellModel.h"

@implementation NewsDetailsViewModel

+(NSString *)getNewsDetailsContent:(void (^)(NSString *content, NSString *title))str NewsID:(NSString *)newsID ViewController:(UIViewController *)vc
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
        
        [manager POST:@"/hhdj/news/newsContent.do" parameters:@{@"newsId":newsID} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //数据加载成功时，去掉模块
            [CommonJudge hideMBprogressHUD:vc.view];
            
//            NSLog(@"%@", responseObject[@"data"]);
            NSString *content = [responseObject[@"data"] valueForKey:@"content"];
            NSString *title = [responseObject[@"data"] valueForKey:@"title"];
            NSLog(@"%@", content);
            //bolck传值，返回数据
            str(content, title);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@", error);
            //数据加载成功时，去掉模块
            [CommonJudge hideMBprogressHUD:vc.view];
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
