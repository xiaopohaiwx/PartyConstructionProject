//
//  PersonalIntegralView.m
//  党建
//
//  Created by 邱敏 on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "PersonalIntegralView.h"

@implementation PersonalIntegralView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        /*----红色积分值------*/
        _bgTopImgView = [UIImageView imageViewWithName:@"integral_bg" SuperView:self];
        [_bgTopImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.left.right.equalTo(0);
            make.height.equalTo(140);
        }];
        
        _integralLable = [UILabel labelWithContent:@"00.0" SuperView:self.bgTopImgView TextColor:[UIColor whiteColor] Font:[UIFont systemFontOfSize:15.0] TextAlignment:NSTextAlignmentCenter AdjustsFontSizeToFitWidth:YES];
        [_integralLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.centerX);
            make.centerY.equalTo(self.bgTopImgView.centerY);
            make.width.equalTo(64);
            make.height.equalTo(15);
        }];
        /*---积分明细----*/
        _bgDataImgView = [UIImageView imageViewWithSuperView:self BGColor:[UIColor whiteColor]];
        _bgDataImgView.userInteractionEnabled = YES;//交互
        [_bgDataImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgTopImgView.bottom).offset(2);
            make.left.equalTo(2);
            make.right.equalTo(-2);
            make.height.equalTo(48);
        }];
        
        _leftImgView = [UIImageView imageViewWithName:@"integral" SuperView:self.bgDataImgView];
        [_leftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.bgDataImgView.centerY);
            make.left.equalTo(16);
            make.width.equalTo(30);
            make.height.equalTo(30);
        }];
        
        _dataLabel = [UILabel labelWithContent:@"积分明细" SuperView:self.bgDataImgView TextColor:ssRGBHex(0x7F7F7F) Font:[UIFont systemFontOfSize:18.0] TextAlignment:NSTextAlignmentLeft NumberOfLines:YES];
        [_dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.bgDataImgView.centerY);
            make.left.equalTo(self.leftImgView.right).offset(18);
            make.width.equalTo(100);
            make.height.equalTo(18);
        }];
        
        _rightImgView = [UIImageView imageViewWithName:@"jiantou" SuperView:self.bgDataImgView];
        [_rightImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.bgDataImgView.centerY);
            make.right.equalTo(-16);
            make.width.equalTo(8);
            make.height.equalTo(13);
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTap)];
        [self.bgDataImgView addGestureRecognizer:tap];
        
        /*------积分规则------*/
        _bgRuleImgView = [UIImageView imageViewWithSuperView:self BGColor:ssRGBHex(0xeeeeee)];
        [_bgRuleImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgTopImgView.bottom).offset(52);
            make.left.equalTo(2);
            make.right.equalTo(-2);
            make.height.equalTo(32);
        }];
        
        _titleLable = [UILabel labelWithContent:@"积分规则" SuperView:self.bgRuleImgView TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:15.0] TextAlignment:NSTextAlignmentLeft NumberOfLines:YES];
        [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.bgRuleImgView.centerY);
            make.left.equalTo(16);
            make.width.equalTo(100);
            make.height.equalTo(18);
        }];
        
        _iconImgView = [UIImageView imageViewWithName:@"question" SuperView:self.bgRuleImgView];
        [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.bgRuleImgView.centerY);
            make.right.equalTo(-16);
            make.width.equalTo(18);
            make.height.equalTo(18);
        }];
        
        
        
        
    }
    return self;
}

-(void)clickTap
{
    if (_jumpBlock)
    {
        _jumpBlock(_bgDataImgView);
    }
}

-(void)Frame:(CGRect)frame WithTypeArr:(NSArray *)typeArr NumArr:(NSArray *)numArr
{
    /*-----规则内容(登录App....)-----*/
    for (int i = 0; i < [typeArr count]; i++)
    {
        _bgRuleImgView = [UIImageView imageViewWithSuperView:self BGColor:[UIColor whiteColor]];
        [_bgRuleImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgDataImgView.bottom).offset(36 + 34 * i);
            make.left.equalTo(2);
            make.right.equalTo(-2);
            make.height.equalTo(32);
        }];
        
        _contentLabel = [UILabel labelWithContent:typeArr[i] SuperView:self.bgRuleImgView TextColor:ssRGBHex(0x7F7F7F) Font:[UIFont systemFontOfSize:15.0] TextAlignment:NSTextAlignmentLeft NumberOfLines:YES];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.bgRuleImgView.centerY);
            make.left.equalTo(16);
            make.width.equalTo(SCREENWIDTH - 60);
            make.height.equalTo(18);
        }];
        
        _numLabel = [UILabel labelWithContent:numArr[i] SuperView:self.bgRuleImgView TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:15.0] TextAlignment:NSTextAlignmentRight NumberOfLines:YES];
        [_numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.bgRuleImgView.centerY);
            make.right.equalTo(-16);
            make.width.equalTo(20);
            make.height.equalTo(18);
        }];
    }
}

@end
