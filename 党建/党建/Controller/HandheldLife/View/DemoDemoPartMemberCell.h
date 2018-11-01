//
//  DemoDemoPartMemberCell.h
//  党建
//
//  Created by 邱敏 on 2018/10/30.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoDemoPartMemberModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DemoDemoPartMemberCell : UITableViewCell

/** 头像 */
@property (nonatomic, strong) UIImageView *headImgView;
/** 名字 */
@property (nonatomic, strong) UILabel *nameLabel;
/** 信息 */
@property (nonatomic, strong) UILabel *messageLable;
/** 底部下划线 */
@property (nonatomic, strong) UIImageView *lineView;

-(void)getModel:(DemoDemoPartMemberModel *)obj;

@end

NS_ASSUME_NONNULL_END
