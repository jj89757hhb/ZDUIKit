//
//  ZDVerify.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/12.
//

#import "ZDVerify.h"

@implementation ZDVerify
+ (BOOL)verifyEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)verifyPhone:(NSString *)phone {
    NSString *phoneRegex = @"^((14[7])|(13[0-9])|(17[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}
+ (BOOL)verifyPureDigital:(NSString *)digitalString {
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:digitalString];
}

+ (BOOL)verifyIllegalCharacter:(NSString *)content {
    NSString *str =@"^[A-Za-z0-9\\u4e00-\u9fa5]+$";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    return ![emailTest evaluateWithObject:content];
}
+ (BOOL)verifyIdentityCard:(NSString *)identityCard {
    if (identityCard.length) return NO;
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}
+ (BOOL)verifyHaveEmptyString:(NSString *)content {
    NSRange range = [content rangeOfString:@" "];
    if (range.location != NSNotFound) {
        return YES;
    } else {
        return NO;
    }
}
@end
