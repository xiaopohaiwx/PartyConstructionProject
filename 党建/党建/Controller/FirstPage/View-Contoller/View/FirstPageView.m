//
//  FirstPageView.m
//  党建
//
//  Created by Mac on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "FirstPageView.h"
#define WIDTH (SCREENWIDTH - 80 - 135) / 2

@implementation FirstPageView
//封装UIImageView
- (UIImageView *)setImageViewImgName:(NSString *)imgName
{
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:imgName];
    [self addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
    }];
    return imgView;
}
//封装button
- (UIButton *)setButtonImageName:(NSString *)imgName Tag:(NSInteger)tag
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(jumpVC:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    btn.tag = tag;
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(45, 45));
    }];
    return btn;
}
//封装label
- (UILabel *)setLabelContent:(NSString *)content
{
    UILabel *label = [[UILabel alloc] init];
    label.text = content;
    label.textColor = ssRGBHex(0x7C7C7D);
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentCenter;
    label.adjustsFontSizeToFitWidth = YES;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(70, 13));
    }];
    return label;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        /* 六个button视图 */
        _imgViewBG = [self setImageViewImgName:@"bt_bg"];
        [_imgViewBG mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.height.equalTo(200);
        }];
        
        _newsBtn = [self setButtonImageName:@"newsEye_btn" Tag:1];
        [_newsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgViewBG.left).offset(40);
            make.top.equalTo(20);
        }];
        _labelNews = [self setLabelContent:@"信工新闻眼"];
        [_labelNews mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.newsBtn);
            make.top.equalTo(self.newsBtn.bottom).offset(5);
        }];
        
        _lifeBtn = [self setButtonImageName:@"life_btn" Tag:2];
        [_lifeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.newsBtn.right).offset(WIDTH);
            make.top.equalTo(20);
        }];
        
        _labelLife = [self setLabelContent:@"掌上组织生活"];
        [_labelLife mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.lifeBtn);
            make.top.equalTo(self.lifeBtn.bottom).offset(5);
        }];
        
        _interactBtn = [self setButtonImageName:@"interact_btn" Tag:3];
        [_interactBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lifeBtn.right).offset(WIDTH);
            make.top.equalTo(20);
        }];
        
        _labelIdentity = [self setLabelContent:@"党员云互动"];
        [_labelIdentity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.interactBtn);
            make.top.equalTo(self.interactBtn.bottom).offset(5);
        }];
        
        _openBtn = [self setButtonImageName:@"open_btn" Tag:4];
        [_openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgViewBG.left).offset(40);
            make.bottom.equalTo(self.imgViewBG.bottom).offset(-38);
        }];
        
        _labelOpen = [self setLabelContent:@"党建一点通"];
        [_labelOpen mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.openBtn.bottom).offset(5);
            make.centerX.equalTo(self.openBtn);
        }];
        
        _identityBtn = [self setButtonImageName:@"identity_btn" Tag:5];
        [_identityBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.openBtn.right).offset(WIDTH);
            make.bottom.equalTo(self.imgViewBG.bottom).offset(-38);
        }];
        
        _labelIdentity = [self setLabelContent:@"党员亮身份"];
        [_labelIdentity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.identityBtn);
            make.top.equalTo(self.identityBtn.bottom).offset(5);
        }];
        
        _HistoryPartyBtn = [self setButtonImageName:@"HistoryParty_btn" Tag:6];
        [_HistoryPartyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.identityBtn.right).offset(WIDTH);
            make.bottom.equalTo(self.imgViewBG.bottom).offset(-38);
        }];
        
        _labelHistoryParty = [self setLabelContent:@"党史上的今天"];
        [_labelHistoryParty mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.HistoryPartyBtn);
            make.top.equalTo(self.HistoryPartyBtn.bottom).offset(5);
        }];
        
        /* 中间图片 */
        _imgViewMiddle = [self setImageViewImgName:@"banner01"];
        [_imgViewMiddle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgViewBG.bottom).offset(0);
            make.height.equalTo(80);
        }];
        
        /* 底部视图 */
        _imgViewFoot = [self setImageViewImgName:@"special_column"];
        [_imgViewFoot mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgViewMiddle.bottom).offset(0);
            make.height.equalTo(180);
        }];
        
        _learnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_learnBtn addTarget:self action:@selector(jumpVC:) forControlEvents:UIControlEventTouchUpInside];
        _learnBtn.tag = 7;
        [self addSubview:_learnBtn];
        [_learnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgViewFoot.left).offset(SCREENWIDTH / 3);
            make.top.equalTo(self.imgViewFoot.top).equalTo(0);
            make.size.equalTo(CGSizeMake(SCREENWIDTH / 3, 90));
        }];
        
        _photographBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_photographBtn addTarget:self action:@selector(jumpVC:) forControlEvents:UIControlEventTouchUpInside];
        _photographBtn.tag = 8;
        [self addSubview:_photographBtn];
        [_photographBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.imgViewFoot.right).offset(0);
            make.top.equalTo(self.imgViewFoot.top).equalTo(0);
            make.size.equalTo(CGSizeMake(SCREENWIDTH / 3, 90));
        }];
        
        _systemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_systemBtn addTarget:self action:@selector(jumpVC:) forControlEvents:UIControlEventTouchUpInside];
        _systemBtn.tag = 9;
        [self addSubview:_systemBtn];
        [_systemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgViewFoot.left).offset(SCREENWIDTH / 3);
            make.bottom.equalTo(self.imgViewFoot.bottom).equalTo(0);
            make.size.equalTo(CGSizeMake(SCREENWIDTH / 3, 90));
        }];
        
        _featureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_featureBtn addTarget:self action:@selector(jumpVC:) forControlEvents:UIControlEventTouchUpInside];
        _featureBtn.tag = 10;
        [self addSubview:_featureBtn];
        [_featureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.imgViewFoot.right).offset(0);
            make.bottom.equalTo(self.imgViewFoot.bottom).equalTo(0);
            make.size.equalTo(CGSizeMake(SCREENWIDTH / 3, 90));
        }];
    }
    return self;
}

//按钮点击事件
- (void)jumpVC:(UIButton *)btn
{
    _block(btn.tag);
}

@end
