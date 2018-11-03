//
//  PersonalInformationViewModel.h
//  党建
//
//  Created by Mac on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonalInformationModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonalInformationViewModel : NSObject

typedef void(^Block)(NSMutableArray *array);
typedef void(^alertBlock)(UIAlertController *alert);


- (void)getPersonalInformationManager:(AFHTTPSessionManager *)manager ModelArrCallBack:(Block)modelArrCallBack Alert:(alertBlock)alert;

@end

NS_ASSUME_NONNULL_END
