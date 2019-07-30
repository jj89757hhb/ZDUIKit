//
//  NSMutableDictionary+ZDSafe.m
//  ZD
//
//  Created by huhuabin on 2019/6/12.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "NSMutableDictionary+ZDSafe.h"
#import "ZDFoundationMacro.h"

ZDSYNTH_DUMMY_CLASS(NSDictionary_ZDSafe)

@implementation NSDictionary (ZDSafe)
- (id)zd_ObjectForKey:(id)key validatedByClass:(Class)objClass {
    id object = [self objectForKey:key];
    if (object && [object isKindOfClass:objClass]) {
        return object;
    }
    return nil;
}

- (NSString *)zd_StringObjectForKey:(id)key {
    return [self zd_ObjectForKey:key validatedByClass:NSString.class];
}
- (NSNumber *)zd_NumberObjectForKey:(id)key {
    return [self zd_ObjectForKey:key validatedByClass:NSNumber.class];
}
- (NSValue *)zd_ValueObjectForKey:(id)key {
    return [self zd_ObjectForKey:key validatedByClass:NSValue.class];
}
- (NSArray *)zd_ArrayObjectForKey:(id)key {
    return [self zd_ObjectForKey:key validatedByClass:NSArray.class];
}
- (NSDictionary *)zd_DictionaryObjectForKey:(id)key {
    return [self zd_ObjectForKey:key validatedByClass:NSDictionary.class];
}
- (BOOL)zd_BoolObjectForKey:(id)key {
    id obj = [self objectForKey:key];
    if (obj && ([obj isKindOfClass:NSNumber.class] || [obj isKindOfClass:NSString.class])) {
        return [obj boolValue];
    }
    return NO;
}
- (double)zd_DoubleObjectForKey:(id)key {
    id obj = [self objectForKey:key];
    if (obj && ([obj isKindOfClass:NSNumber.class] || [obj isKindOfClass:NSString.class])) {
        return [obj doubleValue];
    }
    return 0;
}
- (NSInteger)zd_IntegerObjectForKey:(id)key {
    id obj = [self objectForKey:key];
    if (obj && ([obj isKindOfClass:NSNumber.class] || [obj isKindOfClass:NSString.class])) {
        return [obj integerValue];
    }
    return 0;
}
@end


ZDSYNTH_DUMMY_CLASS(NSMutableDictionary_ZDSafe)

@implementation NSMutableDictionary (ZDSafe)

- (void)zd_safetySetObject:(id)anObject forKey:(id)aKey
{
    if (anObject && aKey)
    {
        [self setObject:anObject forKey:aKey];
    }
}

- (void)zd_safetyRemoveObjectForKey:(id)key
{
    if (key) {
        [self removeObjectForKey:key];
    }
}

@end
