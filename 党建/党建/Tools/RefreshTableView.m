//
//  NewsEyeViewController.m
//  党建
//
//  Created by 邱敏 on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "RefreshTableView.h"

#define kOffsetY 60.0f
#define kAnimationTime 0.2f

@implementation RefreshTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        //添加头视图
        CGRect rect = CGRectMake(0, -frame.size.height, frame.size.width, frame.size.height);
        _headerView = [[LoadingView alloc] initWithFrame:rect andTopIndex:YES];
        [self addSubview:_headerView];
        
        //添加尾视图
        rect = CGRectMake(0, frame.size.height, frame.size.width, frame.size.height);
        _footerView = [[LoadingView alloc] initWithFrame:rect andTopIndex:NO];
        [self addSubview:_footerView];
        
        //为当前类对象注册一个键值观察者，当对象的属性发生变化时可以做相应的调整
        [self addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}


- (void)setReachedTheEnd:(BOOL)reachedTheEnd
{
    _reachedTheEnd = reachedTheEnd;
    if (_reachedTheEnd)
    {
        _footerView.state = kRStateHitTheEnd;
    }
    else
    {
        _footerView.state = kRStateNormal;
    }
}

- (void)setHeaderOnly:(BOOL)headerOnly
{
    _headerOnly = headerOnly;
    _footerView.hidden = _headerOnly;
}

#pragma mark - Scroll methods

- (void)tableViewDidScroll:(UIScrollView *)scrollView
{
    
    if (_headerView.state == kRStateLoading || _footerView.state == kRStateLoading)
    {
        return;
    }
    
    //用来约束头视图的状态的变量
    CGPoint offset = scrollView.contentOffset;
    
    //用来约束尾视图的状态的变量用来记录底部出来的长度
    float footViewY = offset.y + scrollView.frame.size.height - scrollView.contentSize.height;
    
    if (offset.y < -60)
    {
        //header totally appeard
        _headerView.state = kRStatePulling;
    }
    else if (offset.y > -kOffsetY && offset.y < 0)
    {
        //header part appeared
        _headerView.state = kRStateNormal;
        
    }
    else if (footViewY > kOffsetY)
    {
        //footer totally appeared
        if (_footerView.state != kRStateHitTheEnd)
        {
            _footerView.state = kRStatePulling;
        }
    }
    else if (footViewY < kOffsetY && footViewY > 0)
    {
        //footer part appeared
        if (_footerView.state != kRStateHitTheEnd)
        {
            _footerView.state = kRStateNormal;
        }
    }
}

- (void)tableViewDidEndDragging:(UIScrollView *)scrollView
{
    if (_headerView.state == kRStateLoading || _footerView.state == kRStateLoading)
    {
        return;
    }
    
    if (_headerView.state == kRStatePulling)
    {
        _isFooterInAction = NO;
        _headerView.state = kRStateLoading;
        
        [UIView animateWithDuration:kAnimationTime
                         animations:^{
                             //让tableView向下滑动60的距离
                             self.contentInset = UIEdgeInsetsMake(kOffsetY, 0, 0, 0);
                         }];
        
        //去到控制器的下拉block中加载新的数据
        if (_pullDownBlock )
        {
            _pullDownBlock(self);
        }
    }
    else if (_footerView.state == kRStatePulling)
    {
        if (self.reachedTheEnd || self.headerOnly)
        {
            return;
        }
        
        _isFooterInAction = YES;
        _footerView.state = kRStateLoading;
        
        [UIView animateWithDuration:kAnimationTime
                         animations:^{
                             //让tableView向上滑动60的距离
                             self.contentInset = UIEdgeInsetsMake(0, 0, kOffsetY, 0);
                         }];
        
        //去到控制器的上拉block中加载新的数据
        if (_dragUpBlock)
        {
            _dragUpBlock(self);
        }
    }
}

//数据加载完毕后让tableView回到正常的状态，即没有了顶部和底部视图
- (void)tableViewDidFinishedLoading
{
    if (_headerView.loadingIndex)
    {
        _headerView.loadingIndex = NO;
        [_headerView setState:kRStateNormal animated:NO];
    }
    else if (_footerView.loadingIndex)
    {
        _footerView.loadingIndex = NO;
        [_footerView setState:kRStateNormal animated:NO];
    }
    
    [UIView animateWithDuration:2 * kAnimationTime
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         //让tableView回到没有偏移的状态
                         self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
                     }
                     completion:nil];
}


- (void)firstRefresh
{
    //设置tableview初始的滑动位置
    self.contentOffset = CGPointMake(0, 0);
    
    //在一定时间内改变它的滑动位置自动向上滑动一段距离
    [UIView animateWithDuration:kAnimationTime
                     animations:^{
                         self.contentOffset = CGPointMake(0, -kOffsetY - 1);
                     }
                     completion:^(BOOL bl){
                         //滑动结束之后让tableView结束滑动
                         [self tableViewDidEndDragging:self];
                     }];
}

#pragma mark -
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //加载新数据之后更新底部视图的位置
    CGRect frame = _footerView.frame;
    frame.origin.y = self.contentSize.height < self.frame.size.height ? self.frame.size.height : self.contentSize.height;
    _footerView.frame = frame;
    
    //让当前的tableView往上滑动一部分，为了能显示出来最新的一条数据
    if (_isFooterInAction && self.contentSize.height > self.frame.size.height)
    {
        CGPoint offset = self.contentOffset;
        offset.y += 44.f;
        self.contentOffset = offset;
    }
}

-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"contentSize"];
}

@end
