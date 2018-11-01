//
//  PersonalInformationView.m
//  党建
//
//  Created by Mac on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "PersonalInformationView.h"

@implementation PersonalInformationView{
    UIImageView *imgViewHeadBG;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        imgViewHeadBG = [UIImageView imageViewWithSuperView:self BGColor:[UIColor whiteColor]];
        [imgViewHeadBG makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.height.equalTo(50);
        }];
        
        UILabel *labelHead = [UILabel labelWithContent:@"头像" SuperView:self TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:13] TextAlignment:NSTextAlignmentLeft NumberOfLines:1];
        [labelHead makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self->imgViewHeadBG);
            make.left.equalTo(self->imgViewHeadBG.left).offset(10);
            make.size.equalTo(CGSizeMake(160, 13));
        }];
        
        _imgViewHead = [UIImageView imageViewWithName:@"placeholderImage" SuperView:self];
        [_imgViewHead makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self->imgViewHeadBG);
            make.right.equalTo(self->imgViewHeadBG.right).offset(-10);
            make.size.equalTo(CGSizeMake(40, 30));
        }];
    }
    return self;
}

@end
