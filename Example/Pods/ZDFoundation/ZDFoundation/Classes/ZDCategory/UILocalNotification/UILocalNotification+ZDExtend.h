//
//  UILocalNotification+ZDExtend.h
//  ZD
//
//  Created by huhuabin on 2019/6/6.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILocalNotification (ZDExtend)
+(void)createLocalNotificationTaskWithContent:(NSString*)content userInfo:(NSDictionary *)userInfo;
@end

