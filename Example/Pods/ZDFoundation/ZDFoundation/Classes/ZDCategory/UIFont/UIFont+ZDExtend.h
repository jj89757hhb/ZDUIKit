//
//  UIFont+ZDExtend.h
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (ZDExtend)

+ (UIFont *)zd_pingFangSCRegularFontWithSize:(CGFloat)size;
+ (UIFont *)zd_pingFangSCMediumFontWithSize:(CGFloat)size;
+ (UIFont *)zd_pingFangSCLightFontWithSize:(CGFloat)size;
+ (UIFont *)zd_pingFangSCSemiboldFontWithSize:(CGFloat)size;
+ (UIFont *)zd_pingFangSCThinFontWithSize:(CGFloat)size;
@end

NS_ASSUME_NONNULL_END
