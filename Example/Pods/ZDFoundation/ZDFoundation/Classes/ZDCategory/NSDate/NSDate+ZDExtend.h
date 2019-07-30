//
//  NSDate+ZDExtend.h
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (ZDExtend)
@property (nonatomic, readonly) NSInteger zd_year; ///< Year component
@property (nonatomic, readonly) NSInteger zd_month; ///< Month component (1~12)
@property (nonatomic, readonly) NSInteger zd_day; ///< Day component (1~31)
@property (nonatomic, readonly) NSInteger zd_hour; ///< Hour component (0~23)
@property (nonatomic, readonly) NSInteger zd_minute; ///< Minute component (0~59)
@property (nonatomic, readonly) NSInteger zd_second; ///< Second component (0~59)
@property (nonatomic, readonly) NSInteger zd_nanosecond; ///< Nanosecond component
@property (nonatomic, readonly) NSInteger zd_weekday; ///< Weekday component (1~7, first day is based on user setting)
@property (nonatomic, readonly) NSInteger zd_weekdayOrdinal; ///< WeekdayOrdinal component
@property (nonatomic, readonly) NSInteger zd_weekOfMonth; ///< WeekOfMonth component (1~5)
@property (nonatomic, readonly) NSInteger zd_weekOfYear; ///< WeekOfYear component (1~53)
@property (nonatomic, readonly) NSInteger zd_yearForWeekOfYear; ///< YearForWeekOfYear component
@property (nonatomic, readonly) NSInteger zd_quarter; ///< Quarter component
@property (nonatomic, readonly) BOOL zd_isLeapMonth; ///< whether the month is leap month
@property (nonatomic, readonly) BOOL zd_isLeapYear; ///< whether the year is leap year
@property (nonatomic, readonly) BOOL zd_isToday; ///< whether date is today (based on current locale)
@property (nonatomic, readonly) BOOL zd_isYesterday; ///< whether date is yesterday (based on current locale)
@property (nonatomic, readonly) BOOL zd_isSameWeek; /// whether date is same week (based on current locale)
#pragma mark - Date modify

- (nullable NSDate *)zd_dateByAddingYears:(NSInteger)years;
- (nullable NSDate *)zd_dateByAddingMonths:(NSInteger)months;
- (nullable NSDate *)zd_dateByAddingWeeks:(NSInteger)weeks;
- (nullable NSDate *)zd_dateByAddingDays:(NSInteger)days;
- (nullable NSDate *)zd_dateByAddingHours:(NSInteger)hours;
- (nullable NSDate *)zd_dateByAddingMinutes:(NSInteger)minutes;
- (nullable NSDate *)zd_dateByAddingSeconds:(NSInteger)seconds;


#pragma mark - Date Format
- (nullable NSString *)zd_stringWithFormat:(NSString *)format;
- (nullable NSString *)zd_stringWithFormat:(NSString *)format
                               timeZone:(nullable NSTimeZone *)timeZone
                                 locale:(nullable NSLocale *)locale;
- (nullable NSString *)zd_stringWithISOFormat;
+ (nullable NSDate *)zd_dateWithString:(NSString *)dateString format:(NSString *)format;
+ (nullable NSDate *)zd_dateWithString:(NSString *)dateString
                             format:(NSString *)format
                           timeZone:(nullable NSTimeZone *)timeZone
                             locale:(nullable NSLocale *)locale;
+ (nullable NSDate *)zd_dateWithISOFormatString:(NSString *)dateString;

@end

NS_ASSUME_NONNULL_END
