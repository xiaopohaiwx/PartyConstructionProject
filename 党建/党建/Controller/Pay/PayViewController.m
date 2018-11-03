//
//  PayViewController.m
//  党建
//
//  Created by apple on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "PayViewController.h"
#import "PaymentView.h"

@interface PayViewController ()

@property(nonatomic , strong) PaymentView * paymentView;

@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BGCOLOR;
    self.title = @"缴纳党费";
    
    //支付方式视图
    _paymentView = [[PaymentView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [self.view addSubview:_paymentView];
    
    
    
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
