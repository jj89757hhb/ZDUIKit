//
//  UITableView+ZDCellClass.h
//  ZDNetwork
//
//  Created by huhuabin on 2019/4/11.
//  Copyright © 2019 mistong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDCellClassType.h"

@interface UITableView (ZDCellClass)

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
@end

