//
//  InformProjectNewsEye.m
//  党建
//
//  Created by 邱敏 on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "InformProjectNewsEye.h"
#import "RefreshTableView.h"

@interface InformProjectNewsEye ()

@property (nonatomic, strong) RefreshTableView *aTableView;

@end

@implementation InformProjectNewsEye

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"信工新闻眼";
    
    // Do any additional setup after loading the view.
}

-(RefreshTableView *)aTableView
{
    if(!_aTableView)
    {
        _aTableView = [[RefreshTableView alloc] init];
        
    }
    return _aTableView;
}

@end
