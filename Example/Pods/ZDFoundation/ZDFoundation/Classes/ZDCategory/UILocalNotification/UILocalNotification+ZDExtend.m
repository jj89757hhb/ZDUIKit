//
//  UILocalNotification+ZDExtend.m
//  ZD
//
//  Created by huhuabin on 2019/6/6.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "UILocalNotification+ZDExtend.h"
#import "ZDFoundationMacro.h"
ZDSYNTH_DUMMY_CLASS(UILocalNotification_ZDExtend)

@implementation UILocalNotification (ZDExtend)
#pragma 创建本地推送任务
+(void)createLocalNotificationTaskWithContent:(NSString*)content userInfo:(NSDictionary *)userInfo {
    //    NSString *firetime= nil;
    //     NSString *content= nil;
    //    NSString *time= [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"Reserved_%@%@",_model.liveId,_model.startTimeStamp]] ;
    // 1.创建通知
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    // 2.设置通知的必选参数
    localNotification.alertTitle = userInfo[@"title"] ?: @"通知";
    // 设置通知显示的内容
    localNotification.alertBody = content?content:@"您收到一条通知";
    // 设置通知的发送时间,单位秒
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:1];
    localNotification.userInfo = userInfo;
    //解锁滑动时的事件
    localNotification.alertAction = @"打开";
    //收到通知时App icon的角标
    localNotification.applicationIconBadgeNumber = 1;
    //推送是带的声音提醒，设置默认的字段为UILocalNotificationDefaultSoundName
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    // 3.发送通知(🐽 : 根据项目需要使用)
    // 方式一: 根据通知的发送时间(fireDate)发送通知
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
}
@end
