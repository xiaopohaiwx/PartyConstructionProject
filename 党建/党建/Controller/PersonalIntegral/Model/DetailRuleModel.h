//
//  DetailRuleModel.h
//  党建
//
//  Created by 邱敏 on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailRuleModel : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *typeName;
@property (nonatomic, strong) NSString *singleDesc;
@property (nonatomic, strong) NSString *maxNum;

@end

NS_ASSUME_NONNULL_END
