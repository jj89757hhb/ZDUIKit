//
//  ZDAlertMaker.h
//  AAA
//
//  Created by huhuabin on 2019/5/5.
//  Copyright © 2019 mistong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^OptionBlock)(void);
@interface ZDAlertOption : NSObject
@property (nonatomic, copy) NSString *title;
/// 回调操作
@property (nonatomic, copy) OptionBlock block;
/// 设置字体颜色
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) UIAlertActionStyle actionStyle;
@property (nonatomic, weak) id target;
@property (nonatomic) SEL selector;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)optionWithTitle:(NSString *)title block:(OptionBlock)block;
+ (instancetype)optionWithTitle:(NSString *)title block:(OptionBlock)block actionStyle:(UIAlertActionStyle)actionStyle;

+ (instancetype)optionWithTitle:(NSString *)title target:(id)target selector:(SEL)selector;
@end
/// 只有title没有回调
NS_INLINE ZDAlertOption *ZDAlertTitleOption(NSString *title) {
    return [ZDAlertOption optionWithTitle:title block:nil];
}
/// 带有回调
NS_INLINE ZDAlertOption *ZDAlertBlockOption(NSString *title, OptionBlock block) {
    return [ZDAlertOption optionWithTitle:title block:block];
}
NS_INLINE ZDAlertOption *ZDAlertColorOption(NSString *title, OptionBlock block, UIColor *color) {
    ZDAlertOption *option = [ZDAlertOption optionWithTitle:title block:block];
    option.textColor = color ?: nil;
    return option;
}
/// target action
NS_INLINE ZDAlertOption *ZDAlertActionOption(NSString *title, id target, SEL selector) {
    return [ZDAlertOption optionWithTitle:title target:target selector:selector];
}
NS_INLINE ZDAlertOption *ZDAlertColorAction(NSString *title, id target, SEL selector, UIColor *color) {
    ZDAlertOption *option = [ZDAlertOption optionWithTitle:title target:target selector:selector];
    option.textColor = color ?: nil;
    return option;
}

/**
 用于构建alertController, 包含了alertController的配置项
 */
@interface ZDAlertMaker : NSObject
@property (nonatomic, copy) NSString *alertTitle;
@property (nonatomic, copy) NSString *alertMessage;
@property (nonatomic, assign) UIAlertControllerStyle alertStyle;
/// 储存所有的回调
@property (nonatomic, strong) NSMutableArray *options;
/*
 基本信息
 */
- (ZDAlertMaker *(^)(NSString *))title;
- (ZDAlertMaker *(^)(NSString *))message;
- (ZDAlertMaker *(^)(UIAlertControllerStyle))style;
/*
 添加操作
 */
- (ZDAlertMaker *(^)(ZDAlertOption *))addOption;
/// 取消按钮
- (ZDAlertMaker *(^)(NSString *))cancleOption;
@end

