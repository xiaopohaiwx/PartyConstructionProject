//
//  BaseTableViewController.h
//  党建
//
//  Created by 邱敏 on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
/** 新闻类型 */
@property (nonatomic, strong) NSString *type;
/** 新闻页头标题 */
@property (nonatomic, strong) NSString *titleString;

@end

NS_ASSUME_NONNULL_END
