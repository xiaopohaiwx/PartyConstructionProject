//
//  BaseNewsDetailsViewController.h
//  党建
//
//  Created by 邱敏 on 2018/10/26.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseNewsDetailsViewController : UIViewController

/** 新闻id */
@property (nonatomic, strong) NSString *newsID;
/** 新闻页头标题 */
@property (nonatomic, strong) NSString *topString;
/** 新闻标题 */
@property (nonatomic, strong) NSString *titleString;
/** 新闻内容 */
@property (nonatomic, strong) NSString *contentStr;

-(void)getNewsData:(TableCellModel *)obj;

@end

NS_ASSUME_NONNULL_END
