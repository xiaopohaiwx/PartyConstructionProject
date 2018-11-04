//
//  SubmitAuditView.h
//  党建
//
//  Created by 邱敏 on 2018/11/3.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 设置代理
@class SubmitAuditView;

@protocol SubmitAuditDelegate <NSObject>

//添加图片
-(void)AddImg:(SubmitAuditView *)view;

//跳转控制器
-(void)jumpView:(SubmitAuditView *)View;

@end


@interface SubmitAuditView : UIView

/** 添加图片 */
@property (nonatomic, strong) UIButton *AddBtn;
/** 提交 */
@property (nonatomic, strong) UIButton *subBtn;

@property (nonatomic, weak) id<SubmitAuditDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
