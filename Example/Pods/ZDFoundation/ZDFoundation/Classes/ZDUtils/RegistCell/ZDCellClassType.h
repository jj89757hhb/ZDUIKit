//
//  ZDCellClassType.h
//  ZD
//
//  Created by huhuabin on 2019/4/13.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZDCellClassType : NSObject
/// 类名
@property (nonatomic, copy) NSString * className;
/// 重用标识符
@property (nonatomic, copy) NSString *resueIdentifier;

/**
 通过类名、标识符 初始化重用的对象
 
 @param className 类名
 @param resueIdentifier 标识符
 @return 用于重用的对象
 */
+ (instancetype)zd_CellClassTypeWithClassName:(NSString *)className resueIdentifier:(NSString *)resueIdentifier;
+ (instancetype)zd_CellClassTypeWithClassName:(NSString *)className;
@end

NS_INLINE ZDCellClassType *ZDCellType(NSString *className, NSString *resueIdentifier) {
    return [ZDCellClassType zd_CellClassTypeWithClassName:className resueIdentifier:resueIdentifier.length ? resueIdentifier : className];
}
NS_INLINE ZDCellClassType *ZDCellType2(NSString *className) {
     return [ZDCellClassType zd_CellClassTypeWithClassName:className];
}
