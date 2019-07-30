//
//  NSString+ZDDate.m
//  ZD
//
//  Created by huhuabin on 2019/4/24.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "NSString+ZDDate.h"
#import "ZDFoundationMacro.h"
ZDSYNTH_DUMMY_CLASS(NSString_ZDDate)

@implementation NSString (ZDDate)
- (NSString *)zd_TimeWithFormatterType:(ZDFormatterType)type {
    if (!self.length) return nil;
    NSString *format = nil;
    switch (type) {
        case ZDFormatterTypeDefault:
            format = @"yyyy.MM.dd HH:mm:ss";
            break;
        case ZDFormatterTypePoint:
            format = @"yyyy.MM.dd HH:mm";
            break;
        case ZDFormatterTypeDash:
            format = @"yyyy-MM-dd HH:mm";
            break;
        case ZDFormatterTypeText:
            format = @"yyyy年MM月dd日 HH:mm";
            break;
        case ZDFormatterTypeOnlyDate:
            format = @"yyyy.MM.dd";
            break;
        case ZDFormatterTypeOnlyDash:
            format = @"yyyy-MM-dd";
            break;
        case ZDFormatterTypeOnlyText:
            format = @"yyyy年MM月dd日";
            break;
        case ZDFormatterTypeOnlyDefaultMonth:
            format = @"MM.dd";
            break;
        case ZDFormatterTypeOnlyDashMonth:
            format = @"MM-dd";
            break;
        case ZDFormatterTypeOnlyTextMonth:
            format = @"MM月dd日";
            break;
        case ZDFormatterTypeOnlyHours:
            format = @"HH:mm";
            break;
        default:
            format = @"yyyy.MM.dd HH:mm:ss";
            break;
    }
    return [self.class timeStringWithFormat:format timeStampString:self];
}

+ (NSString *)timeStringWithFormat:(NSString *)format timeStampString:(NSString *)timeStr {
    return [self timeStringWithFormat:format timeStamp:[timeStr doubleValue]];
}

+ (NSString *)timeStringWithFormat:(NSString *)format timeStamp:(NSTimeInterval)time {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time / 1000];
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = format;
    return [formatter stringFromDate:date];
}

- (NSString *)zd_Weekday {
    if (!self.length) return nil;
    NSArray *weekdays = @[[NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self doubleValue] / 1000];
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
    return [weekdays objectAtIndex:theComponents.weekday];
}





@end
