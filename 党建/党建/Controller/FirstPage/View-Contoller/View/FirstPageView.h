//
//  FirstPageView.h
//  党建
//
//  Created by Mac on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface FirstPageView : UIView
/* 六个按钮背景 */
@property (nonatomic, strong) UIImageView *imgViewBG;
/* 信工新闻眼 */
@property (nonatomic, strong) UIButton *newsBtn;
@property (nonatomic, strong) UILabel *labelNews;
/* 掌上组织生活 */
@property (nonatomic, strong) UIButton *lifeBtn;
@property (nonatomic, strong) UILabel *labelLife;
/* 党员云互动 */
@property (nonatomic, strong) UIButton *interactBtn;
@property (nonatomic, strong) UILabel *labelInteract;
/* 党建一点通 */
@property (nonatomic, strong) UIButton *openBtn;
@property (nonatomic, strong) UILabel *labelOpen;
/* 党员亮身份 */
@property (nonatomic, strong) UIButton *identityBtn;
@property (nonatomic, strong) UILabel *labelIdentity;
/* 党史上的今天 */
@property (nonatomic, strong) UIButton *HistoryPartyBtn;
@property (nonatomic, strong) UILabel *labelHistoryParty;
/* 中间图片 */
@property (nonatomic, strong) UIImageView *imgViewMiddle;
/* 底部图片 */
@property (nonatomic, strong) UIImageView *imgViewFoot;
/* 随时随地学 */
@property (nonatomic, strong) UIButton *learnBtn;
/* 随时随地拍 */
@property (nonatomic, strong) UIButton *photographBtn;
/* 制度建设 */
@property (nonatomic, strong) UIButton *systemBtn;
/* 特色活动 */
@property (nonatomic, strong) UIButton *featureBtn;

typedef void(^Block)(NSInteger tag);

@property (nonatomic, copy) Block block;

@end

NS_ASSUME_NONNULL_END
