//
//  PersonalDetailIntegralViewController.m
//  党建
//
//  Created by 邱敏 on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "PersonalDetailIntegralViewController.h"
#import "RefreshTableView.h"
#import "MBProgressHUD.h"
#import "CommonJudge.h"
#import "CommonAlertView.h"
#import "AssignToObject.h"
#import "DateIntagralModel.h"
#import "DetailIntagralCellTableViewCell.h"

@interface PersonalDetailIntegralViewController ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) RefreshTableView *aTableView;
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, strong) NSMutableArray *objectArr;
/** 刷新的次数(页数) */
@property (nonatomic, assign) NSInteger page;

@end

@implementation PersonalDetailIntegralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ssRGBHex(0xE3E3E3);
    self.navigationItem.title = @"积分明细";
    
    [self.view addSubview:self.aTableView];
}

-(NSMutableArray *)objectArr
{
    if(!_objectArr)
    {
        _objectArr = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _objectArr;
}

-(AFHTTPSessionManager *)manager
{
    if(!_manager)
    {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://211.67.177.56:8080"]];
        //设置请求方式
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        //接收数据是json形式给出
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
    }
    return _manager;
}

//懒加载UITableView
-(RefreshTableView *)aTableView
{
    if(!_aTableView)
    {
        _aTableView = [[RefreshTableView alloc] initWithFrame:CGRectMake(0, 2, SCREENWIDTH, SCREENHEIGHT - 64) style:UITableViewStylePlain];
        //右侧滑动线隐藏
        _aTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //注册Cell
        [_aTableView registerClass:[DetailIntagralCellTableViewCell class] forCellReuseIdentifier:@"firstCell"];
        _aTableView.delegate = self;
        _aTableView.dataSource = self;
        
        //iOS 11下 TableView的高度固定
        if (@available(iOS 11.0, *))
        {
            _aTableView.estimatedRowHeight = 0;
        }
        
        __weak typeof(self) weakSelf = self;
        //下拉
        _aTableView.pullDownBlock = ^(RefreshTableView *tableView) {
            weakSelf.page = 1;
            //清空所有旧数据
            [weakSelf.objectArr removeAllObjects];
            //刷新数据
            [weakSelf performSelector:@selector(loadNewData) withObject:nil afterDelay:0.5];
        };
        
        //上拉
        _aTableView.dragUpBlock = ^(RefreshTableView *tableView) {
            //刷新数据
            [weakSelf performSelector:@selector(loadNewData) withObject:nil afterDelay:0.5];
        };
        
        //进来先刷新下数据
        [self.aTableView firstRefresh];
    }
    return _aTableView;
}

//下载新数据
-(void)loadNewData
{
    [self initWithManagerURLType];
    //结束刷新
    [self.aTableView tableViewDidFinishedLoading];
}

-(void)initWithManagerURLType
{
    //判断是否有网络
    if ([CommonJudge isConnectionAvailable])
    {
        //加载提示
        [CommonJudge showMBProgressHUD:@"加载中..." andWhereView:self.view];
        NSDictionary *dic = @{@"user_id":[USERDEFAULT(@"id")],@"page":[NSString stringWithFormat:@"%ld", self.page], @"rows":@"10"};
        __weak typeof(self) weakSelf = self;
        [self.manager POST:@"/hhdj/integral/integralList.do" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //数据加载成功时，去掉模块
            [CommonJudge hideMBprogressHUD:self.view];
            
            NSLog(@"%@", responseObject);
            //获取新闻信息数组
            NSArray *objArr = responseObject[@"rows"];
            //字典转模型
            NSArray *arr = [AssignToObject customModel:@"DateIntagralModel" ToArray:objArr];
            for (NSInteger i = 0; i < [arr count]; i++)
            {
                [weakSelf.objectArr addObject:arr[i]];
            }
            //是否加载完数据库中所有的信息
            if ([objArr count] < 10)
            {
                weakSelf.aTableView.reachedTheEnd = YES;
            }
            else
            {
                weakSelf.aTableView.reachedTheEnd = NO;
            }
            self.page++;
            //数据刷新
            [weakSelf.aTableView reloadData];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@", error);
            //数据加载成功时，去掉模块
            [CommonJudge hideMBprogressHUD:self.view];
        }];
    }
    else
    {
        //警告框提示
        [CommonAlertView initMessage:@"请检查网络" andVC:self];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.objectArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DateIntagralModel *obj = [self.objectArr safeObjectIndex:indexPath.row];
    DetailIntagralCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
    [cell getModel:obj];
    return cell;
}

//Cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

//Cell点击操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //消除Cell选择痕迹
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UIScrollViewDalatage
//识别上拉操作,响应上拉操作
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.aTableView tableViewDidScroll:scrollView];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.aTableView tableViewDidEndDragging:scrollView];
}

@end
