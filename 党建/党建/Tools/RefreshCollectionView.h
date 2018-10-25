//
//  RefreshCollectionView.h
//  Collection刷新
//
//  Created by apple on 2018/10/25.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingView.h"

NS_ASSUME_NONNULL_BEGIN

@interface RefreshCollectionView : UICollectionView<UIScrollViewDelegate>

typedef void (^PullDownRefreshingBlock)(RefreshCollectionView *collectionView);
typedef void (^DragUpRefreshingBlock)(RefreshCollectionView *collectionView);

@property (copy, nonatomic) PullDownRefreshingBlock pullDownBlock;
@property (copy, nonatomic) DragUpRefreshingBlock dragUpBlock;

@property (nonatomic, strong) LoadingView *headerView;
@property (nonatomic, strong) LoadingView *footerView;
@property (nonatomic, assign) BOOL reachedTheEnd;
@property (nonatomic, assign) BOOL loading;

//用来标示是否为上拉的动作
@property (nonatomic, assign) BOOL isFooterInAction;
@property (nonatomic, assign) BOOL headerOnly;

- (void)collectionViewDidScroll:(UIScrollView *)scrollView;
- (void)collectionViewEndDragging:(UIScrollView *)scrollView;
- (void)collectionViewDidFinishedLoading;
- (void)firstRefresh;

@end

NS_ASSUME_NONNULL_END
