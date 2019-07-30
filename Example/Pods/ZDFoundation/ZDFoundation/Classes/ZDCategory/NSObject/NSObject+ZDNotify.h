//
//  NSObject+ZDNotify.h
//  ZD
//
//  Created by huhuabin on 2019/6/12.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ZDNotifyBlock)(NSNotification *note);


NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ZDNotify)

///监听通知（如果self被释放，将会自动清除通知不需要手动停止监听；返回observer对象）
- (id)zd_observeNotificationByName:(NSString *)name withNotifyBlock:(ZDNotifyBlock)block;
- (id)zd_observeNotificationByName:(NSString *)name withObject:(id)object notifyBlock:(ZDNotifyBlock)block;
- (id)zd_observeNotificationByName:(NSString *)name withSelector:(SEL)selector;
- (id)zd_observeNotificationByName:(NSString *)name withObject:(id)object selector:(SEL)selector;
- (BOOL)zd_isObservedNotificationByName:(NSString *)name;

///主动停止通知监听
- (void)zd_removeAllObservedNotifications;
- (void)zd_removeObservedNotificationByName:(NSString *)name;
- (void)zd_removeObservedNotificationByName:(NSString *)name object:(id)object;

#pragma mark - Deprecated
- (void)zd_listenNotificationByName:(NSString *)name withNotifyBlock:(void(^)(NSNotification *note, id weakSelf))block __deprecated_msg("Use observeNotificationByName:withNotifyBlock:");
- (void)zd_listenNotificationByName:(NSString *)name withObject:(id)object notifyBlock:(void(^)(NSNotification *note, id weakSelf))block __deprecated_msg("Use observeNotificationByName:withObject:notifyBlock:");
- (BOOL)zd_isListenedNotificationByName:(NSString *)name __deprecated_msg("Use isObservedNotificationByName:");

@end

NS_ASSUME_NONNULL_END
