//
//  NSString+ZDMD5.m
//  ZDNetwork
//
//  Created by huhuabin on 2019/4/10.
//  Copyright © 2019 mistong. All rights reserved.
//

#import "NSString+ZDMD5.h"
#import <CommonCrypto/CommonDigest.h>
#import "ZDFoundationMacro.h"
ZDSYNTH_DUMMY_CLASS(NSString_ZDMD5)

@implementation NSString (ZDMD5)
- (NSString *)zd_MD5 {
    const char *cstr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cstr, (CC_LONG)strlen(cstr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
@end
