//
//  DemoDemocraticAppraiseViewController.m
//  党建
//
//  Created by 邱敏 on 2018/10/29.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "DemoDemocraticAppraiseViewController.h"
#import "DemoDemocraticAppraiseView.h"
#import "DemoDemoPartyMemberViewController.h"

@interface DemoDemocraticAppraiseViewController ()<YTQDropdownMenuDelegate>

@property (nonatomic, strong) DemoDemocraticAppraiseView *demoView;

@end

@implementation DemoDemocraticAppraiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"民主评议";
    
    [self getDemoView];
}

-(void)getDemoView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT)];
    scrollView.contentSize = CGSizeMake(SCREENWIDTH, 700);
    [self.view addSubview:scrollView];
    
    _demoView = [[DemoDemocraticAppraiseView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 640)];
    __weak typeof(self) weakSelf = self;
    _demoView.nextBlock = ^(UIButton * _Nonnull btn) {
        //参评党员页面
        DemoDemoPartyMemberViewController *demo = [[DemoDemoPartyMemberViewController alloc] init];
        demo.type = weakSelf.demoView.nextBtn.tag - 1;
        [weakSelf.navigationController pushViewController:demo animated:YES];
    };
    [scrollView addSubview:_demoView];
    
    
}


@end
