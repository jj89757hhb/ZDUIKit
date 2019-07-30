//
//  ZDDataProxy.h
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import <Foundation/Foundation.h>


/**
 数据代理协议
 */
@protocol ZDDataProxy <NSObject>
- (NSMapTable *)dataBindingMap;
@end

/**
 私有的数据协议
 */
@protocol ZDDataPrivate <NSObject>
- (void)ZDBindView:(__kindof UIView *)view dataProxy:(id <ZDDataProxy>)dataProxy;
- (void)ZDUnbindViewWithProxy:(id <ZDDataProxy>)proxy;
@end
