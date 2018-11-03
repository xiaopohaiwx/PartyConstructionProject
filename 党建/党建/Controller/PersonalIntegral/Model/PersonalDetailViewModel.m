//
//  PersonalDetailViewModel.m
//  党建
//
//  Created by 邱敏 on 2018/11/2.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "PersonalDetailViewModel.h"

@implementation PersonalDetailViewModel

//获取接口个人总积分
+(NSString *)getTotalScore:(void(^)(NSString *str))scoreStr
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://211.67.177.56:8080"]];
    //设置请求方式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //接收数据是json形式给出
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSDictionary *dic = @{@"user_id":[USERDEFAULT(@"id")],@"page":@"1", @"rows":@"1"};
    [manager POST:@"/hhdj/integral/integralList.do" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        //获取新闻信息数组
        NSArray *objArr = responseObject[@"rows"];
        NSString *str = [objArr[0] valueForKey:@"totalScore"];
        scoreStr([NSString stringWithFormat:@"%@", str]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    return nil;
}

@end
