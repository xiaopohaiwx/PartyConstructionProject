//
//  LoginView.h
//  党建
//
//  Created by Mac on 2018/10/29.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol LoginVeiwDelegate <NSObject>

- (void)DidSelectLoginBtn;

@end

@interface LoginView : UIView

@property (nonatomic, strong) UITextField *fieldIDNum;
@property (nonatomic, strong) UITextField *fieldPassWord;
@property (nonatomic, weak) id<LoginVeiwDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
