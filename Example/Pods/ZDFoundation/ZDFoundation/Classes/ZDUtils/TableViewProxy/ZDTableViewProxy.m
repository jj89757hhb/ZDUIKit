//
//  ZDTableViewProxy.m
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import "ZDTableViewProxy.h"
#import <objc/runtime.h>
#import "ZDTableDataPrivate.h"
#import "ZDMultipleProxy.h"
#import "NSMutableArray+ZDSafe.h"


@interface ZDTableViewProxy () <ZDTableViewProxyPrivate>
@property (nonatomic, strong) ZDMultipleProxy *dataSourceProxy;
@property (nonatomic, strong) ZDMultipleProxy *delegateProxy;
@property (nonatomic, strong) NSMutableSet *headerFooterClassSet;
@property (nonatomic, strong) NSMutableSet *cellClassSet;
@property (nonatomic, weak) NSMapTable *dataBindingMap;
@end

@implementation ZDTableViewProxy
- (void)dealloc {
    [self ZDUnbindAllTableData];
}
+ (instancetype)proxyWithTableView:(UITableView *)tableView {
    return [[self alloc] initWithTableView:tableView];
}
- (instancetype)initWithTableView:(UITableView *)tableView {
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    return self;
}
- (void)setDataSource:(id<UITableViewDataSource>)dataSource {
    _dataSource = dataSource;
    if (dataSource) {
        self.dataSourceProxy = [ZDMultipleProxy proxyWithObjects:@[self, dataSource]];
        self.tableView.dataSource = (id)self.dataSourceProxy;
    } else {
        self.tableView.dataSource = self;
    }
}
- (void)setDelegate:(id<UITableViewDelegate>)delegate {
    _delegate = delegate;
    if (delegate) {
        self.delegateProxy = [ZDMultipleProxy proxyWithObjects:@[self, delegate]];
        self.tableView.delegate = (id)self.delegateProxy;
    } else {
        self.tableView.delegate = self;
    }
}
- (void)reloadData:(NSArray <ZDTableSection <ZDTableRow *> *> *)data {
    [self ZDUnbindAllTableData];
    _data = data;
    [self registeAllClassForData:data];
    [self.tableView reloadData];
}
#pragma mark ==================  Registe Classes   ==================
/// 注册 headers、footers、cells
- (void)registeAllClassForData:(NSArray <ZDTableSection <ZDTableRow *>*> *)data {
    [self registeCellClass:UITableViewCell.class reuseIdentifier:@"UITableViewCell"];
    for (ZDTableSection *section in data) {
        [self registeSectionHeaderFooterViewClass:section.headerClass reuseIdentifier:section.headerReuseID];
        [self registeSectionHeaderFooterViewClass:section.footerClass reuseIdentifier:section.footerReuseID];
        for (ZDTableRow *row in section) {
            [self registeCellClass:row.cellClass reuseIdentifier:row.cellReuseID];
        }
    }
}
- (void)registeCellClass:(Class)cellClass reuseIdentifier:(NSString *)identifier {
    if (cellClass && ![self.cellClassSet containsObject:identifier]) {
        [self.tableView registerClass:cellClass forCellReuseIdentifier:identifier];
        [self.cellClassSet addObject:identifier];
    }
}
- (void)registeSectionHeaderFooterViewClass:(Class)viewClass reuseIdentifier:(NSString *)identifier {
    if (viewClass && ![self.headerFooterClassSet containsObject:identifier]) {
        [self.tableView registerClass:viewClass forHeaderFooterViewReuseIdentifier:identifier];
        [self.headerFooterClassSet addObject:identifier];
    }
}

#pragma mark ==================  ZDTableViewProxyPrivate   ==================
/// 数据与view绑定
- (void)ZDBindTableData:(id <ZDDataPrivate>)data forView:(__kindof UIView *)view {
    [data ZDBindView:view dataProxy:self];
    [self.dataBindingMap setObject:data forKey:view];
}
/// 数据与view解绑
- (void)ZDUnbindTableDataForView:(__kindof UIView *)view {
    id <ZDDataPrivate> data = [self.dataBindingMap objectForKey:view];
    if (data) {
        [data ZDUnbindViewWithProxy:self];
        [self.dataBindingMap removeObjectForKey:view];
    }
}
/// 解绑所有
- (void)ZDUnbindAllTableData {
    for (id <ZDDataPrivate> data in self.dataBindingMap.objectEnumerator) {
        [data ZDUnbindViewWithProxy:self];
    }
    [self.dataBindingMap removeAllObjects];
}

#pragma mark ==================  NSProxy   ==================
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [self.tableView methodSignatureForSelector:aSelector];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [anInvocation invokeWithTarget:self.tableView];
}
#pragma mark ==================  UITableView dataSource and delegate  ==================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.data count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.data zd_ObjectAtIndex:section] count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDTableRow *row = [[self.data zd_ObjectAtIndex:indexPath.section] zd_ObjectAtIndex:indexPath.row];
    return [row ZDTableViewCellHeightWithProxy:self indexPath:indexPath];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    ZDTableSection *data = [self.data zd_ObjectAtIndex:section];
    return [data ZDTableViewHeaderHeightWithProxy:self section:section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    ZDTableSection *data = [self.data zd_ObjectAtIndex:section];
    return [data ZDTableViewFooterHeightWithProxy:self section:section];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZDTableSection *data = [self.data zd_ObjectAtIndex:section];
    if (!data.headerClass) return nil;
    
    NSString *identifier = data.headerReuseID;
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    [data ZDTableViewHeader:view preparedWithProxy:self section:section];
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    ZDTableSection *data = [self.data zd_ObjectAtIndex:section];
    if (!data.footerClass) return nil;
    
    NSString *identifier = data.footerReuseID;
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    [data ZDTableViewFooter:view preparedWithProxy:self section:section];
    return view;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDTableRow *row = [[self.data zd_ObjectAtIndex:indexPath.section] zd_ObjectAtIndex:indexPath.row];
    NSString *identifier = row.cellClass ? row.cellReuseID : @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    /// 设置proxy属性 是为了在prepareForReuse 的时候需要获取cell所在的indexPath（可能会用到 因为是协议可选方法）
    cell.ZDTableProxy = self;
    /// cell与row进行绑定
    [self ZDBindTableData:(id <ZDDataPrivate>)row forView:cell];
    [row ZDTableViewPreparedCell:cell proxy:self indexPath:indexPath];
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDTableRow *row = [[self.data zd_ObjectAtIndex:indexPath.section] zd_ObjectAtIndex:indexPath.row];
    return [row ZDTableViewCanEditRowWithProxy:self indexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDTableRow *row = [[self.data zd_ObjectAtIndex:indexPath.section] zd_ObjectAtIndex:indexPath.row];
    [row ZDTableViewCommitEditingStyle:editingStyle proxy:self indexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDTableRow *row = [[self.data zd_ObjectAtIndex:indexPath.section] zd_ObjectAtIndex:indexPath.row];
    [row ZDTableViewCellWillDisplay:cell proxy:self indexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDTableRow *row = [[self.data zd_ObjectAtIndex:indexPath.section] zd_ObjectAtIndex:indexPath.row];
    [row ZDTableViewCellDidSelected:self indexPath:indexPath];
}
#pragma mark ==================  lazy method  ==================
- (NSMutableSet *)headerFooterClassSet {
    if (!_headerFooterClassSet) {
        _headerFooterClassSet = [NSMutableSet set];
    }
    return _headerFooterClassSet;
}
- (NSMutableSet *)cellClassSet {
    if (!_cellClassSet) {
        _cellClassSet = [NSMutableSet set];
    }
    return _cellClassSet;
}
- (NSMapTable *)dataBindingMap {
    if (!_dataBindingMap) {
        _dataBindingMap = [NSMapTable strongToStrongObjectsMapTable];
    }
    return _dataBindingMap;
}

//***scrollView的相关代理***
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.scrollViewDidScroll) {
        self.scrollViewDidScroll(scrollView);
    }
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    if (self.scrollViewDidZoom) {
        self.scrollViewDidZoom(scrollView);
    }
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    if (self.scrollViewDidScrollToTop) {
        self.scrollViewDidScrollToTop(scrollView);
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (self.scrollViewWillBeginDragging) {
        self.scrollViewWillBeginDragging(scrollView);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.scrollViewDidEndDecelerating) {
        self.scrollViewDidEndDecelerating(scrollView);
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if (self.scrollViewDidEndScrollingAnimation) {
        self.scrollViewDidEndScrollingAnimation(scrollView);
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    if (self.scrollViewWillBeginDecelerating) {
        self.scrollViewWillBeginDecelerating(scrollView);
    }
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
    if (self.scrollViewWillBeginZooming_withView) {
        self.scrollViewWillBeginZooming_withView(scrollView, view);
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (self.scrollViewDidEndDragging_willDecelerate) {
        self.scrollViewDidEndDragging_willDecelerate(scrollView, decelerate);
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    if (self.scrollViewWillEndDragging_withVelocity_targetContentOffset) {
        self.scrollViewWillEndDragging_withVelocity_targetContentOffset(scrollView, velocity, targetContentOffset);
    }
}

#pragma mark ios11以上才有效
- (void)scrollViewDidChangeAdjustedContentInset:(UIScrollView *)scrollView{
    if (self.scrollViewDidChangeAdjustedContentInset) {
        self.scrollViewDidChangeAdjustedContentInset(scrollView);
    }
}

@end

static char kZDProxyKey;
@implementation UITableView (ZDTableViewProxy)
- (ZDTableViewProxy *)ZDProxy {
    return objc_getAssociatedObject(self, &kZDProxyKey);
}
- (void)setZDProxy:(ZDTableViewProxy *)ZDProxy {
    objc_setAssociatedObject(self, &kZDProxyKey, ZDProxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end

@implementation UIViewController (ZDTableViewProxy)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableView.ZDProxy tableView:tableView numberOfRowsInSection:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView.ZDProxy tableView:tableView cellForRowAtIndexPath:indexPath];
}
@end
