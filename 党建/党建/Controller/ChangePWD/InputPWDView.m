//
//  InputPWDView.m
//  党建
//
//  Created by apple on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "InputPWDView.h"

@implementation InputPWDView

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        _titleLab = [UILabel labelWithContent:@"" SuperView:self TextColor:[UIColor grayColor] Font:[UIFont systemFontOfSize:18.0] TextAlignment:NSTextAlignmentLeft NumberOfLines:1];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(SCREENWIDTH-40, 30));
            make.top.equalTo(0);
            make.left.equalTo(0);
        }];
        
        _textFile = [[UITextField alloc] init];
        [self addSubview:_textFile];
        _textFile.font = [UIFont systemFontOfSize:18.0];
        _textFile.layer.borderColor = [UIColor grayColor].CGColor;
        _textFile.layer.borderWidth = 1.0;
        _textFile.layer.cornerRadius = 5.0;
        _textFile.layer.masksToBounds = YES;
        [_textFile mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(SCREENWIDTH-60, 40));
            make.top.equalTo(self.titleLab.bottom).offset(5);
            make.left.equalTo(0);
        }];
        
    }
    return self;
}

@end
