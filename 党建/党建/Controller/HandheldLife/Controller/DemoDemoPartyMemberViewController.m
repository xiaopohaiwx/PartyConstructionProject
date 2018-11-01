//
//  DemoDemoPartyMemberViewController.m
//  党建
//
//  Created by 邱敏 on 2018/10/30.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "DemoDemoPartyMemberViewController.h"
#import "RefreshTableView.h"
#import "DemoDemoPartMemberCell.h"
#import "DemoDemoPartMemberModel.h"
#import "DemoDemoPartMemberViewModel.h"

@interface DemoDemoPartyMemberViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) RefreshTableView *aTableView;
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, strong) NSMutableArray *objectArr;
/** 刷新的次数(页数) */
@property (nonatomic, assign) NSInteger page;

@end

@implementation DemoDemoPartyMemberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"参评党员";
    
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

-(RefreshTableView *)aTableView
{
    if(!_aTableView)
    {
        _aTableView = [[RefreshTableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        //右侧滑动线隐藏
        _aTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //注册Cell
        [_aTableView registerClass:[DemoDemoPartMemberCell class] forCellReuseIdentifier:@"firstCell"];
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

-(void)loadNewData
{
    //从网络获取数据
    __weak typeof(self) weakSelf = self;
    //该数组是在Content.plist中存储
    NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Content" ofType:@"plist"]];
    //根据类型选择不同的TOKEN值
    NSString *url = [NSString stringWithFormat:@"/hhdj/nationComment/userList.do?select_branch=%@&user_id=%@&page=%ld&rows=15", arr[self.type], [USERDEFAULT(@"token")],self.page];
    [DemoDemoPartMemberViewModel GET:url ObjectArray:^(NSArray * _Nonnull arr) {
        
        for (NSInteger i = 0; i < [arr count]; i++)
        {
            [weakSelf.objectArr addObject:arr[i]];
        }
        //是否加载完数据库中所有的信息
        if ([arr count] < 15)
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
        
    } ViewController:self];
    
    //结束刷新
    [self.aTableView tableViewDidFinishedLoading];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.objectArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoDemoPartMemberModel *obj = [self.objectArr safeObjectIndex:indexPath.row];
    DemoDemoPartMemberCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
    [cell getModel:obj];
    return cell;
}

//Cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

//Cell点击操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
