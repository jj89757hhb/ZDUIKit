//
//  NSString+ZDCalSize.h
//  ZD
//
//  Created by huhuabin on 2019/6/6.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSString (ZDCalSize)
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
@end


