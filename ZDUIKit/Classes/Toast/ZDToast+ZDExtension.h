//
//  ZDToast+ZDExtension.h
//  ZDUIKit
//
//  Created by huhuabin on 2019/7/3.
//

#import <UIKit/UIKit.h>
#import "ZDToast.h"

/**
 toast 扩展
 */
@interface ZDToast (ZDExtension)
/**
 展示提示信息
 */
+ (instancetype)ZDShowPrompt:(NSString *)info inView:(UIView *)view;
/**
 展示成功信息
 */
+ (instancetype)ZDShowSuccessInfo:(NSString *)successInfo inView:(UIView *)view;
@end


