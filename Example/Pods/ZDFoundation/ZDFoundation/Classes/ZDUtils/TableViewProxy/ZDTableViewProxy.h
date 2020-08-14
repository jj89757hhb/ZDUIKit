//
//  ZDTableViewProxy.h
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import <Foundation/Foundation.h>
#import "ZDTableRow.h"
#import "ZDTableSection.h"
//scrollView相关回调
typedef void (^ScrollViewDidScroll)(UIScrollView *scrollView);
typedef void (^ScrollViewDidZoom)(UIScrollView *scrollView);
typedef void (^ScrollViewDidScrollToTop)(UIScrollView *scrollView);
typedef void (^ScrollViewWillBeginDragging)(UIScrollView *scrollView);
typedef void (^ScrollViewDidEndDecelerating)(UIScrollView *scrollView);
typedef void (^ScrollViewDidEndScrollingAnimation)(UIScrollView *scrollView);
typedef void (^ScrollViewWillBeginDecelerating)(UIScrollView *scrollView);
typedef void (^ScrollViewWillBeginZooming_withView)(UIScrollView *scrollView, UIView *view);
typedef void (^ScrollViewWillEndDragging_withVelocity_targetContentOffset)(UIScrollView *scrollView,CGPoint velocity, CGPoint *targetContentOffset);
typedef void (^ScrollViewDidEndDragging_willDecelerate)(UIScrollView *scrollView, BOOL decelerate);
typedef void (^ScrollViewDidChangeAdjustedContentInset)(UIScrollView *scrollView);

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
@property (nonatomic,copy) ScrollViewDidScroll scrollViewDidScroll;
@property (nonatomic,copy) ScrollViewDidZoom scrollViewDidZoom;
@property (nonatomic,copy) ScrollViewDidScrollToTop scrollViewDidScrollToTop;
@property (nonatomic,copy) ScrollViewWillBeginDragging scrollViewWillBeginDragging;
@property (nonatomic,copy) ScrollViewDidEndDecelerating scrollViewDidEndDecelerating;
@property (nonatomic,copy) ScrollViewDidEndScrollingAnimation scrollViewDidEndScrollingAnimation;
@property (nonatomic,copy) ScrollViewWillBeginDecelerating scrollViewWillBeginDecelerating;
@property (nonatomic,copy) ScrollViewWillBeginZooming_withView scrollViewWillBeginZooming_withView;
@property (nonatomic,copy) ScrollViewWillEndDragging_withVelocity_targetContentOffset scrollViewWillEndDragging_withVelocity_targetContentOffset;
@property (nonatomic,copy) ScrollViewDidEndDragging_willDecelerate scrollViewDidEndDragging_willDecelerate;
@property (nonatomic,copy) ScrollViewDidChangeAdjustedContentInset scrollViewDidChangeAdjustedContentInset;

@end

@interface UITableView (ZDTableViewProxy)
@property (nonatomic, strong) ZDTableViewProxy *ZDProxy;
@end

@interface UIViewController (ZDTableViewProxy)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
