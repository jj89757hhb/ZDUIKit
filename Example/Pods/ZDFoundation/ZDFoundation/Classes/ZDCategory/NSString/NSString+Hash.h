//
//  NSString+Hash.h
//  XHXUser
//
//  Created by RiverRun on 2018/8/29.
//

#import <Foundation/Foundation.h>

#define __BASE64( text )        [CommonFunc base64StringFromText:text]
#define __TEZD( base64 )        [CommonFunc textFromBase64String:base64]

@interface NSString (Hash)

/*
 函数描述 : 将文本转换为base64格式字符串
 返回参数 : (NSString *)    base64格式字符串
*/
+ (NSString *)base64StringFromText:(NSString *)text;

/*
 函数描述 : 将base64格式字符串转换为文本
 返回参数 : (NSString *)    文本
 */
+ (NSString *)textFromBase64String:(NSString *)base64;

@end
