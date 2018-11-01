//
//  PersonalIntegralView.h
//  党建
//
//  Created by 邱敏 on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonalIntegralView : UIView
/** 头部红色背景 */
@property (nonatomic, strong) UIImageView *bgTopImgView;
/** 积分值 */
@property (nonatomic, strong) UILabel *integralLable;
/** 积分明细 */
@property (nonatomic, strong) UIImageView *bgDataImgView;
@property (nonatomic, strong) UIImageView *leftImgView;
@property (nonatomic, strong) UILabel *dataLabel;
@property (nonatomic, strong) UIImageView *rightImgView;
typedef void(^jumpBlock)(UIImageView *img);
@property (nonatomic, copy) jumpBlock jumpBlock;
/** 积分规则 */
@property (nonatomic, strong) UIImageView *bgRuleImgView;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIImageView *iconImgView;
/** 具体内容 */
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *numLabel;
/** 传一个接口数组 */
-(id)initWithFrame:(CGRect)frame WithTypeArr:(NSArray *)typeArr NumArr:(NSArray *)numArr;
@end

NS_ASSUME_NONNULL_END
