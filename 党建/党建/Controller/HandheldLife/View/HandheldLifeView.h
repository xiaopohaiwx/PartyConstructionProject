//
//  HandheldLifeView.h
//  党建
//
//  Created by Mac on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol HandheldLifeViewDelegate <NSObject>

- (void)itemDidSelect:(NSInteger)tag;

@end

@interface HandheldLifeView : UIView

@property (nonatomic, weak) id<HandheldLifeViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
