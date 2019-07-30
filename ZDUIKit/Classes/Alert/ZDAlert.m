//
//  ZDAlert.m
//  AAA
//
//  Created by huhuabin on 2019/5/5.
//  Copyright © 2019 mistong. All rights reserved.
//

#import "ZDAlert.h"

@implementation ZDAlert
+ (instancetype)alertShow:(void (^)(ZDAlertMaker *))maker {
    return [self alertShow:maker completion:nil];
}

+ (instancetype)alertShow:(void (^)(ZDAlertMaker *))maker completion:(void(^)(void))completion {
    ZDAlert *alert = [ZDAlert new];
    alert.alertMark = [ZDAlertMaker new];
    maker(alert.alertMark);
    [alert buildAlertController:completion];
    return alert;
}

+ (instancetype)alertSheetShow:(void (^)(ZDAlertMaker *))maker {
    return [self alertSheetShow:maker completion:nil];
}
+ (instancetype)alertSheetShow:(void (^)(ZDAlertMaker *make))maker completion:(void (^)(void))completion {
    ZDAlert *alert = [ZDAlert new];
    ZDAlertMaker *alertMarker = [ZDAlertMaker new];
    alertMarker.alertStyle = UIAlertControllerStyleActionSheet;
    alert.alertMark = alertMarker;
    maker(alert.alertMark);
    [alert buildAlertController:completion];
    return alert;
}


- (void)buildAlertController:(void(^)(void))completion {
    if (!self.alertMark.options.count) return;
    /// 适配iPad
    if (self.alertMark.alertStyle == UIAlertControllerStyleActionSheet && UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        self.alertMark.alertStyle = UIAlertControllerStyleAlert;
    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:self.alertMark.alertTitle message:self.alertMark.alertMessage preferredStyle:self.alertMark.alertStyle];
    for (ZDAlertOption *option in self.alertMark.options) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:option.title style:option.actionStyle handler:^(UIAlertAction * _Nonnull action) {
            // block
            if (option.block) {
                option.block();
            }
            // target action
            if (option.target && option.selector) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                [option.target performSelector:option.selector];
#pragma clang diagnostic pop
            }
        }];
        if (option.textColor) { // 颜色设置
            [action setValue:option.textColor forKey:@"titleTextColor"];
        }
        [alertController addAction:action];
    }
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alertController animated:YES completion:completion];
}
@end
