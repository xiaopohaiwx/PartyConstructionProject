//
//  PersonalDetailViewModel.h
//  党建
//
//  Created by 邱敏 on 2018/11/2.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonalDetailViewModel : NSObject

+(NSString *)getTotalScore:(void(^)(NSString *str))scoreStr;

@end

NS_ASSUME_NONNULL_END
