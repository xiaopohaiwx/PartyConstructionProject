//
//  PictureCollectionViewCell.m
//  党建
//
//  Created by apple on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "PictureCollectionViewCell.h"

@implementation PictureCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 15,IMGWHIDTH, IMGWHIDTH-40)];
        [self addSubview:_imgView];
        
        _titleLab =[[UILabel alloc] init];
        [self addSubview:_titleLab];
        _titleLab.textColor = [UIColor grayColor];
        _titleLab.font = [UIFont systemFontOfSize:14.0];
        _titleLab.numberOfLines = 2;
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make){
            make.size.equalTo(CGSizeMake(IMGWHIDTH, 35));
            make.left.equalTo(self.imgView.left).offset(0);
            make.top.equalTo(self.imgView.bottom).offset(0);
        }];
    }
    return self;
}

@end
