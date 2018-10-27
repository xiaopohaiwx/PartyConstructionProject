//
//  FirstPageView.h
//  党建
//
//  Created by Mac on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol FirstPageViewDelegate <NSObject>

- (void)itemDidSelect:(NSInteger)tag;

@end

@interface FirstPageView : UIView

@property (nonatomic, weak) id<FirstPageViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
