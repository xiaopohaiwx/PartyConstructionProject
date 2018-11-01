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

@interface PersonalIntegralViewController ()

@property (nonatomic, strong) PersonalIntegralView *integralView;

/** 规则数组 */
@property (nonatomic, strong) NSMutableArray *typeNameArr;
@property (nonatomic, strong) NSMutableArray *maxNumArr;

@end

@implementation PersonalIntegralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ssRGBHex(0xE3E3E3);
    self.navigationItem.title = @"个人量化积分";

    [self getHTTPManager];
}

-(NSMutableArray *)typeNameArr
{
    if(!_typeNameArr)
    {
        _typeNameArr = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _typeNameArr;
}

-(NSMutableArray *)maxNumArr
{
    if(!_maxNumArr)
    {
        _maxNumArr = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _maxNumArr;
}

//视图界面
-(void)getAllView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [self.view addSubview:scrollView];
    //当前视图的高度 = 350(顶部到积分规则位置高度) + 32 * self.typeNameArr.count(每条规则高度)
    scrollView.contentSize = CGSizeMake(SCREENWIDTH, 350 + 32 * self.typeNameArr.count);
    
    _integralView = [[PersonalIntegralView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 350 + 32 * self.typeNameArr.count) WithTypeArr:self.typeNameArr NumArr:self.maxNumArr];
    [scrollView addSubview:_integralView];
    __weak typeof(self) weakSelf = self;
    _integralView.jumpBlock = ^(UIImageView * _Nonnull img) {
        [weakSelf.navigationController pushViewController:[[PersonalDetailIntegralViewController alloc] init] animated:YES];
    };
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
        for (id model in objArr)
        {
            [weakSelf.typeNameArr addObject:[model valueForKey:@"typeName"]];
            NSString *str = [NSString stringWithFormat:@"%@", [model valueForKey:@"maxNum"]];
            [weakSelf.maxNumArr addObject:str];
        }
        
        [self getAllView];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

@end
