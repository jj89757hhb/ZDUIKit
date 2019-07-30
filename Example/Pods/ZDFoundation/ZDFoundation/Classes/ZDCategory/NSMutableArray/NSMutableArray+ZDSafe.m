//
//  NSMutableArray+ZDSafe.m
//  ZD
//
//  Created by huhuabin on 2019/6/12.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "NSMutableArray+ZDSafe.h"
#import "ZDFoundationMacro.h"
ZDSYNTH_DUMMY_CLASS(NSMutableArray_ZDSafe)

@implementation NSArray (ZDSafe)
/// 获取index的值
- (id)zd_ObjectAtIndex:(NSUInteger)index {
    if (self.count <= index) return nil;
    return [self objectAtIndex:index];
}
/// 安全拼接数组
- (NSArray *)zd_arrayByAddingObjectsFromArray:(NSArray *)otherArray {
    NSArray *array;
    if (otherArray) {
        array = [self arrayByAddingObjectsFromArray:otherArray];
    }
    return array ?: self;
}
/// 创建数组
+ (instancetype)createSafetyArrayWithObject:(id)anObject {
    if (anObject) {
        return [self arrayWithObject:anObject];
    }
    return [self array];
}
@end


@implementation NSMutableArray (ZDSafe)

#pragma mark - Add
- (BOOL)zd_safetyAddObject:(id)object {
    if (object) {
        [self addObject:object];
        return YES;
    }
    return NO;
}

- (BOOL)zd_safetyInsertObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject) {
        return NO;
    }
    if (self.count <= index) {
        [self addObject:anObject];
    }
    else {
        [self insertObject:anObject atIndex:index];
    }
    return YES;
}

- (BOOL)zd_safetyAddObjectsFromArray:(NSArray *)otherArray {
    if (!otherArray) {
        return NO;
    }
    [self addObjectsFromArray:otherArray];
    return YES;
}
#pragma mark - Remove
- (BOOL)zd_safetyRemoveObjectAtIndex:(NSUInteger)index {
    if (self.count <= index) {
        return NO;
    }
    [self removeObjectAtIndex:index];
    return YES;
}

- (BOOL)zd_safetyRemoveObjectsAfterIndex:(NSUInteger)index {
    NSInteger count = self.count;
    if (index < count) {
        NSRange range = NSMakeRange(index, count-index);
        [self removeObjectsInRange:range];
        return YES;
    }
    return NO;
}

- (BOOL)zd_safetyRemoveObjectsBeforeIndex:(NSUInteger)index {
    NSInteger count = self.count;
    if (index < count) {
        NSRange range = NSMakeRange(0, index+1);
        [self removeObjectsInRange:range];
        return YES;
    }
    return NO;
}

- (BOOL)zd_safetyRemoveObjectsInRange:(NSRange)range {
    if (range.location + range.length <= self.count) {
        [self removeObjectsInRange:range];
        return YES;
    }
    return NO;
}

- (BOOL)zd_safetyRemoveObjectsAtIndexes:(NSIndexSet *)indexes {
    if (indexes && indexes.lastIndex < self.count) {
        [self removeObjectsAtIndexes:indexes];
        return YES;
    }
    return NO;
}

- (BOOL)zd_safetyRemoveObject:(id)object {
    if (object && [self containsObject:object]) {
        [self removeObject:object];
        return YES;
    }
    return NO;
}

#pragma mark - Change
- (BOOL)zd_safetyReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (anObject && index < self.count) {
        [self replaceObjectAtIndex:index withObject:anObject];
        return YES;
    }
    return NO;
}

- (BOOL)zd_safetyExchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2 {
    if (idx1 < self.count && idx2 < self.count && idx1 != idx2) {
        [self exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
        return YES;
    }
    return NO;
}

- (BOOL)zd_safetyMoveObjectAtIndex:(NSUInteger)idx1 toIndex:(NSUInteger)idx2 {
    if (idx1 < self.count && idx2 < self.count && idx1 != idx2) {
        id obj = [self objectAtIndex:idx1];
        [self removeObjectAtIndex:idx1];
        [self insertObject:obj atIndex:idx2];
        return YES;
    }
    return NO;
}

@end
