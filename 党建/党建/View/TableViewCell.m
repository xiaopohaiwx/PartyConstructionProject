//
//  TableViewCell.m
//  党建
//
//  Created by 邱敏 on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "TableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation TableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        /** 封面 */
        _imgView = [[UIImageView alloc] init];
//        _imgView.image = [UIImage imageNamed:@""];
        _imgView.backgroundColor = [UIColor grayColor];
        [self addSubview:_imgView];
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(12);
            make.left.equalTo(12);
            make.width.height.equalTo(80);
        }];
        
        /** 标题 */
        _titleLabel = [[UILabel alloc] init];
//        _titleLabel.text = @"信工学院举办的见到过海底大哥讲话呢--母亲节感恩教育活动";
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.numberOfLines = 2;
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(12);
            make.left.equalTo(self.imgView.right).offset(12);
            make.right.equalTo(-20);
            make.height.equalTo(40);
        }];
        
        /** 日期 */
        _dateLabel = [[UILabel alloc] init];
//        _dateLabel.text = @"2018-05-29 17:12:50";
        _dateLabel.textColor = [UIColor blackColor];
        _dateLabel.textAlignment = NSTextAlignmentLeft;
        _dateLabel.font = [UIFont systemFontOfSize:10];
        _dateLabel.numberOfLines = 2;
        [self addSubview:_dateLabel];
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-12);
            make.left.equalTo(self.imgView.right).offset(12);
            make.right.equalTo(-20);
            make.height.equalTo(10);
        }];
        
        /** 浏览次数 */
        _numberLabel = [[UILabel alloc] init];
//        _numberLabel.text = @"1234";
        _numberLabel.textColor = [UIColor blackColor];
        _numberLabel.textAlignment = NSTextAlignmentLeft;
        _numberLabel.font = [UIFont systemFontOfSize:13];
        _numberLabel.numberOfLines = 2;
        [self addSubview:_numberLabel];
        [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-12);
            make.right.equalTo(-12);
            make.width.equalTo(40);
            make.height.equalTo(12);
        }];
        
        /** 浏览图标 */
        _lookImgView = [[UIImageView alloc] init];
        _lookImgView.image = [UIImage imageNamed:@"news_eye"];
        [self addSubview:_lookImgView];
        [_lookImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-14);
            make.right.equalTo(-60);
            make.width.equalTo(10);
            make.height.equalTo(7);
        }];
        
    }
    return self;
}

-(void)getModel:(TableCellModel *)obj
{
    [_imgView sd_setImageWithURL:[NSURL URLWithString:obj.pic]];
    _titleLabel.text = obj.title;
    _dateLabel.text = obj.currentTime;
    _numberLabel.text = [NSString stringWithFormat:@"%@", obj.count];
}

@end
