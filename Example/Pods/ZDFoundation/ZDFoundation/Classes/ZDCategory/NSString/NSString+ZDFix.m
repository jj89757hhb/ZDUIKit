//
//  NSString+ZDFix.m
//  ZD
//
//  Created by huhuabin on 2019/6/6.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "NSString+ZDFix.h"
#import "ZDFoundationMacro.h"
ZDSYNTH_DUMMY_CLASS(NSString_ZDFix)

@implementation NSString (ZDFix)
#pragma mark --- 去掉特殊字符
+(NSString *)stringFixed:(NSString *)str{
    NSString *string=str;
    string = [string stringByReplacingOccurrencesOfString:@"</p>" withString:@"\n"];//变成换行符号 让格式存在
    NSScanner * scanner = [NSScanner scannerWithString:string];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        if ([text isEqualToString:@"<sup"]||[text isEqualToString:@"</sup"]) {//这个是平方 立方的字符，不过滤
            
        }
        else{
            if (text) {
                string = [string stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
            }
            
        }
    }
    string = [string stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    string = [string stringByReplacingOccurrencesOfString:@"&nbsp" withString:@" "];
    string = [string stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    string = [string stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    return string;
}
+(BOOL)strExistImage:(NSString*)str{
    if ([str containsString:@"<img"]) {
        return YES;
    }
    return NO;
}


+(NSString*)imageUrlFixed:(NSString*)url{
    url = [url stringByReplacingOccurrencesOfString:@"<img src=" withString:@""];
    url = [url stringByReplacingOccurrencesOfString:@"/>" withString:@""];
    url = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
    return url;
}
@end
