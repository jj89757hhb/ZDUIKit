//
//  ZDModelID.m
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import "ZDModelID.h"
NSString *const kZDModelIDKey = @"com.xuetian.foundation.data.identify";

NSString *ZDMakeMemoryAddressIdentify(id obj) {
    void *ptr = (__bridge void *)(obj);
    return [NSString stringWithFormat:@"%p", ptr];
}

@implementation NSString (ZDModelID)
- (id)identity {
    return self;
}
@end

@implementation NSNumber (ZDModelID)
- (id)identity {
    return self;
}
@end

@implementation NSValue (ZDModelID)
- (id)identity {
    return self;
}
@end

@implementation NSDictionary (ZDModelID)
- (id)identity {
    return [self objectForKey:kZDModelIDKey];
}
@end
