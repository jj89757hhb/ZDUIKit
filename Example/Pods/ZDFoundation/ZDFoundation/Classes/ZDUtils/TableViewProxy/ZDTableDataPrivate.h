//
//  ZDTableDataPrivate.h
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import <Foundation/Foundation.h>
#import "ZDDataProxy.h"

@class ZDTableRow;
@class ZDTableViewProxy;

@protocol ZDTableViewProxyPrivate <ZDDataProxy>
/// 数据与view绑定
- (void)ZDBindTableData:(id <ZDDataPrivate>)data forView:(__kindof UIView *)view;
/// 数据与view解绑
- (void)ZDUnbindTableDataForView:(__kindof UIView *)view;
/// 解绑所有
- (void)ZDUnbindAllTableData;
@end

@interface UITableViewCell (ZDTableViewDataPrivate)
@property (nonatomic, strong) ZDTableViewProxy <ZDTableViewProxyPrivate>*ZDTableProxy;
// cell通过row展示
- (void)ZDDisplayTableRow:(ZDTableRow *)row;
@end
