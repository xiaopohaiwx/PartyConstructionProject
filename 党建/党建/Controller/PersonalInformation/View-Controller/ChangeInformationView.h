//
//  ChangeInformationView.h
//  党建
//
//  Created by Mac on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "BasePersonalInformationView.h"

NS_ASSUME_NONNULL_BEGIN
@protocol ChangeInformationViewDelegate <NSObject>

- (void)getDatePicker:(UIDatePicker *)datePicker;

@end

@interface ChangeInformationView : BasePersonalInformationView<UITextFieldDelegate>

- (instancetype)initWithFrame:(CGRect)frame ContentArr:(NSMutableArray *)contentArr;

@property (nonatomic, strong) UIButton *manBtn;
@property (nonatomic, strong) UIButton *womenBtn;
@property (nonatomic, strong) UIButton *selectBtn;
@property (nonatomic, assign) NSInteger sex;

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) NSMutableArray *fieldArr;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) NSMutableArray *labelArr;
@property (nonatomic, strong) NSMutableArray *labelTagArr;

@property (nonatomic, strong) UIDatePicker *datePicker;

@property (nonatomic, weak) id<ChangeInformationViewDelegate>delegate;

@property (nonatomic, strong) UIView *optionsView;
@property (nonatomic, assign) NSInteger partyStatus;

@end

NS_ASSUME_NONNULL_END
