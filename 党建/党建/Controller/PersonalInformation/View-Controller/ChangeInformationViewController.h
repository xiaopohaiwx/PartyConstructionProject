//
//  ChangeInformationViewController.h
//  党建
//
//  Created by Mac on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeInformationView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChangeInformationViewController : UIViewController

@property (nonatomic, strong) UIButton *navBtn;
//给人信息页面传过来的modelArr
@property (nonatomic, strong) NSMutableArray *modelMutArr;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) ChangeInformationView *changeInformationView;

@end

NS_ASSUME_NONNULL_END
