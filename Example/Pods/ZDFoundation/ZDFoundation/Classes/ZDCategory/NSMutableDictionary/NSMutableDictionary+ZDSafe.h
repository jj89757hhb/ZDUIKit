//
//  NSMutableDictionary+ZDSafe.h
//  ZD
//
//  Created by huhuabin on 2019/6/12.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 字典的扩展
 支持取值后直接转化 BOOL/double/NSInteger 类型
 */
@interface NSDictionary (ZDSafe)
/**
 获取字段的对象，并根据对象的类型进行验证对象的合法性
 
 @param key 对象的键值
 @param objClass 对象的值
 @return 对象验证失败返回nil，成功返回对象
 */
- (id)zd_ObjectForKey:(id)key validatedByClass:(Class)objClass;

- (NSString *)zd_StringObjectForKey:(id)key;
- (NSNumber *)zd_NumberObjectForKey:(id)key;
- (NSValue *)zd_ValueObjectForKey:(id)key;
- (NSArray *)zd_ArrayObjectForKey:(id)key;
- (NSDictionary *)zd_DictionaryObjectForKey:(id)key;
- (BOOL)zd_BoolObjectForKey:(id)key;
- (double)zd_DoubleObjectForKey:(id)key;
- (NSInteger)zd_IntegerObjectForKey:(id)key;
@end


@interface NSMutableDictionary (ZDSafe)
- (void)zd_safetySetObject:(id)anObject forKey:(id)aKey;
- (void)zd_safetyRemoveObjectForKey:(id)key;

@end

