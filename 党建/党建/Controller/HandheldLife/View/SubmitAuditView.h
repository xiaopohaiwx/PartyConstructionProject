//
//  SubmitAuditView.h
//  党建
//
//  Created by 邱敏 on 2018/11/3.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SubmitAuditView : UIView

/** 提交 */
@property (nonatomic, strong) UIButton *subBtn;

typedef void(^jumpBlock)(UIButton *btn);
@property (nonatomic, copy) jumpBlock block;

@end

NS_ASSUME_NONNULL_END
