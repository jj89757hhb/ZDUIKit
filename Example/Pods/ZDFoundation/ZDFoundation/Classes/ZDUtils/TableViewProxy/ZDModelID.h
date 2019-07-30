//
//  ZDModelID.h
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import <Foundation/Foundation.h>

UIKIT_EXTERN NSString *const kZDModelIDKey;

NSString *ZDMakeMemoryAddressIdentify(id obj);

@protocol ZDModelID <NSObject>
- (id)identity;
@end

@interface NSString (ZDModelID) <ZDModelID>
@end

@interface NSNumber (ZDModelID) <ZDModelID>
@end

@interface NSValue (ZDModelID) <ZDModelID>
@end

@interface NSDictionary (ZDModelID) <ZDModelID>
@end
