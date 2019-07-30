//
//  ZDAlertMaker.m
//  AAA
//
//  Created by huhuabin on 2019/5/5.
//  Copyright © 2019 mistong. All rights reserved.
//

#import "ZDAlertMaker.h"


@implementation ZDAlertOption
- (instancetype)init {
    self = [super init];
    if (self) {
        self.actionStyle = UIAlertActionStyleDefault;
    }
    return self;
}
+ (instancetype)optionWithTitle:(NSString *)title block:(OptionBlock)block {
    return [self optionWithTitle:title block:block actionStyle:UIAlertActionStyleDefault];
}
+ (instancetype)optionWithTitle:(NSString *)title block:(OptionBlock)block actionStyle:(UIAlertActionStyle)actionStyle {
    ZDAlertOption *option = [ZDAlertOption new];
    option.title = title;
    option.block = block;
    option.actionStyle = actionStyle;
    return option;
}
+ (instancetype)optionWithTitle:(NSString *)title target:(id)target selector:(SEL)selector {
    ZDAlertOption *option = [ZDAlertOption new];
    option.title = title;
    option.target = target;
    option.selector = selector;
    option.actionStyle = UIAlertActionStyleDefault;
    return option;
}
@end


@implementation ZDAlertMaker
- (instancetype)init {
    self = [super init];
    if (self) {
        [self defaultConfig];
    }
    return self;
}
// 默认配置
- (void)defaultConfig {
    self.alertStyle = UIAlertControllerStyleAlert;
    self.options = @[].mutableCopy;
}
- (ZDAlertMaker *(^)(NSString *))title {
    return ^ ZDAlertMaker *(NSString *str) {
        self.alertTitle = str;
        return self;
    };
}
- (ZDAlertMaker *(^)(NSString *))message {
    return ^ ZDAlertMaker *(NSString *str) {
        self.alertMessage = str;
        return self;
    };
}
- (ZDAlertMaker *(^)(UIAlertControllerStyle))style {
    return ^ ZDAlertMaker *(UIAlertControllerStyle alertStyle) {
        self.alertStyle = alertStyle;
        return self;
    };
}
- (ZDAlertMaker *(^)(ZDAlertOption *))addOption {
    return ^ ZDAlertMaker *(ZDAlertOption *option) {
        if (option) {
            [self.options addObject:option];
        }
        return self;
    };
}
- (ZDAlertMaker *(^)(NSString *))cancleOption {
    return ^ ZDAlertMaker *(NSString *str) {
        if (str.length) {
            [self.options addObject:[ZDAlertOption optionWithTitle:str block:nil actionStyle:UIAlertActionStyleCancel]];
        }
        return self;
    };
}
@end
