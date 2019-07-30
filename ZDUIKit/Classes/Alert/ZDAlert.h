//
//  ZDAlert.h
//  AAA
//
//  Created by huhuabin on 2019/5/5.
//  Copyright © 2019 mistong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZDAlertMaker.h"


/**
 自定义的alertController
 */
@interface ZDAlert : NSObject
@property (nonatomic, strong) ZDAlertMaker *alertMark;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)alertShow:(void (^)(ZDAlertMaker *make))maker;
/**
 具有回调的初始化
 */
+ (instancetype)alertShow:(void (^)(ZDAlertMaker *make))maker completion:(void(^)(void))completion;

+ (instancetype)alertSheetShow:(void (^)(ZDAlertMaker *make))maker;
+ (instancetype)alertSheetShow:(void (^)(ZDAlertMaker *make))maker completion:(void (^)(void))completion;
@end

