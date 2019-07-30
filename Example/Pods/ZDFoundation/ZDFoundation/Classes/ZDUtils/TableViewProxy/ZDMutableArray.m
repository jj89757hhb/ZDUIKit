//
//  ZDMutableArray.m
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import "ZDMutableArray.h"

@interface ZDArrayKeyedObjectSet : NSObject
@property (nonatomic, strong) NSMapTable *counters;
@property (nonatomic, strong) NSMutableOrderedSet *orderSet;

- (void)addObject:(id)object;
- (void)removeObject:(id)object;
- (NSUInteger)objectCount:(id)object;
- (NSUInteger)count;
@end
@implementation ZDArrayKeyedObjectSet
- (instancetype)init {
    if ((self = [super init])) {
        _counters = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsStrongMemory valueOptions:NSPointerFunctionsStrongMemory];
        _orderSet = [NSMutableOrderedSet orderedSet];
    }
    return self;
}

- (void)addObject:(id)object {
    NSNumber *count = [self.counters objectForKey:object];
    if (!count) {
        [self.orderSet addObject:object];
        [self.counters setObject:@(1) forKey:object];
    } else {
        [self.counters setObject:@([count unsignedIntegerValue]+1) forKey:object];
    }
}

- (void)removeObject:(id)object {
    NSUInteger count = [[_counters objectForKey:object] unsignedIntegerValue];
    if (count <= 1) {
        [self.counters removeObjectForKey:object];
    } else {
        [self.counters setObject:@(count-1) forKey:object];
    }
    [self.orderSet removeObject:object];
}

- (NSUInteger)objectCount:(id)object {
    NSNumber *count = [self.counters objectForKey:object];
    if (count) {
        return [count unsignedIntegerValue];
    }
    return 0;
}

- (NSUInteger)count {
    return self.orderSet.count;
}
@end

@interface ZDMutableArray ()
@property (nonatomic, strong) NSMutableArray *mArray;
@property (nonatomic, strong) NSMutableDictionary *mDictionary;
@property (nonatomic, copy) id mIdentity;
@end

@implementation ZDMutableArray
- (nullable instancetype)initWithID:(nullable id<NSCopying>)identity {
    if ((self = [self initWithCapacity:0])) {
        self.mIdentity = identity;
    }
    return self;
}

- (id)identity {
    if (_mIdentity) {
        return _mIdentity;
    }
    return nil;
}

- (nullable NSArray *)objectsForID:(nonnull id)identity {
    ZDArrayKeyedObjectSet *set = [self.mDictionary objectForKey:identity];
    return set ? [set.orderSet array] : nil;
}

- (nullable id)firstObjectForID:(nonnull id)identity {
    ZDArrayKeyedObjectSet *set = [self.mDictionary objectForKey:identity];
    return set ? [set.orderSet firstObject] : nil;
}

- (NSUInteger)firstIndexForID:(nonnull id)identity {
    ZDArrayKeyedObjectSet *set = [self.mDictionary objectForKey:identity];
    if (set) {
        return [self.mArray indexOfObjectIdenticalTo:[set.orderSet firstObject]];
    }
    return NSNotFound;
}

- (BOOL)removeObjectsForID:(nonnull id)identity {
    ZDArrayKeyedObjectSet *set = [self.mDictionary objectForKey:identity];
    if (set) {
        for (id obj in set.orderSet) {
            [self.mArray removeObject:obj];
        }
        [self.mDictionary removeObjectForKey:identity];
        return YES;
    }
    return NO;
}

/// 从字典里设置一个匹配的对象
- (void)_setObjectToDictionaryIfNeeded:(id)object {
    if ([object conformsToProtocol:@protocol(ZDModelID)]) {
        id identity = [object identity];
        if (!identity) {
            return;
        }
        ZDArrayKeyedObjectSet *set = [self.mDictionary objectForKey:identity];
        if (!set) {
            set = [[ZDArrayKeyedObjectSet alloc] init];
            [self.mDictionary setObject:set forKey:identity];
        }
        [set addObject:object];
    }
}

/// 从字典里移除一个匹配的对象
- (void)_removeObjectInDictionaryIfNeeded:(id)object {
    if ([object conformsToProtocol:@protocol(ZDModelID)]) {
        id identity = [object identity];
        if (!identity) {
            return;
        }
        ZDArrayKeyedObjectSet *set = [self.mDictionary objectForKey:identity];
        if (set && [set objectCount:object] > 0) {
            [set removeObject:object];
            if ([set count] == 0) {
                [self.mDictionary removeObjectForKey:identity];
            }
        }
    }
}

#pragma mark - NSArray subclass required
- (NSUInteger)count {
    return self.mArray.count;
}

- (id)objectAtIndex:(NSUInteger)index {
    return [self.mArray objectAtIndex:index];
}

#pragma mark - NSMutableArray subclass required
- (instancetype)initWithCapacity:(NSUInteger)numItems {
    if ((self = [self init])) {
        _mArray = [[NSMutableArray alloc] initWithCapacity:numItems];
        _mDictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)insertObject:(id)obj atIndex:(NSUInteger)index {
    [self.mArray insertObject:obj atIndex:index];
    [self _setObjectToDictionaryIfNeeded:obj];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self _removeObjectInDictionaryIfNeeded:[self.mArray objectAtIndex:index]];
    [self.mArray removeObjectAtIndex:index];
}

- (void)addObject:(id)obj {
    [self.mArray addObject:obj];
    [self _setObjectToDictionaryIfNeeded:obj];
}

- (void)removeLastObject {
    [self _removeObjectInDictionaryIfNeeded:[self.mArray lastObject]];
    [self.mArray removeLastObject];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)obj {
    [self _removeObjectInDictionaryIfNeeded:[self.mArray objectAtIndex:index]];
    [self.mArray replaceObjectAtIndex:index withObject:obj];
    [self _setObjectToDictionaryIfNeeded:obj];
}

#pragma mark - Other
- (id)mutableCopyWithZone:(NSZone *)zone {
    ZDMutableArray *otherArray = [[[self class] allocWithZone:zone] init];
    otherArray.mIdentity = _mIdentity;
    otherArray->_mArray = [self.mArray mutableCopyWithZone:zone];
    otherArray->_mDictionary = [self.mDictionary mutableCopyWithZone:zone];
    return otherArray;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.mArray;
}
@end

@implementation ZDMutableArray (ObjectSubscripting)
- (id)objectForKeyedSubscript:(id)key {
    return [self firstObjectForID:key];
}
@end

@implementation NSArray (ZDMutableArray)
- (ZDMutableArray *)ZDMutableArray {
    return [[ZDMutableArray alloc] initWithArray:self];
}
@end
