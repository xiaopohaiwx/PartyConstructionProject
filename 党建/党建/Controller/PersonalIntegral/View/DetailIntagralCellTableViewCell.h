//
//  PersonalDetailIntagralCellTableViewCell.h
//  党建
//
//  Created by 邱敏 on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateIntagralModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailIntagralCellTableViewCell : UITableViewCell

/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;
/** +0.1 */
@property (nonatomic, strong) UILabel *integralLabel;
/** 时间 */
@property (nonatomic, strong) UILabel *timeLabel;
/** 底部下划线 */
@property (nonatomic, strong) UIImageView *line;

-(void)getModel:(DateIntagralModel *)obj;

@end

NS_ASSUME_NONNULL_END
