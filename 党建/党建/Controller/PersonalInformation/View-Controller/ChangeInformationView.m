//
//  ChangeInformationView.m
//  党建
//
//  Created by Mac on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "ChangeInformationView.h"

@implementation ChangeInformationView

- (instancetype)initWithFrame:(CGRect)frame ContentArr:(nonnull NSMutableArray *)contentArr
{
    if(self = [super initWithFrame:frame])
    {
        NSString *url = [contentArr[0] valueForKey:@"header"];
        [self.imgViewHead setImageWithURL:[NSURL URLWithString:url]];
        self.imgViewHead.userInteractionEnabled = YES;
        
        NSString *username = [GETVALUE(contentArr[0], @"username")];
        NSString *idCard = [GETVALUE(contentArr[0], @"idCard")];
        NSString *hometown =[GETVALUE(contentArr[0], @"hometown")];
        NSString *address = [GETVALUE(contentArr[0], @"address")];
        NSString *nation = [GETVALUE(contentArr[0], @"nation")];
        NSString *wxNum = [GETVALUE(contentArr[0], @"wxNum")];
        NSString *qqNum = [GETVALUE(contentArr[0], @"qqNum")];
        NSString *sex = [GETVALUE(contentArr[0], @"sex")];
        NSString *education = [GETVALUE(contentArr[0], @"education")];
        NSString *jobRank = [GETVALUE(contentArr[0], @"qqNum")];
        NSString *salary = [NSString stringWithFormat:@"%@", [GETVALUE(contentArr[0], @"salary")]];
        NSString *joinPartyTime = [GETVALUE(contentArr[0], @"joinPartyTime")];
        NSString *lastPayTime = [GETVALUE(contentArr[0], @"lastPayTime")];
        NSString *partyIdentity = [GETVALUE(contentArr[0], @"partyIdentity")];
        
        NSArray *placeArr = @[username, idCard, hometown, address, nation, wxNum, qqNum, sex, education, jobRank, salary, joinPartyTime, lastPayTime, partyIdentity];
        
        for (NSInteger i = 0; i < 6; ++i)
        {
            _textField = [UITextField textFieldWithSuperView:self Content:placeArr[i] TextColor:TitleColor Tag:i TextAlignment:NSTextAlignmentRight];
            [_textField makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.imgViewHeadBG.bottom).offset(i * 51 + 18.5);
                make.right.equalTo(-10);
                make.size.equalTo(CGSizeMake(170, 15));
            }];
        }
//        _fieldName = [UITextField textFieldWithSuperView:self Content:placeArr[0] TextColor:TitleColor Tag:0 TextAlignment:NSTextAlignmentRight];
//        [_fieldName makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.imgViewHeadBG.bottom).offset(18.5);
//            make.right.equalTo(-10);
//            make.size.equalTo(CGSizeMake(170, 15));
//        }];
//
//        _fieldIDNum = [UITextField textFieldWithSuperView:self Content:placeArr[1] TextColor:TitleColor Tag:1 TextAlignment:NSTextAlignmentRight];
//        [_fieldIDNum makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.fieldName.top).offset(51);
//            make.right.equalTo(-10);
//            make.size.equalTo(CGSizeMake(170, 15));
//        }];
//
//        _fieldHome = [UITextField textFieldWithSuperView:self Content:placeArr[2] TextColor:TitleColor Tag:2 TextAlignment:NSTextAlignmentRight];
//        [_fieldHome makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.fieldIDNum.top).offset(51);
//            make.right.equalTo(-10);
//            make.size.equalTo(CGSizeMake(170, 15));
//        }];
//
//        _fieldJob = [UITextField textFieldWithSuperView:self Content:placeArr[3] TextColor:TitleColor Tag:3 TextAlignment:NSTextAlignmentRight];
//        [_fieldJob makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.fieldHome.top).offset(51);
//            make.right.equalTo(-10);
//            make.size.equalTo(CGSizeMake(170, 15));
//        }];
//
//        _fieldNational = [UITextField textFieldWithSuperView:self Content:placeArr[4] TextColor:TitleColor Tag:4 TextAlignment:NSTextAlignmentRight];
//        [_fieldNational makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.fieldJob.top).offset(51);
//            make.right.equalTo(-10);
//            make.size.equalTo(CGSizeMake(170, 15));
//        }];
//
//        _fieldWX = [UITextField textFieldWithSuperView:self Content:placeArr[5] TextColor:TitleColor Tag:5 TextAlignment:NSTextAlignmentRight];
//        [_fieldWX makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.fieldJob.top).offset(51);
//            make.right.equalTo(-10);
//            make.size.equalTo(CGSizeMake(170, 15));
//        }];
//
//        _fieldQQ = [UITextField textFieldWithSuperView:self Content:placeArr[6] TextColor:TitleColor Tag:6 TextAlignment:NSTextAlignmentRight];
//        [_fieldQQ makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.fieldWX.top).offset(51);
//            make.right.equalTo(-10);
//            make.size.equalTo(CGSizeMake(170, 15));
//        }];
        
        _manBtn = [UIButton buttonWithSuperView:self Name:@"choose_btn" SelectName:@"choose1_btn" Target:self Action:@selector(chooseBtn:) Tag:0];
        [_manBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.textField.top).offset(51);
            make.right.equalTo(-80);
            make.size.equalTo(CGSizeMake(15, 15));
        }];
        
        UILabel *labelMan = [UILabel labelWithContent:@"男" SuperView:self TextColor:TitleColor Font:[UIFont systemFontOfSize:15] TextAlignment:NSTextAlignmentCenter NumberOfLines:1];
        [labelMan makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.manBtn.right).offset(5);
            make.top.equalTo(self.textField.top).offset(48);
            make.size.equalTo(CGSizeMake(20, 20));
        }];
        
        _womenBtn = [UIButton buttonWithSuperView:self Name:@"choose_btn" SelectName:@"choose1_btn" Target:self Action:@selector(chooseBtn:) Tag:1];
        [_womenBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.textField.top).offset(51);
            make.right.equalTo(-35);
            make.size.equalTo(CGSizeMake(15, 15));
        }];
        
        UILabel *labelWomen = [UILabel labelWithContent:@"女" SuperView:self TextColor:TitleColor Font:[UIFont systemFontOfSize:15] TextAlignment:NSTextAlignmentCenter NumberOfLines:1];
        [labelWomen makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.womenBtn.right).offset(5);
            make.top.equalTo(self.textField.top).offset(48);
            make.size.equalTo(CGSizeMake(20, 20));
        }];
    }
    return self;
}

- (void)chooseBtn:(UIButton *)btn
{
    
}

@end
