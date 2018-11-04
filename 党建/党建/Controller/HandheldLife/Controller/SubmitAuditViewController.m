//
//  SubmitAuditViewController.m
//  党建
//
//  Created by 邱敏 on 2018/11/3.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "SubmitAuditViewController.h"
#import "SubmitAuditView.h"


@interface SubmitAuditViewController ()<SubmitAuditDelegate>

@property (nonatomic, strong) SubmitAuditView *subView;

@end

@implementation SubmitAuditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"思想汇报";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self getSubView];
}

-(void)getSubView
{
    _subView = [[SubmitAuditView alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT - 64)];
    _subView.delegate = self;
    [self.view addSubview:_subView];
}

#pragma mark - SubmitAuditDelegate
//添加图片
- (void)AddImg:(SubmitAuditView *)view
{
    
}
//界面跳转
- (void)jumpView:(SubmitAuditView *)View
{
    
}

@end
