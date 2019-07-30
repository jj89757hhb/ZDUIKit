//
//  UIColor+ZDExtend.h
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>
extern UIColor *UIColorFromRGB(uint32_t rgbValue);
extern UIColor *UIColorFromRGBA(uint32_t rgbValue);
extern UIColor *UIColorFromRGB_alpha(uint32_t rgbValue, CGFloat alphaValue);
extern UIColor *UIColorWithARGB(uint32_t argbValue);

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ZDExtend)
+ (UIColor*)zd_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*)zd_colorWithHex:(NSInteger)hexValue;
@end

NS_ASSUME_NONNULL_END
