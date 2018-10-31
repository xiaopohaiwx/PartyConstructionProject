//
//  MineView.m
//  党建
//
//  Created by Mac on 2018/10/29.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "MineView.h"

@implementation MineView{
    UIImageView *imgViewBG;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        imgViewBG = [UIImageView imageViewWithSuperView:self BGColor:NavigationColor];
        [imgViewBG makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.height.equalTo(150);
        }];
        
        UIImageView *imgViewHead = [[UIImageView alloc] init];
        imgViewHead.layer.masksToBounds = YES;
        imgViewHead.layer.cornerRadius = 40;
        [self addSubview:imgViewHead];
        [imgViewHead makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self->imgViewBG);
            make.top.equalTo(self->imgViewBG.top).offset(30);
            make.size.equalTo(CGSizeMake(80, 80));
        }];
        
        UIButton *button = [UIButton buttonWithSuperView:self TitleFont:13 Tag:0 Target:self Action:@selector(MineBtn:)];
        [button makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self->imgViewBG);
            make.top.equalTo(imgViewHead.bottom).offset(5);
            make.size.equalTo(CGSizeMake(150, 13));
        }];
        
        if([[USERDEFAULT(@"login")] isEqualToString:@"YES"])
        {
            
        }
        else
        {
            imgViewHead.image = [UIImage imageNamed:@"my_head"];
            [button setTitle:@"您还没有登录，请登录" forState:UIControlStateNormal];
        }
        
        NSArray *imgArr = @[@"information", @"integral", @"update_pwd", @"icon3"];
        NSArray *contentArr = @[@"个人信息", @"个人量化积分", @"修改密码", @"党费缴纳"];
        
        for(NSInteger i = 0; i < 4; ++i)
        {
            UIButton *columnBtn = [UIButton buttonWithSuperView:self Tag:i + 1 Target:self Action:@selector(MineBtn:)];
            [columnBtn makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(0);
                make.top.equalTo(self->imgViewBG.bottom).offset(i * 61);
                make.height.equalTo(60);
            }];
            
            UIImageView *imgView = [UIImageView imageViewWithName:imgArr[i] SuperView:self];
            [imgView makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(columnBtn.left).offset(10);
                make.centerY.equalTo(columnBtn);
                make.size.equalTo(CGSizeMake(35, 35));
            }];
            
            UILabel *label = [UILabel labelWithContent:contentArr[i] SuperView:self TextColor:ssRGBHex(0x666666) Font:[UIFont systemFontOfSize:17] TextAlignment:NSTextAlignmentLeft NumberOfLines:1];
            [label makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(imgView.right).offset(10);
                make.centerY.equalTo(columnBtn);
                make.size.equalTo(CGSizeMake(150, 15));
            }];
            
            UIImageView *imgViewArrow = [UIImageView imageViewWithName:@"jiantou" SuperView:self];
            [imgViewArrow makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(columnBtn.right).offset(-10);
                make.centerY.equalTo(columnBtn);
                make.size.equalTo(CGSizeMake(10, 15));
            }];
            
            UIImageView *imgViewWire = [UIImageView imageViewWithSuperView:self BGColor:ssRGBHex(0xDDDDDD)];
            [imgViewWire makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(0);
                make.top.equalTo(columnBtn.bottom).offset(0);
                make.height.equalTo(1);
            }];
        }
    }
    return self;
}

- (void)MineBtn:(UIButton *)btn
{
    NSLog(@"%ld", btn.tag);
    if(_delegate)
    {
        [_delegate DidSelectItem:btn.tag];
    }
}

@end
