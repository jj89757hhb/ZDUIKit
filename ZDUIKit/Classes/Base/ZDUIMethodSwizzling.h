//
//  ZDUIMethodSwizzling.h
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/12.
//

#import <Foundation/Foundation.h>

/**
 交换类的实例方法
 @param originClass 需要交换的类
 @param originSelector 交换前的实例方法
 @param swizzledSelector 交换后的实例方法
 */
void ZDUIKitSwizzling(Class originClass, SEL originSelector, SEL swizzledSelector);
