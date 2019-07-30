//
//  ZDDataQueue.h
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import <Foundation/Foundation.h>

/**
 队列结构
 */
@interface ZDDataQueue : NSObject
/// 元素个数
@property (nonatomic, assign) NSInteger length;


/**
 初始化
 
 @return 队列对象
 */
+ (instancetype)queue;
- (instancetype)init NS_DESIGNATED_INITIALIZER;
/// 进队
- (void)enter:(id)element;
/// 出队
- (void)exit;
/// 获取队头元素
- (id)frontElement;
/// 获取队尾元素
- (id)tailElement;
/// 判空
- (BOOL)isEmpty;
/// 获取队列中所有元素
- (NSArray *)allElements;
/// 清空队列
- (void)clearQueue;
@end


