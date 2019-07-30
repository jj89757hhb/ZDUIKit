//
//  ZDTableRow.m
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import "ZDTableRow.h"
#import "ZDTableDataPrivate.h"
#import "ZDTableViewProxy.h"

NSString *const ZDRerenderTableCellNotify = @"com.xuetian.xtfoundation.notify.RerenderTableCell";

@interface ZDTableRow () <ZDDataPrivate>
@property (nonatomic, copy) id mIdentity;
@end

@implementation ZDTableRow
+ (instancetype)row {
    return [[self alloc] init];
}
+ (instancetype)rowWithID:(id<NSCopying>)rowid {
    return [[self alloc] initWithID:rowid];
}
- (instancetype)init {
    self = [super init];
    return self;
}
- (instancetype)initWithID:(id<NSCopying>)rowid {
    if ((self = [self init])) {
        self.mIdentity = rowid;
    }
    return self;
}
- (id)identity {
    return self.mIdentity;
}
- (void)setCell:(UITableViewCell *)cell {
    _cell = cell;
}
- (void)displayCell {
    [self.cell ZDDisplayTableRow:self];
}
- (void)setCellClass:(Class)cellClass {
    [self setCellClass:cellClass forReuseID:nil];
}
- (void)setCellClass:(Class)cellClass forReuseID:(NSString *)reuseID {
    _cellClass = cellClass;
    _cellReuseID = reuseID ?: NSStringFromClass(cellClass);
}
#pragma mark ==================  ZDTableViewRowDelegate   ==================
- (CGFloat)ZDTableViewCellHeightWithProxy:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath {
    if (self.cellHeight) {
        return self.cellHeight(self, proxy, indexPath);
    }
    return UITableViewAutomaticDimension;
}
- (void)ZDTableViewCellWillDisplay:(__kindof UITableViewCell *)cell proxy:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath {
    if (self.cellWillDisplay) {
        self.cellWillDisplay(self, cell, proxy, indexPath);
    }
}
- (void)ZDTableViewPreparedCell:(__kindof UITableViewCell *)cell proxy:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath {
    if (self.cellPrepared) {
        self.cellPrepared(self, cell, proxy, indexPath);
    }
}
- (void)ZDTableViewCellDidSelected:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath {
    if (self.cellDidSelected) {
        self.cellDidSelected(self, proxy, indexPath);
    }
}
- (BOOL)ZDTableViewCanEditRowWithProxy:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath {
    if (self.cellCanEdit) {
        return self.cellCanEdit(self, proxy, indexPath);
    }
    return NO;
}
- (void)ZDTableViewCommitEditingStyle:(UITableViewCellEditingStyle)editingStyle proxy:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath {
    if (self.cellCommitEditing) {
        self.cellCommitEditing(self, editingStyle, proxy, indexPath);
    }
}

#pragma mark ==================  ZDDataPrivate   ==================

- (void)ZDBindView:(__kindof UIView *)view dataProxy:(ZDTableViewProxy <ZDTableViewProxyPrivate>*)dataProxy {
    NSAssert(view, @"ZDTableRow bind cell fail：cell is empty!");
    if (self.cell) {
        [dataProxy ZDUnbindTableDataForView:self.cell];
    }
    self.cell = view;
}
- (void)ZDUnbindViewWithProxy:(id<ZDDataProxy>)proxy {
    NSAssert(self.cell, @"ZDTableRow unbind cell fail：cell is empty!");
    self.cell = nil;
}
@end
