//
//  ZDBaseTableViewController.h
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/20.
//
#import "ZDBaseViewController.h"
#import <ZDFoundation/ZDTableViewProxy.h>


/**
 TableView 基础控制器
 */
@interface ZDBaseTableViewController : ZDBaseViewController
@property (nonatomic, strong) UITableView *baseTable;
/// 创建tableView
- (void)setupBaseTable;
/// 更新列表
- (void)reloadDataSource:(NSArray <ZDTableSection <ZDTableRow *>*>*)datasources;
@end

