//
//  NSString+ZDFix.h
//  ZD
//
//  Created by huhuabin on 2019/6/6.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZDFix)
+(NSString *)stringFixed:(NSString *)str;
+(BOOL)strExistImage:(NSString*)str;
+(NSString*)imageUrlFixed:(NSString*)url;
@end

NS_ASSUME_NONNULL_END
