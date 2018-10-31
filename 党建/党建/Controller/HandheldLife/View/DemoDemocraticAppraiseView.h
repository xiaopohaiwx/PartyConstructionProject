//
//  DemoDemocraticAppraiseView.h
//  党建
//
//  Created by 邱敏 on 2018/10/29.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTQDropdownMenu.h"

NS_ASSUME_NONNULL_BEGIN

@interface DemoDemocraticAppraiseView : UIView<YTQDropdownMenuDelegate>

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *noticeLable;
@property (nonatomic, strong) UILabel *contentLable;
@property (nonatomic, strong) YTQDropdownMenu *dropBtn;
@property (nonatomic, strong) UIButton *nextBtn;

typedef void(^jumpBlock)(UIButton *btn);
@property (nonatomic, copy) jumpBlock nextBlock;

@end

NS_ASSUME_NONNULL_END
