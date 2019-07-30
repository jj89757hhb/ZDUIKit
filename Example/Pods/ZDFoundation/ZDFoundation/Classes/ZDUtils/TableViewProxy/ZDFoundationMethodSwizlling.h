//
//  ZDFoundationMethodSwizlling.h
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import <Foundation/Foundation.h>
/**
 交换类的实例方法
 @param originClass 需要交换的类
 @param originSelector 交换前的实例方法
 @param swizzledSelector 交换后的实例方法
 */
void zd_FoundationSwizzling(Class originClass, SEL originSelector, SEL swizzledSelector);
