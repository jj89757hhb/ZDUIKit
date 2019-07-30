//
//  UITableView+ZDCellClass.m
//  ZDNetwork
//
//  Created by huhuabin on 2019/4/11.
//  Copyright © 2019 mistong. All rights reserved.
//

#import "UITableView+ZDCellClass.h"

@implementation UITableView (ZDCellClass)
- (void)zd_RegisterCells:(NSArray <ZDCellClassType *>*)cells {
    if (!cells.count) return;
    for (ZDCellClassType *type in cells) {
        [self registerClass:NSClassFromString(type.className) forCellReuseIdentifier:type.resueIdentifier];
    }
}
- (void)zd_RegisterXibCells:(NSArray <ZDCellClassType *>*)xibCells {
    if (!xibCells.count) return;
    for (ZDCellClassType *type in xibCells) {
        UINib *nib = [UINib nibWithNibName:type.className bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:type.resueIdentifier];
    }
}
@end
