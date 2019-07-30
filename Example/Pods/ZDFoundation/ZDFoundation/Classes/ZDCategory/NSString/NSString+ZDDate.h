//
//  NSString+ZDDate.h
//  ZD
//
//  Created by huhuabin on 2019/4/24.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZDFormatterType) {
    ZDFormatterTypeDefault, // xxxx.xx.xx xx:xx:xx
    ZDFormatterTypePoint, // xxxx.xx.xx xx:xx
    ZDFormatterTypeDash, // xxxx-xx-xx xx:xx
    ZDFormatterTypeText, // xxxx年xx月xx日 xx:xx
    ZDFormatterTypeOnlyDate, // xxxx.xx.xx
    ZDFormatterTypeOnlyDash, // xxxx-xx-xx
    ZDFormatterTypeOnlyText, // xxxx年xx月xx日
    ZDFormatterTypeOnlyDefaultMonth, // xx.xx
    ZDFormatterTypeOnlyDashMonth, // xx-xx
    ZDFormatterTypeOnlyTextMonth, // xx月xx日
    ZDFormatterTypeOnlyHours // xx:xx
};

/**
 关于时间的扩展
 */
@interface NSString (ZDDate)
/// 通过type输出 对应格式的时间字段
- (NSString *)zd_TimeWithFormatterType:(ZDFormatterType)type;
/// 星期几
- (NSString *)zd_Weekday;

/// 从字符串转时间格式 毫秒级timeStr
+ (NSString *)timeStringWithFormat:(NSString *)format timeStampString:(NSString *)timeStr;
/// 从时间戳转时间格式 毫秒级time
+ (NSString *)timeStringWithFormat:(NSString *)format timeStamp:(NSTimeInterval)time;

@end
