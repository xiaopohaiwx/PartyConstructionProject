//
//  RefreshView.h
//
//  NewsEyeViewController.m
//  党建
//
//  Created by 邱敏 on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingView.h"

@interface RefreshTableView : UITableView<UIScrollViewDelegate>

typedef void (^PullDownRefreshingBlock)(RefreshTableView *tableView);
typedef void (^DragUpRefreshingBlock)(RefreshTableView *tableView);

@property (copy, nonatomic) PullDownRefreshingBlock pullDownBlock;
@property (copy, nonatomic) DragUpRefreshingBlock dragUpBlock;

@property (nonatomic, strong) LoadingView *headerView;
@property (nonatomic, strong) LoadingView *footerView;
@property (nonatomic, assign) BOOL reachedTheEnd;
@property (nonatomic, assign) BOOL loading;

//用来标示是否为上拉的动作
@property (nonatomic, assign) BOOL isFooterInAction;
@property (nonatomic, assign) BOOL headerOnly;

- (void)tableViewDidScroll:(UIScrollView *)scrollView;
- (void)tableViewDidEndDragging:(UIScrollView *)scrollView;
- (void)tableViewDidFinishedLoading;
- (void)firstRefresh;

@end
