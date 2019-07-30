//
//  UIFont+ZDExtend.m
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "UIFont+ZDExtend.h"
#import "ZDFoundationMacro.h"
ZDSYNTH_DUMMY_CLASS(UIFont_ZDExtend)

@implementation UIFont (ZDExtend)
+ (UIFont *)zd_pingFangSCRegularFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}

+ (UIFont *)zd_pingFangSCMediumFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
}

+ (UIFont *)zd_pingFangSCLightFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Light" size:size];
}

+ (UIFont *)zd_pingFangSCSemiboldFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
}

+ (UIFont *)zd_pingFangSCThinFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Thin" size:size];
}
@end
