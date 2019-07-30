//
//  NSMutableArray+ZDSafe.h
//  ZD
//
//  Created by huhuabin on 2019/6/12.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<ObjectType> (ZDSafe)
/// 获取index的值
- (id)zd_ObjectAtIndex:(NSUInteger)index;
/// 安全拼接数组
- (NSArray *)zd_arrayByAddingObjectsFromArray:(NSArray *)otherArray;
/// 创建数组
+ (instancetype)createSafetyArrayWithObject:(ObjectType)anObject;
@end


@interface NSMutableArray<ObjectType> (ZDSafe)
#pragma mark - add
- (BOOL)zd_safetyAddObject:(ObjectType)object;
- (BOOL)zd_safetyAddObjectsFromArray:(NSArray *)otherArray;
- (BOOL)zd_safetyInsertObject:(ObjectType)anObject atIndex:(NSUInteger)index;

#pragma mark - remove
- (BOOL)zd_safetyRemoveObjectAtIndex:(NSUInteger)index;
- (BOOL)zd_safetyRemoveObject:(ObjectType)object;
/// 移除大于等于某个索引的所有对象
- (BOOL)zd_safetyRemoveObjectsAfterIndex:(NSUInteger)index;
/// 移除小于等于某个索引的所有对象
- (BOOL)zd_safetyRemoveObjectsBeforeIndex:(NSUInteger)index;
- (BOOL)zd_safetyRemoveObjectsInRange:(NSRange)range;
- (BOOL)zd_safetyRemoveObjectsAtIndexes:(NSIndexSet *)indexes;

#pragma mark - change
- (BOOL)zd_safetyExchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
- (BOOL)zd_safetyReplaceObjectAtIndex:(NSUInteger)index withObject:(ObjectType)anObject;
- (BOOL)zd_safetyMoveObjectAtIndex:(NSUInteger)idx1 toIndex:(NSUInteger)idx2;

@end

NS_ASSUME_NONNULL_END
