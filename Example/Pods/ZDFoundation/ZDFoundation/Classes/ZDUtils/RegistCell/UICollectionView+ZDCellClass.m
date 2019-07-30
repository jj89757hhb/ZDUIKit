//
//  UICollectionView+ZDCellClass.m
//  ZD
//
//  Created by huhuabin on 2019/4/13.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "UICollectionView+ZDCellClass.h"

@implementation UICollectionView (ZDCellClass)
- (void)zd_RegisterCells:(NSArray <ZDCellClassType *>*)cells {
    if (!cells.count) return;
    for (ZDCellClassType *type in cells) {
        [self registerClass:NSClassFromString(type.className) forCellWithReuseIdentifier:type.resueIdentifier];
    }
}
- (void)zd_RegisterXibCells:(NSArray <ZDCellClassType *>*)xibCells {
    if (!xibCells.count) return;
    for (ZDCellClassType *type in xibCells) {
        UINib *nib = [UINib nibWithNibName:type.className bundle:nil];
        [self registerNib:nib forCellWithReuseIdentifier:type.resueIdentifier];
    }
}
- (void)zd_RegisterXibSections:(NSArray<ZDCellClassType *>*)xibSections elementKind:(NSString *)elementKind {
    if (!xibSections.count) return;
    for (ZDCellClassType *type in xibSections) {
        UINib *nib = [UINib nibWithNibName:type.className bundle:nil];
        [self registerNib:nib forSupplementaryViewOfKind:elementKind withReuseIdentifier:type.resueIdentifier];
    }
}
- (void)zd_RegisterSections:(NSArray<ZDCellClassType *>*)sections elementKind:(NSString *)elementKind {
    if (!sections.count) return;
    for (ZDCellClassType *type in sections) {
        [self registerClass:NSClassFromString(type.className) forSupplementaryViewOfKind:elementKind withReuseIdentifier:type.resueIdentifier];
    }
}


@end
