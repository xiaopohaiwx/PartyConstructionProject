//
//  NewsEyeViewController.m
//  党建
//
//  Created by 邱敏 on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "LoadingView.h"

@implementation LoadingView

- (id)initWithFrame:(CGRect)frame andTopIndex:(BOOL)top
{
    if (self = [super initWithFrame:frame])
    {
        _topIndex = top;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor whiteColor];
        
        int orginY = 0;
        id image = nil;
        if (_topIndex)
        {
            orginY = frame.size.height - 40;
            image = (id)[UIImage imageNamed:@"arrow"].CGImage;
        }
        else
        {
            orginY = 20;
            image = (id)[UIImage imageNamed:@"arrowDown"].CGImage;
        }
        
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, orginY, frame.size.width, 20)];
        _contentLabel.font = [UIFont systemFontOfSize:14.f];
        _contentLabel.textColor = [UIColor grayColor];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.backgroundColor = [UIColor clearColor];
        _contentLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _contentLabel.text = @"加载新数据";
        [self addSubview:_contentLabel];
        
        _arrowLayer = [CALayer layer];
        _arrowLayer.frame = CGRectMake(frame.size.width / 2 - 70, orginY, 20, 20);
        _arrowLayer.contentsGravity = kCAGravityResizeAspect;
        _arrowLayer.contents = image;
        [self.layer addSublayer:_arrowLayer];
        
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityView.center = _arrowLayer.position;
        [self addSubview:_activityView];
        
    }
    return self;
}


- (void)setState:(State)state
{
    [self setState:state animated:YES];
}

- (void)setState:(State)state animated:(BOOL)animated
{
    float duration = animated ? 0.2f : 0.f;
    
    if (_state != state)
    {
        _state = state;
        if (_state == kRStateLoading)
        {
            //Loading
            _arrowLayer.hidden = YES;
            _activityView.hidden = NO;
            [_activityView startAnimating];
            
            _loadingIndex = YES;
            _contentLabel.text = @"加载中...";
            
        }
        else if (_state == kRStatePulling && !_loadingIndex)
        {
            //Scrolling
            _arrowLayer.hidden = NO;
            _activityView.hidden = YES;
            [_activityView stopAnimating];
            
            [CATransaction begin];
            [CATransaction setAnimationDuration:duration];
            _arrowLayer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
            [CATransaction commit];
            
            _contentLabel.text = @"释放加载";
        }
        else if (_state == kRStateNormal && !_loadingIndex)
        {
            //Reset
            _arrowLayer.hidden = NO;
            _activityView.hidden = YES;
            [_activityView stopAnimating];
            
            [CATransaction begin];
            [CATransaction setAnimationDuration:duration];
            _arrowLayer.transform = CATransform3DIdentity;
            [CATransaction commit];
            
            _contentLabel.text = @"加载新数据";
        }
        else if(_state == kRStateHitTheEnd)
        {
            if (!self.topIndex)
            {
                //footer
                _arrowLayer.hidden = YES;
                _contentLabel.text = @"数据加载完毕";
            }
        }
    }
}

@end
