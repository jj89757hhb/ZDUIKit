//
//  UIColor+ZDExtend.m
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "UIColor+ZDExtend.h"
#import "ZDFoundationMacro.h"
ZDSYNTH_DUMMY_CLASS(UIColor_ZDExtend)


UIColor *UIColorFromRGB(uint32_t rgbValue) {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0
                           green:((float)((rgbValue & 0xFF00) >> 8))/255.0
                            blue:((float)(rgbValue & 0xFF))/255.0
                           alpha:1.0];
}

UIColor *UIColorFromRGBA(uint32_t rgbValue) {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF000000) >> 24))/255.0
                           green:((float)((rgbValue & 0xFF0000) >> 16))/255.0
                            blue:((float)((rgbValue & 0xFF00) >> 8))/255.0
                           alpha:((float)(rgbValue & 0xFF))/255.0];
}

UIColor *UIColorFromRGB_alpha(uint32_t rgbValue, CGFloat alphaValue) {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0
                           green:((float)((rgbValue & 0xFF00) >> 8))/255.0
                            blue:((float)(rgbValue & 0xFF))/255.0
                           alpha:alphaValue];
}

UIColor *UIColorWithARGB(uint32_t argbValue) {
    return [UIColor colorWithRed:((argbValue & 0xFF0000) >> 16) / 255.0f
                           green:((argbValue & 0xFF00) >> 8) / 255.0f
                            blue:(argbValue & 0xFF) / 255.0f
                           alpha:((argbValue & 0xFF000000) >> 24) / 255.0f];
}

@implementation UIColor (ZDExtend)
+ (UIColor*)zd_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor*)zd_colorWithHex:(NSInteger)hexValue {
    return [UIColor zd_colorWithHex:hexValue alpha:1.0];
}
@end
