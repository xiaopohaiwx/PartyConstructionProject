//
//  SubmitAuditView.m
//  党建
//
//  Created by 邱敏 on 2018/11/3.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "SubmitAuditView.h"

@implementation SubmitAuditView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        _AddBtn = [UIButton buttonWithName:@"AddPhoto" SuperView:self Tag:1111 Target:self Action:@selector(clickBtn:)];
        [_AddBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10);
            make.left.equalTo(10);
            make.width.equalTo(80);
            make.height.equalTo(80);
        }];
        
        _subBtn = [UIButton buttonWithText:@"提交审核" TextColor:[UIColor whiteColor] TextSize:12 SuperView:self Tag:2222 Target:self Action:@selector(clickBtn:)];
        _subBtn.backgroundColor = ssRGBHex(0xC51506);
        _subBtn.layer.masksToBounds = YES;
        _subBtn.layer.cornerRadius = 5;
        [_subBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-60);
            make.centerX.equalTo(self.centerX);
            make.height.equalTo(38);
            make.width.equalTo(210);
        }];
        
    }
    return self;
}

-(void)clickBtn:(UIButton *)btn
{
    if (btn.tag == 1111)
    {
        [_delegate AddImg:self];
    }
    else
    {
        [_delegate jumpView:self];
    }
}

@end
