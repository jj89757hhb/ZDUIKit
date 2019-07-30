//
//  ZDThreadSafeDictionary.h
//  ZD
//
//  Created by huhuabin on 2019/6/12.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZDThreadSafeDictionary<KeyType, ObjectType> : NSMutableDictionary<KeyType, ObjectType>

@end

NS_ASSUME_NONNULL_END
