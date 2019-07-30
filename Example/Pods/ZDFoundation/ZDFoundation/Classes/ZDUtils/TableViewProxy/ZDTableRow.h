//
//  ZDTableRow.h
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import <Foundation/Foundation.h>
#import "ZDModelID.h"

@class ZDTableRow;
@class ZDTableViewProxy;
UIKIT_EXTERN NSString *const ZDRerenderTableCellNotify;

/// cell高
typedef CGFloat (^ZDTableCellHeightBlock)(__kindof ZDTableRow *rowData, ZDTableViewProxy *proxy, NSIndexPath *indexPath);
/// cell将要出现
typedef void (^ZDTableCellWillDisplayBlock)(__kindof ZDTableRow *rowData, __kindof UITableViewCell *cell, ZDTableViewProxy *proxy, NSIndexPath *indexPath);
/// cell 初始化
typedef void (^ZDTableCellPreparedBlock)(__kindof ZDTableRow *rowData, __kindof UITableViewCell *cell, ZDTableViewProxy *proxy, NSIndexPath *indexPath);
/// cell 点击
typedef void (^ZDTableCellDidSelectedBlock)(__kindof ZDTableRow *rowData, ZDTableViewProxy *proxy, NSIndexPath *indexPath);
/// cell 是否可编辑
typedef BOOL (^ZDTableCellCanEditBlock)(__kindof ZDTableRow *rowData, ZDTableViewProxy *proxy, NSIndexPath *indexPath);
/// cell 编辑提交
typedef void (^ZDTableCellCommitEditingBlock)(__kindof ZDTableRow *rowData, UITableViewCellEditingStyle editingStyle, ZDTableViewProxy *proxy, NSIndexPath *indexPath);

/// tableviewRow 协议
@protocol ZDTableViewRowDelegate <NSObject>
- (CGFloat)ZDTableViewCellHeightWithProxy:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath;
- (void)ZDTableViewCellWillDisplay:(__kindof UITableViewCell *)cell proxy:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath;
- (void)ZDTableViewPreparedCell:(__kindof UITableViewCell *)cell proxy:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath;
- (void)ZDTableViewCellDidSelected:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath;
- (BOOL)ZDTableViewCanEditRowWithProxy:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath;
- (void)ZDTableViewCommitEditingStyle:(UITableViewCellEditingStyle)editingStyle proxy:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath;
@optional
/// 将要重用
- (void)ZDTableViewCellWillReuse:(__kindof UITableViewCell *)cell proxy:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath;
@end
@interface ZDTableRow : NSObject <ZDModelID, ZDTableViewRowDelegate>
/// 额外信息，默认为nil
@property (nonatomic, strong) NSDictionary *infoDictionary;
/// 注册cell的类
@property (nonatomic, readonly) Class cellClass;
/// cell的重用标识符
@property (nonatomic, readonly) NSString *cellReuseID;
/// 当前显示的cell，当cell被重用时置空
@property (nonatomic, weak, readonly) __kindof UITableViewCell *cell;
/// 获取cell高度
@property (nonatomic, assign) ZDTableCellHeightBlock cellHeight;
/// cell初始化
@property (nonatomic, copy) ZDTableCellPreparedBlock cellPrepared;
/// cell将要显示
@property (nonatomic, copy) ZDTableCellWillDisplayBlock cellWillDisplay;
/// cell被选中
@property (nonatomic, copy) ZDTableCellDidSelectedBlock cellDidSelected;
/// cell是否可以编辑
@property (nonatomic, copy) ZDTableCellCanEditBlock cellCanEdit;
/// cell提交编辑
@property (nonatomic, copy) ZDTableCellCommitEditingBlock cellCommitEditing;

+ (instancetype)row;
+ (instancetype)rowWithID:(id<NSCopying>)rowid;
- (instancetype)init NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithID:(id<NSCopying>)rowid;

/**
 注册cell的类，并使用类名作为重用表示符
 */
- (void)setCellClass:(Class)cellClass;

/**
 注册cell的类
 @param reuseID 重用表示符。如果为nil，使用类名作为重用表示符
 */
- (void)setCellClass:(Class)cellClass forReuseID:(NSString *)reuseID;

/**
 重新渲染cell样式，如果cell未被重用，会触发当前数据源内部的“CKTableViewWillDisplayCell:withTableView:indexPath:”方法
 */
- (void)displayCell;
@end


