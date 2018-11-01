//
//  PersonalInformationViewModel.m
//  党建
//
//  Created by Mac on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "PersonalInformationViewModel.h"

@implementation PersonalInformationViewModel

- (void)getPersonalInformationManager:(AFHTTPSessionManager *)manager ModelArrCallBack:(nonnull Block)modelArrCallBack Alert:(nonnull alertBlock)alert
{
    //创建信号量
    manager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    [manager GET:@"/hhdj/user/userInfo.do" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //显示转换
        NSDictionary *responseDic = (NSDictionary *)responseObject;
        NSString *msg = responseDic[@"msg"];
        if([msg isEqualToString:@"成功"])
        {
            //得到个人信息
            NSArray *responseArr = @[responseDic[@"data"]];
            NSMutableArray *modelArr = [[NSMutableArray alloc] initWithCapacity:1];
            //字典转模型
            modelArr = [AssignToObject customModel:@"PersonalInformationModel" ToArray:responseArr];
            //数组回调
            modelArrCallBack(modelArr);
        }
        else
        {
            alert([self setAlertMessage:msg]);
        }
        
        //信号量信号
        dispatch_semaphore_signal(semaphore);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        alert([self setAlertMessage:@"请求错误，请检查网络"]);
        //信号量信号
        dispatch_semaphore_signal(semaphore);
    }];
    
    //等待
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}

- (UIAlertController *)setAlertMessage:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    return alert;
}

@end
