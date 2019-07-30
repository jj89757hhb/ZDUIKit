//
//  ZDUIAssets.h
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/12.
//

#import <Foundation/Foundation.h>
#import "ZDUIMacros.h"
#import <Masonry/Masonry.h>

@interface ZDUIAssets : NSObject
/// 获取图片
+ (UIImage *)imageName:(NSString *)imageName;
/// PingFangSC-Medium 字体
+ (UIFont *)PFMediumFont:(CGFloat)fontSize;
/// PingFangSC-Regular 字体
+ (UIFont *)PFRegularFont:(CGFloat)fontSize;
/// PingFangSC-Semibold 字体
+ (UIFont *)PFSemiboldFont:(CGFloat)fontSize;
@end


