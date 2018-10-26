//
//  TableViewCell.h
//  党建
//
//  Created by 邱敏 on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
/** 封面 */
@property (nonatomic, strong) UIImageView *imgView;
/** 题目 */
@property (nonatomic, strong) UILabel *titleLabel;
/** 日期 */
@property (nonatomic, strong) UILabel *dateLabel;
/** 浏览图标 */
@property (nonatomic, strong) UIImageView *lookImgView;
/** 浏览人数 */
@property (nonatomic, strong) UILabel *numberLabel;

-(void)getModel:(TableCellModel *)obj;

@end

NS_ASSUME_NONNULL_END
