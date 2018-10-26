//
//  BannerView.m
//  党建
//
//  Created by Mac on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "BannerView.h"

@implementation BannerView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        //导航栏图片
        _imgView = [[UIImageView alloc] init];
        [self addSubview:_imgView];
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.height.equalTo(200);
        }];
        
        //导航栏标题背景
        _imgViewBG = [[UIImageView alloc] init];
        _imgViewBG.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        [self addSubview:_imgViewBG];
        [_imgViewBG mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(40);
        }];
        
        //导航栏标题
        _labelTitle = [[UILabel alloc] init];
        _labelTitle.textColor = [UIColor whiteColor];
        _labelTitle.font = [UIFont systemFontOfSize:15];
        _labelTitle.textAlignment = NSTextAlignmentLeft;
        _labelTitle.adjustsFontSizeToFitWidth = YES;
        [self addSubview:_labelTitle];
        [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.imgViewBG).equalTo(0);
            make.centerY.equalTo(self.imgViewBG);
            make.height.equalTo(15);
        }];
    }
    return self;
}

@end
