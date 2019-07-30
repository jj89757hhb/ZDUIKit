//
//  NSNotificationCenter+ZDExtend.h
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (ZDExtend)

- (void)zd_postNotificationOnMainThread:(NSNotification *)notification;

- (void)zd_postNotificationOnMainThread:(NSNotification *)notification
                       waitUntilDone:(BOOL)wait;

- (void)zd_postNotificationOnMainThreadWithName:(NSString *)name
                                      object:(nullable id)object;

- (void)zd_postNotificationOnMainThreadWithName:(NSString *)name
                                      object:(nullable id)object
                                    userInfo:(nullable NSDictionary *)userInfo;

- (void)zd_postNotificationOnMainThreadWithName:(NSString *)name
                                      object:(nullable id)object
                                    userInfo:(nullable NSDictionary *)userInfo
                               waitUntilDone:(BOOL)wait;
@end

