//
//  UICollectionView+ZDCellClass.h
//  ZD
//
//  Created by huhuabin on 2019/4/13.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDCellClassType.h"

@interface UICollectionView (ZDCellClass)
/**
 注册cell
 
 @param cells 存储用于cell重用的对象
 */
- (void)zd_RegisterCells:(NSArray <ZDCellClassType *>*)cells;

/**
 注册xib创建的cell
 
 @param xibCells 存储用于cell重用的对象
 */
- (void)zd_RegisterXibCells:(NSArray <ZDCellClassType *>*)xibCells;

- (void)zd_RegisterXibSections:(NSArray<ZDCellClassType *>*)xibSections elementKind:(NSString *)elementKind;
- (void)zd_RegisterSections:(NSArray<ZDCellClassType *>*)sections elementKind:(NSString *)elementKind;
@end
