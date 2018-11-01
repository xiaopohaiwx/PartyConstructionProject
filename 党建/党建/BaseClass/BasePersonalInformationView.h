//
//  BasePersonalInformationView.h
//  党建
//
//  Created by Mac on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TitleColor ssRGBHex(0x464646)
#define WireColor ssRGBHex(0xDDDDDD)
#define GETVALUE(object, key) object valueForKey:key

NS_ASSUME_NONNULL_BEGIN

@interface BasePersonalInformationView : UIView

@property (nonatomic, strong) UIImageView *imgViewHeadBG;
@property (nonatomic, strong) UIImageView *imgViewHead;
@property (nonatomic, strong) UIImageView *imgViewBG;

@end

NS_ASSUME_NONNULL_END
