//
//  BaseTableViewController.m
//  党建
//
//  Created by 邱敏 on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "BaseTableViewController.h"
#import "RefreshTableView.h"
#import "TableViewCell.h"
#import "MBProgressHUD.h"

@interface BaseTableViewController ()

@property (nonatomic, strong) RefreshTableView *aTableView;

@property (nonatomic, strong) NSMutableArray *objectArr;
/** 刷新的次数(页数) */
@property (nonatomic, assign) NSInteger page;

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(NSMutableArray *)objectArr
{
    if(!_objectArr)
    {
        _objectArr = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _objectArr;
}

//懒加载UITableView
-(RefreshTableView *)aTableView
{
    if(!_aTableView)
    {
        _aTableView = [[RefreshTableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        //右侧滑动线隐藏
        _aTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //注册Cell
        [_aTableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"firstCell"];
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
            weakSelf.page = 0;
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
    }
    return _aTableView;
}

//下载新数据
-(void)loadNewData
{
    
}

-(void)initWithManagerURLString:(NSString *)url
{
    
}

@end
