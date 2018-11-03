//
//  PersonalIntegralViewController.m
//  党建
//
//  Created by 邱敏 on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "PersonalIntegralViewController.h"
#import "PersonalIntegralView.h"
#import "PersonalDetailIntegralViewController.h"
#import "AssignToObject.h"
#import "PersonalDetailViewModel.h"

@interface PersonalIntegralViewController ()

@property (nonatomic, strong) PersonalIntegralView *integralView;
@property (nonatomic, strong) UIScrollView *scrollView;

/** 规则数组 */
//@property (nonatomic, strong) NSMutableArray *typeNameArr;
//@property (nonatomic, strong) NSMutableArray *maxNumArr;

@end

//当前视图的高度 = 350(顶部到积分规则位置高度) + 32 * self.typeNameArr.count(每条规则高度)
#define RuleHeight 350 + 32 * typeNameArr.count

@implementation PersonalIntegralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ssRGBHex(0xE3E3E3);
    self.navigationItem.title = @"个人量化积分";

    [self getAllView];
    [self getHTTPManager];
}

//视图界面
-(void)getAllView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [self.view addSubview:_scrollView];
    
    //界面视图
    _integralView = [[PersonalIntegralView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [self.scrollView addSubview:_integralView];
    __weak typeof(self) weakSelf = self;
    weakSelf.integralView.jumpBlock = ^(UIImageView * _Nonnull img) {
        [weakSelf.navigationController pushViewController:[[PersonalDetailIntegralViewController alloc] init] animated:YES];
    };
    [PersonalDetailViewModel getTotalScore:^(NSString *str) {
        //从网络获取的量化总积分积分
        weakSelf.integralView.integralLable.text = str;
    }];
}

//获取接口
-(void)getHTTPManager
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://211.67.177.56:8080"]];
    //设置请求方式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //接收数据是json形式给出
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    __weak typeof(self) weakSelf = self;
    [manager GET:@"/hhdj/integral/integralRule.do" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        
        NSArray *objArr = responseObject[@"rows"];
        
        //typeNameArr 规则数组
        NSMutableArray *typeNameArr = [[NSMutableArray alloc] initWithCapacity:1];
        //maxNumArr 积分数组
        NSMutableArray *maxNumArr = [[NSMutableArray alloc] initWithCapacity:1];
        
        for (id model in objArr)
        {
            [typeNameArr addObject:[model valueForKey:@"typeName"]];
            NSString *str = [NSString stringWithFormat:@"%@", [model valueForKey:@"maxNum"]];
            [maxNumArr addObject:str];
        }
        
        //根据接口r规则个数更新视图高度
        weakSelf.scrollView.contentSize = CGSizeMake(SCREENWIDTH, RuleHeight);
        [weakSelf.integralView Frame:CGRectMake(0, 0, SCREENWIDTH, RuleHeight) WithTypeArr:typeNameArr NumArr:maxNumArr];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

@end
