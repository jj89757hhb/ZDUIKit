//
//  ZDTableViewProxy.h
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import <Foundation/Foundation.h>
#import "ZDTableRow.h"
#import "ZDTableSection.h"

@interface ZDTableViewProxy : NSObject <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak, readonly) UITableView *tableView;
@property (nonatomic, weak) id <UITableViewDataSource> dataSource;
@property (nonatomic, weak) id <UITableViewDelegate> delegate;
/// 特定结构的数据源
@property (nonatomic, copy, readonly) NSArray <ZDTableSection <ZDTableRow *> *> *data;

/**
 工厂方法
 */
+ (instancetype)proxyWithTableView:(UITableView *)tableView;

/**
 禁用初始化方法
 */
- (instancetype)init NS_UNAVAILABLE;

/**
 初始化方法，会赋值tableView的Delegate及DataSource到当前Proxy
 */
- (instancetype)initWithTableView:(UITableView *)tableView;

/**
 重新加载数据，会强制赋值tableView的Delegate及DataSource为当前Proxy
 @param data 嵌套的列表数据
 */
- (void)reloadData:(NSArray <ZDTableSection <ZDTableRow *>*>*)data;
@end

@interface UITableView (ZDTableViewProxy)
@property (nonatomic, strong) ZDTableViewProxy *ZDProxy;
@end

@interface UIViewController (ZDTableViewProxy)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
