//
//  HandheldLifeViewController.h
//  党建
//
//  Created by Mac on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HandheldLifeView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HandheldLifeViewController : UIViewController<HandheldLifeViewDelegate>

@property (nonatomic, strong) NSString *titleStr;
@property (nonatomic, strong) HandheldLifeView *handheldLifeView;

@end

NS_ASSUME_NONNULL_END
