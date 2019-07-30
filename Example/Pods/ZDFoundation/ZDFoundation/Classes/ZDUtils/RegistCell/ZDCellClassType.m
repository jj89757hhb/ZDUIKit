//
//  ZDCellClassType.m
//  ZD
//
//  Created by huhuabin on 2019/4/13.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "ZDCellClassType.h"

@implementation ZDCellClassType
+ (instancetype)zd_CellClassTypeWithClassName:(NSString *)className resueIdentifier:(NSString *)resueIdentifier {
    ZDCellClassType *type = [[self class] new];
    type.className = className;
    type.resueIdentifier = resueIdentifier.length ? resueIdentifier : className;
    return type;
}
+ (instancetype)zd_CellClassTypeWithClassName:(NSString *)className {
    return [self zd_CellClassTypeWithClassName:className resueIdentifier:nil];
}
@end
