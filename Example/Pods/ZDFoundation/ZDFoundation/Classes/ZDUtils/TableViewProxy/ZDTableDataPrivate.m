//
//  ZDTableDataPrivate.m
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import "ZDTableDataPrivate.h"
#import "ZDTableViewProxy.h"
#import "ZDTableRow.h"
#import <objc/runtime.h>
#import "ZDFoundationMethodSwizlling.h"


static char kZDTableProxyKey;
@implementation UITableViewCell (ZDTableViewDataPrivate)
+ (void)load {
    zd_FoundationSwizzling(self, @selector(prepareForReuse), @selector(zd_prepareForReuse));
}
- (void)zd_prepareForReuse {
    ZDTableRow *row = [self.ZDTableProxy.dataBindingMap objectForKey:self];
    if (row && [row respondsToSelector:@selector(ZDTableViewCellWillDisplay:proxy:indexPath:)]) {
        NSIndexPath *indexPath = [self.ZDTableProxy.tableView indexPathForCell:self];
        [row ZDTableViewCellWillDisplay:self proxy:self.ZDTableProxy indexPath:indexPath];
    }
    [self.ZDTableProxy ZDUnbindTableDataForView:self];
    [self zd_prepareForReuse];
}
- (ZDTableViewProxy<ZDTableViewProxyPrivate> *)ZDTableProxy {
    return objc_getAssociatedObject(self, &kZDTableProxyKey);
}
- (void)setZDTableProxy:(ZDTableViewProxy<ZDTableViewProxyPrivate> *)ZDTableProxy {
    objc_setAssociatedObject(self, &kZDTableProxyKey, ZDTableProxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)ZDDisplayTableRow:(ZDTableRow *)row {
    UITableView *tableView = self.ZDTableProxy.tableView;
    if (tableView.delegate && [tableView.delegate respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)]) {
        NSIndexPath *indexPath = [tableView indexPathForCell:self];
        [tableView.delegate tableView:tableView willDisplayCell:self forRowAtIndexPath:indexPath];
    }
}
@end
