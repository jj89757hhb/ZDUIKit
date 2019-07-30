//
//  ZDUIAssets.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/12.
//

#import "ZDUIAssets.h"

@implementation ZDUIAssets
+ (UIImage *)imageName:(NSString *)imageName {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    return [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
}
+ (UIFont *)PFMediumFont:(CGFloat)fontSize {
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    if ([[UIDevice currentDevice].systemVersion compare:@"9.0" options:NSNumericSearch] != NSOrderedAscending) {
        font = [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize];
    }
    return font;
}
+ (UIFont *)PFRegularFont:(CGFloat)fontSize {
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    if ([[UIDevice currentDevice].systemVersion compare:@"9.0" options:NSNumericSearch] != NSOrderedAscending) {
        font = [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize];
    }
    return font;
}
+ (UIFont *)PFSemiboldFont:(CGFloat)fontSize {
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    if ([[UIDevice currentDevice].systemVersion compare:@"9.0" options:NSNumericSearch] != NSOrderedAscending) {
        font = [UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize];
    }
    return font;
}
@end
