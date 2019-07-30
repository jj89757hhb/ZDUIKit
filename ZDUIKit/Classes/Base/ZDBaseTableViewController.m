//
//  ZDBaseTableViewController.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/20.
//

#import "ZDBaseTableViewController.h"

@interface ZDBaseTableViewController ()

@end

@implementation ZDBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupBaseTable];
}
- (void)setupBaseTable {
    [self.view addSubview:self.baseTable];
}
- (void)reloadDataSource:(NSArray<ZDTableSection<ZDTableRow *> *> *)datasources {
    [self.baseTable.ZDProxy reloadData:datasources];
}
#pragma mark ==================  lazy method  ==================
- (UITableView *)baseTable {
    if (!_baseTable) {
        _baseTable = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        /// 没有分割线
        _baseTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _baseTable.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _baseTable.ZDProxy = [ZDTableViewProxy proxyWithTableView:_baseTable];
        _baseTable.hidden = YES;
    }
    return _baseTable;
}
@end
