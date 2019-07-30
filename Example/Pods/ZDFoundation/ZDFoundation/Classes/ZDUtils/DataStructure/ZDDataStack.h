//
//  ZDDataStack.h
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import <Foundation/Foundation.h>

/**
 自定义数据结构中的栈
 */
@interface ZDDataStack : NSObject
/// 元素个数
@property (nonatomic, assign) NSInteger size;

/**
 初始化
 
 @return 栈对象
 */
+ (instancetype)stack;
- (instancetype)init NS_DESIGNATED_INITIALIZER;

/**
 入栈操作
 
 @param element 入栈的u元素
 */
- (void)push:(id)element;

/**
 出栈操作
 */
- (void)pop;

/**
 获取栈顶元素
 */
- (id)top;

/**
 判断是否为空
 */
- (BOOL)isEmpty;

/**
 获取栈中所有元素，顶 -> 底
 */
- (NSArray *)allElements;

/**
 清空栈
 */
- (void)clearStack;
@end


