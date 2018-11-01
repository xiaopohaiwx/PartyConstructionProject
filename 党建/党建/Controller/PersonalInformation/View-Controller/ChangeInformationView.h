//
//  ChangeInformationView.h
//  党建
//
//  Created by Mac on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "BasePersonalInformationView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChangeInformationView : BasePersonalInformationView<UITextFieldDelegate>

- (instancetype)initWithFrame:(CGRect)frame ContentArr:(NSMutableArray *)contentArr;

@property (nonatomic, strong) UITextField *fieldName;
@property (nonatomic, strong) UITextField *fieldIDNum;
@property (nonatomic, strong) UITextField *fieldHome;
@property (nonatomic, strong) UITextField *fieldJob;
@property (nonatomic, strong) UITextField *fieldNational;
@property (nonatomic, strong) UITextField *fieldWX;
@property (nonatomic, strong) UITextField *fieldQQ;
@property (nonatomic, strong) UITextField *fieldEducation;
@property (nonatomic, strong) UITextField *fieldTitle;
@property (nonatomic, strong) UITextField *fieldSalary;
@property (nonatomic, strong) UITextField *fieldJoinTime;
@property (nonatomic, strong) UITextField *fieldTime;
@property (nonatomic, strong) UITextField *fieldIdentity;
@property (nonatomic, strong) UIButton *manBtn;
@property (nonatomic, strong) UIButton *womenBtn;


@property (nonatomic, strong) UITextField *textField;

@end

NS_ASSUME_NONNULL_END
