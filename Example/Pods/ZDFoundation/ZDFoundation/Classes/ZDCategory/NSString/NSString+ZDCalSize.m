//
//  NSString+ZDCalSize.m
//  ZD
//
//  Created by huhuabin on 2019/6/6.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "NSString+ZDCalSize.h"
#import "ZDFoundationMacro.h"
ZDSYNTH_DUMMY_CLASS(NSString_ZDCalSize)

@implementation NSString (ZDCalSize)
#pragma 计算字符串的高度
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    
    NSDictionary *attrs = @{NSFontAttributeName:font};
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
    
}
@end
