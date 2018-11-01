//
//  DemoDemoPartMemberCell.m
//  党建
//
//  Created by 邱敏 on 2018/10/30.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "DemoDemoPartMemberCell.h"
#import "UIImageView+Category.h"
#import "UIImageView+WebCache.h"

@implementation DemoDemoPartMemberCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _headImgView = [UIImageView imageViewWithName:@"" SuperView:self];
        _headImgView.backgroundColor = [UIColor redColor];
        _headImgView.layer.masksToBounds = YES;
        _headImgView.layer.cornerRadius = 15;
        [_headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.centerY);
            make.left.equalTo(10);
            make.width.equalTo(30);
            make.height.equalTo(30);
        }];
        
        _nameLabel = [UILabel labelWithContent:@"" SuperView:self TextColor:[UIColor blackColor] FontName:@"CourierNewPSMT" Font:15.0 TextAlignment:NSTextAlignmentLeft AdjustsFontSizeToFitWidth:YES];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.centerY);
            make.left.equalTo(self.headImgView.right).offset(10);
            make.width.equalTo(60);
            make.height.equalTo(15);
        }];
        
        _messageLable = [UILabel labelWithContent:@"" SuperView:self TextColor:[UIColor blackColor] FontName:@"CourierNewPSMT" Font:15.0 TextAlignment:NSTextAlignmentLeft AdjustsFontSizeToFitWidth:YES];
        [_messageLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.centerY);
            make.right.equalTo(-20);
            make.width.equalTo(200);
            make.height.equalTo(15);
        }];
    }
    return self;
}

-(void)getModel:(DemoDemoPartMemberModel *)obj
{
    [_headImgView sd_setImageWithURL:[NSURL URLWithString:obj.header] placeholderImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"" ofType:@""]]];
    
    _nameLabel.text = obj.username;
    _messageLable.text = obj.branchName;
}

@end
