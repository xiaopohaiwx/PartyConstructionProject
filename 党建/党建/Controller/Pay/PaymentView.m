//
//  PaymentView.m
//  党建
//
//  Created by apple on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "PaymentView.h"

@implementation PaymentView

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        //标题
        _titleLab = [UILabel labelWithContent:@"请选择支付方式" SuperView:self TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:18.0] TextAlignment:NSTextAlignmentLeft NumberOfLines:1];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(SCREENWIDTH, 40));
            make.top.equalTo(10);
            make.left.equalTo(20);
        }];
        //线
        UIImageView * lineImg = [UIImageView imageViewWithName:@"line" SuperView:self];
        [lineImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(SCREENWIDTH, 0.5));
            make.top.equalTo(self.titleLab.bottom).offset(10);
            make.left.equalTo(0);
        }];
        //支付方式
        NSArray * arr = [NSArray arrayWithObjects:@"微信",@"支付宝", nil];
        
        for (int i = 0; i < 2; i++)
        {
            //图
            UIImageView * WXImg = [UIImageView imageViewWithName:@"WeChat_icon" SuperView:self];
            [WXImg mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.equalTo(CGSizeMake(50, 50));
                make.top.equalTo(lineImg.bottom).offset(10+i*70);
                make.left.equalTo(20);
            }];
            //线
            UIImageView * lineImg2 = [UIImageView imageViewWithName:@"line" SuperView:self];
            [lineImg2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.equalTo(CGSizeMake(SCREENWIDTH, 0.5));
                make.top.equalTo(WXImg.bottom).offset(10);
                make.left.equalTo(0);
            }];
            //名字
            UILabel * nameLab = [UILabel labelWithContent:arr[i] SuperView:self TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:16.0] TextAlignment:NSTextAlignmentLeft NumberOfLines:1];
            [nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.equalTo(CGSizeMake(100, 40));
                make.centerY.equalTo(WXImg.centerY);
                make.left.equalTo(WXImg.right).offset(10);
            }];
            //箭头
            _right = [UIButton buttonWithName:@"jiantou" SuperView:self Tag:i Target:self Action:@selector(right:)];
            [_right mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.equalTo(CGSizeMake(12,20));
                make.centerY.equalTo(WXImg.centerY);
                make.right.equalTo(-20);
            }];
        }
    }
    return self;
}

//点击箭头
- (void)right:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
            NSLog(@"0");
            break;
        case 1:
            NSLog(@"1");
            break;
        default:
            break;
    }
}


@end
