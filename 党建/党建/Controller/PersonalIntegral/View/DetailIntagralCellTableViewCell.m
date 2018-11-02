//
//  PersonalDetailIntagralCellTableViewCell.m
//  党建
//
//  Created by 邱敏 on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "DetailIntagralCellTableViewCell.h"

@implementation DetailIntagralCellTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _titleLabel = [UILabel labelWithContent:@"积分明细" SuperView:self TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:18.0] TextAlignment:NSTextAlignmentLeft NumberOfLines:YES];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15);
            make.left.equalTo(15);
            make.width.equalTo(200);
            make.height.equalTo(18);
        }];
        
        _timeLabel = [UILabel labelWithContent:@"2012-10-22 22:10:38" SuperView:self TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:12.0] TextAlignment:NSTextAlignmentLeft NumberOfLines:YES];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.bottom).offset(-15);
            make.left.equalTo(15);
            make.width.equalTo(200);
            make.height.equalTo(18);
        }];
        
        _integralLabel = [UILabel labelWithContent:@"+0.1" SuperView:self TextColor:[UIColor redColor] Font:[UIFont systemFontOfSize:15.0] TextAlignment:NSTextAlignmentRight NumberOfLines:YES];
        [_integralLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15);
            make.right.equalTo(-15);
            make.width.equalTo(50);
            make.height.equalTo(15);
        }];
        
        _line = [UIImageView imageViewWithName:@"line.jpg" SuperView:self];
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(0);
            make.right.left.equalTo(0);
            make.height.equalTo(2);
        }];
    }
    return self;
}

-(void)getModel:(DateIntagralModel *)obj
{
    _titleLabel.text = obj.typeName;
    _timeLabel.text = obj.timeFormat;
    _integralLabel.text = [NSString stringWithFormat:@"+%@", obj.singleDesc];
}

@end
