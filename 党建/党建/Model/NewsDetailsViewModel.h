//
//  NewsDetailsViewModel.h
//  党建
//
//  Created by 邱敏 on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailsViewModel : NSObject

+(NSString *)getNewsDetailsContent:(void (^)(NSString *content, NSString *title))str NewsID:(NSString *)newsID ViewController:(UIViewController *)vc;

+(NSString *)getContent:(void(^)(NSString *str))conStr ViewController:(UIViewController *)vc;
@end

NS_ASSUME_NONNULL_END
