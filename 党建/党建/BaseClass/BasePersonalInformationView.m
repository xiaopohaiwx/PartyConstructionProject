//
//  BasePersonalInformationView.m
//  党建
//
//  Created by Mac on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "BasePersonalInformationView.h"

@implementation BasePersonalInformationView{
    UIImageView *imgViewWire;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        _imgViewHeadBG = [UIImageView imageViewWithSuperView:self BGColor:[UIColor whiteColor]];
        [_imgViewHeadBG makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.height.equalTo(50);
        }];
        
        UILabel *labelHead = [UILabel labelWithContent:@"头像" SuperView:self TextColor:TitleColor Font:[UIFont systemFontOfSize:15] TextAlignment:NSTextAlignmentLeft NumberOfLines:1];
        [labelHead makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.imgViewHeadBG);
            make.left.equalTo(self.imgViewHeadBG.left).offset(10);
            make.size.equalTo(CGSizeMake(160, 15));
        }];
        
        _imgViewHead = [UIImageView imageViewWithName:@"banner1" SuperView:self];
        [_imgViewHead makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.imgViewHeadBG);
            make.right.equalTo(self.imgViewHeadBG.right).offset(-10);
            make.size.equalTo(CGSizeMake(50, 27));
        }];
        
        imgViewWire = [UIImageView imageViewWithSuperView:self BGColor:WireColor];
        [imgViewWire makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(self.imgViewHeadBG.bottom).offset(0);
            make.height.equalTo(1);
        }];
        
         NSArray *titleArr1 = @[@"姓名", @"身份证", @"家庭住址", @"工作地址", @"民族", @"微信号", @"QQ号", @"性别", @"最高学历", @"职称", @"薪资水平", @"入党时间", @"党费最后缴纳时间", @"当前身份"];
        
        for (NSInteger i = 0; i < 14; ++i)
        {
            _imgViewBG = [UIImageView imageViewWithSuperView:self BGColor:[UIColor whiteColor]];
            [_imgViewBG makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(0);
                make.top.equalTo(self->imgViewWire.bottom).offset(i * 51);
                make.height.equalTo(50);
            }];
            
            UILabel *labelTitle = [UILabel labelWithContent:titleArr1[i] SuperView:self TextColor:TitleColor Font:[UIFont systemFontOfSize:15] TextAlignment:NSTextAlignmentLeft NumberOfLines:1];
            [labelTitle makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.imgViewBG);
                make.left.equalTo(self.imgViewBG.left).offset(10);
                make.size.equalTo(CGSizeMake(160, 15));
            }];
            
            UIImageView *imgViewLine = [UIImageView imageViewWithSuperView:self BGColor:WireColor];
            [imgViewLine makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(0);
                make.top.equalTo(self.imgViewBG.bottom).offset(0);
                make.height.equalTo(1);
            }];
        }
    }
    return self;
}

@end
