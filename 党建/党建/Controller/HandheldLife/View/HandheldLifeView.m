//
//  HandheldLifeView.m
//  党建
//
//  Created by Mac on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "HandheldLifeView.h"

@implementation HandheldLifeView{
    UIImageView *imgView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        imgView = [UIImageView imageViewWithName:@"banner1" SuperView:self];
        [imgView makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(0);
            make.height.equalTo(200);
        }];
        NSArray *imgArr = @[@"icon1", @"icon2", @"icon3", @"icon4", @"icon5"];
        NSArray *contentArr = @[@"政治学习", @"思想汇报", @"心得总结", @"民主评选", @"流动党员找组织"];
        for (NSInteger i = 0; i < 5; ++i)
        {
            NSInteger row = i / 3; //行
            NSInteger col = i % 3; //列
            UIButton *button = [UIButton buttonWithSuperView:self Tag:i + 1 Target:self Action:@selector(jumpVC:)];
            [button makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo((SCREENWIDTH / 3) * col);
                make.top.equalTo(self->imgView.bottom).offset(137 * row);
                make.size.equalTo(CGSizeMake(SCREENWIDTH / 3, 137));
            }];
            
            UIImageView *imageView = [UIImageView imageViewWithName:imgArr[i] SuperView:self];
            [imageView makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(button);
                make.top.equalTo(button.top).offset(20);
                make.size.equalTo(CGSizeMake(80, 80));
            }];
            
            UILabel *label = [UILabel labelWithContent:contentArr[i] SuperView:self TextColor:ssRGBHex(0x7C7C7D) Font:[UIFont systemFontOfSize:13] TextAlignment:NSTextAlignmentCenter NumberOfLines:2];
            [label makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(button);
                make.top.equalTo(imageView.bottom).offset(0);
                make.size.equalTo(CGSizeMake(92, 40));
            }];
        }
    }
    return self;
}

//点击事件
- (void)jumpVC:(UIButton *)btn
{
    if(_delegate)
    {
        [_delegate itemDidSelect:btn.tag];
    }
}

@end
