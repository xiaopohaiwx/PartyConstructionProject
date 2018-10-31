//
//  MineView.h
//  党建
//
//  Created by Mac on 2018/10/29.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MineViewDelegate <NSObject>

- (void)DidSelectItem:(NSInteger)tag;

@end

@interface MineView : UIView

@property (nonatomic, weak) id<MineViewDelegate>delegate;

@property (nonatomic, strong) UIImageView *imgViewHead;
@property (nonatomic, strong) UIButton *button;

@end

NS_ASSUME_NONNULL_END
