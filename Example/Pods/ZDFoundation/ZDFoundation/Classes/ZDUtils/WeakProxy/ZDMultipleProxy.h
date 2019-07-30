//
//  ZDMultipleProxy.h
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import <Foundation/Foundation.h>

/**
 方法转发代理，可以将一个方法转发到多个对象
 按照设置对象的顺序，依次转发方法
 如果转发的方法带有返回值，将会以最后一个实现了该方法的对象为准
 */
@interface ZDMultipleProxy : NSProxy
@property (nonatomic, strong, readonly) NSPointerArray *objects;

/**
 创建一个转发代理
 @param objects 需要转发的对象
 */
+ (instancetype)proxyWithObjects:(NSArray *)objects;

/**
 初始化方法
 @param objects 需要转发的对象
 */
- (instancetype)initWithObjects:(NSArray *)objects;

- (BOOL)respondsToSelector:(SEL)aSelector;
@end

