//
//  DemoDemoPartMemberViewModel.h
//  党建
//
//  Created by 邱敏 on 2018/10/30.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DemoDemoPartMemberViewModel : NSObject

+(NSArray *)GET:(NSString *)url ObjectArray:(void (^)(NSArray *arr))array ViewController:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
