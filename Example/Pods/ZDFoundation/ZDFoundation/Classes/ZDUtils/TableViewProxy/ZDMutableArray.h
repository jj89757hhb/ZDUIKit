//
//  ZDMutableArray.h
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import <Foundation/Foundation.h>
#import "ZDModelID.h"

@interface ZDMutableArray<__covariant ObjectType> : NSMutableArray <ZDModelID>
/**
 初始化方法
 @param identity 标识符
 */
- (nullable instancetype)initWithID:(nullable id<NSCopying>)identity;

/**
 根据标识符查找对象
 @param identity 标识符
 @return nil：表示没有找到对象
 */
- (nullable NSArray<ObjectType<ZDModelID>> *)objectsForID:(nonnull id)identity;

/**
 根据标识符查找第一个匹配的对象
 @param identity 标识符
 @return nil：表示没有找到对象
 */
- (nullable ObjectType<ZDModelID>)firstObjectForID:(nonnull id)identity;

/**
 根据标识符查找一个匹配的对象下标
 注意，如果多个对象都有相同的标识，返回第一个对象的下标
 @param identity 标识符
 @return NSNotFound：表示没有下标
 */
- (NSUInteger)firstIndexForID:(nonnull id)identity;

/**
 根据标识符移除所有匹配的对象
 @param identity 标识符
 @return YES：移除成功
 */
- (BOOL)removeObjectsForID:(nonnull id)identity;


/**
 添加对象，如果对象支持CKDataModel协议，并且identity不为nil，可以用objectForID查找到该对象
 注意，如果数组内已经存在一个相同标识符的对象，两个对象同时存在
 @param anObject 新对象
 */
- (void)addObject:(nonnull ObjectType)anObject;
@end

@interface ZDMutableArray (ObjectSubscripting)
/**
 根据标识符查找对象
 @param key 标识符
 @return nil：表示没有找到匹配的对象
 */
- (nullable id)objectForKeyedSubscript:(nonnull id)key;
@end

@interface NSArray (ZDMutaleArray)
- (nonnull ZDMutableArray *)ZDMutableArray;
@end
