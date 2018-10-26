//
//  PictureViewController.m
//  党建
//
//  Created by apple on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "PictureViewController.h"
#import "RefreshCollectionView.h"
#import "PictureCollectionViewCell.h"

@interface PictureViewController ()

@property(nonatomic , strong) RefreshCollectionView * collectionView;
@property(nonatomic , assign) int page;
@property(nonatomic , strong) NSMutableArray * objArr;
@property(nonatomic , strong) AFHTTPSessionManager * manager;

@end

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self collectionView];
    
}

//初始化collectionView
- (RefreshCollectionView *)collectionView
{
    if(!_collectionView)
    {
        _collectionView = [[RefreshCollectionView alloc] initWithFrame:CGRectMake(15, 0, SCREENWIDTH-30, SCREENHEIGHT) collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        [_collectionView registerClass:[PictureCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        //滚动条
        _collectionView.showsVerticalScrollIndicator = NO;
        //item没有铺满屏幕时也可以滚动
        _collectionView.alwaysBounceVertical = YES;
        [self.view addSubview:_collectionView];
        
        __weak typeof(self) weakSelf = self;
        //下拉刷新
        _collectionView.pullDownBlock = ^(RefreshCollectionView * _Nonnull collectionView) {
            weakSelf.page = 0;
            [weakSelf.objArr removeAllObjects];
            [weakSelf performSelector:@selector(loadNewData) withObject:nil afterDelay:0.5];
        };
        //上拉刷新
        _collectionView.dragUpBlock = ^(RefreshCollectionView * _Nonnull collectionView) {
            [weakSelf performSelector:@selector(loadNewData) withObject:nil afterDelay:0.5];
        };
        
        [_collectionView firstRefresh];
        
    }
    return _collectionView;
}

//懒加载manager
-(AFHTTPSessionManager*)manager
{
    if(!_manager)
    {
        _manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:@"http://211.67.177.56:8080"]];
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return _manager;
}

///懒加载存放对像的数组
-(NSMutableArray *)objArr
{
    if(!_objArr)
    {
        _objArr = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _objArr;
}

//加载数据
- (void)loadNewData
{
    __weak typeof(self) weakSelf = self;
    NSDictionary * dic = @{@"page":@"1",@"rows":@"10",@"type":@"7"};
    [weakSelf.manager POST:@"/hhdj/news/newsList.do" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary * objDic = (NSDictionary *)responseObject;
        NSArray * allObj = objDic[@"rows"];
        //一次加载4条数据
        for (int i = weakSelf.page; i < weakSelf.page+4; i++)
        {
            //防止数据不够4条
            if(i < [allObj count])
            {
                [weakSelf.objArr addObject:allObj[i]];
            }
            else
            {
                break;
            }
        }
        
        //刷新数据
        [weakSelf.collectionView reloadData];
        [weakSelf.collectionView collectionViewDidFinishedLoading];
        
        //判断是不是最后的数据
        weakSelf.page = (int)[weakSelf.objArr count];
        if((weakSelf.page >= [allObj count]-1))
        {
            self.collectionView.reachedTheEnd = YES;
        }
        else
        {
            self.collectionView.reachedTheEnd = NO;
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark --UICollectionViewDataSource
//cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    PictureCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString * titleStr = _objArr[indexPath.item][@"title"];
    NSString * imgURLStr = _objArr[indexPath.item][@"pic"];
    
    cell.titleLab.text = titleStr;
    [cell.imgView setImageWithURL:[NSURL URLWithString:imgURLStr]];
    
    return cell;
}

//点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
}

//行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_objArr count];
}

//响应拉的操作
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.collectionView collectionViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.collectionView collectionViewEndDragging:scrollView];
}

#pragma mark --UICollectionViewDelegate
//定义每个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(IMGWHIDTH, IMGWHIDTH+5);
}

//定义每个cell上下行的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

//定义同一行item的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
