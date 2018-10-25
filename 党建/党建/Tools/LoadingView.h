//
//  NewsEyeViewController.m
//  党建
//
//  Created by 邱敏 on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    kRStateNormal,
    kRStatePulling,
    kRStateLoading,
    kRStateHitTheEnd
} State;

@interface LoadingView : UIView

@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@property (nonatomic, strong) CALayer *arrowLayer;
@property (nonatomic, assign) BOOL loadingIndex;
@property (nonatomic, assign) BOOL topIndex;
@property (nonatomic) State state;

- (id)initWithFrame:(CGRect)frame andTopIndex:(BOOL)top;
- (void)setState:(State)state animated:(BOOL)animated;

@end
