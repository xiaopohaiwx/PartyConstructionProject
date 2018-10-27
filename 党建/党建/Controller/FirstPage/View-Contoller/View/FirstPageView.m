//
//  FirstPageView.m
//  党建
//
//  Created by Mac on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "FirstPageView.h"
#define ImageBGHeight 200
#define ImageFootBGHeight 180

@implementation FirstPageView{
    UIImageView *imgViewBG;
    UIImageView *imgViewMiddle;
    UIImageView *imgViewFoot;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        //六个按钮部分
        imgViewBG = [UIImageView imageViewWithName:@"bt_bg" SuperView:self];
        [imgViewBG makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.height.equalTo(ImageBGHeight);
        }];
        
        NSArray *btnimgArr = @[@"newsEye_btn", @"life_btn", @"interact_btn", @"open_btn", @"identity_btn", @"HistoryParty_btn"];
        NSArray *btnStr = @[@"信工新闻眼", @"掌上组织生活", @"党员云互动", @"党建一点通", @"党员亮身份", @"党史上的今天"];
        for (NSInteger i = 0; i < 6; ++i)
        {
            NSInteger row = i / 3;  //行
            NSInteger col = i % 3; //列
            UIButton *button = [UIButton buttonWithSuperView:self Tag:i + 1 Target:self Action:@selector(jumpVC:)];
            [button makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo((SCREENWIDTH / 3) * col);
                make.top.equalTo((ImageBGHeight / 2) * row);
                make.size.equalTo(CGSizeMake(SCREENWIDTH / 3, ImageBGHeight / 2));
            }];
            
            UIImageView *imgView = [UIImageView imageViewWithName:btnimgArr[i] SuperView:self];
            [imgView makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(button);
                make.top.equalTo(button.top).offset(15);
                make.size.equalTo(CGSizeMake(SCREENWIDTH / 3 - 75, SCREENWIDTH / 3 - 75));
            }];
            
            UILabel *label = [UILabel labelWithContent:btnStr[i] SuperView:self TextColor:ssRGBHex(0x7C7C7D) Font:[UIFont systemFontOfSize:13] TextAlignment:NSTextAlignmentCenter AdjustsFontSizeToFitWidth:YES];
            [label makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(button.left).offset(0);
                make.top.equalTo(imgView.bottom).offset(7);
                make.size.equalTo(CGSizeMake(SCREENWIDTH / 3, 13));
            }];
        }
        
        /* 中间图片 */
        imgViewMiddle = [UIImageView imageViewWithName:@"banner01" SuperView:self];
        [imgViewMiddle makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->imgViewBG.bottom).offset(0);
            make.height.equalTo(80);
            make.left.right.equalTo(0);
        }];
        
        /* 底部视图 */
        imgViewFoot = [UIImageView imageViewWithName:@"special_column" SuperView:self];
        [imgViewFoot makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->imgViewMiddle.bottom).offset(0);
            make.left.right.equalTo(0);
            make.height.equalTo(180);
        }];
        
        for (NSInteger i = 0; i < 4; ++i)
        {
            NSInteger row = i / 2; //行
            NSInteger col = i % 2; //列
            UIButton *button = [UIButton buttonWithSuperView:self Tag:i + 7 Target:self Action:@selector(jumpVC:)];
            [button makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self->imgViewFoot.left).offset((SCREENWIDTH / 3) * (col + 1));
                make.top.equalTo(self->imgViewFoot.top).offset((ImageFootBGHeight / 2) * row);
                make.size.equalTo(CGSizeMake(SCREENWIDTH / 3, ImageFootBGHeight / 2));
            }];
        }
    }
    return self;
}

//按钮点击事件
- (void)jumpVC:(UIButton *)btn
{
    if(_delegate)
    {
        [_delegate itemDidSelect:btn.tag];
    }
}

@end
