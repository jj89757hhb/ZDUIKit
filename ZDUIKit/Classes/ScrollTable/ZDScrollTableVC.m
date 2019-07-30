//
//  ZDScrollTableVC.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/7/6.
//

#import "ZDScrollTableVC.h"
#import "ZDUIMacros.h"
#import <ZDFoundation/ZDFoundation.h>
#import <Masonry/Masonry.h>

@interface ZDScrollTableVC ()

@end

@implementation ZDScrollTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubviews];
}
- (void)setupSubviews {
    /// 有导航栏且半透明
    BOOL isFlag = (self.navigationController && self.navigationController.navigationBar.translucent);
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.topTabBar];
    if (isFlag) {
        self.topTabBar.frame = CGRectMake(0, kZDUITopBarHeight, kZDUIScreenWidth, kZDUIScrollTopBarHeight);
    }
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(isFlag ? kZDUIScrollTopBarHeight + kZDUITopBarHeight : kZDUIScrollTopBarHeight, 0, 0, 0));
    }];
}
- (void)setViewControllers:(NSArray *)viewControllers {
    _viewControllers = viewControllers;
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    NSMutableArray *itemList = @[].mutableCopy;
    for (UIViewController *vc in viewControllers) {
        [self addChildViewController:vc];
        ZDTabItem *item = [[ZDTabItem alloc] init];
        item.title = vc.title;
        [itemList addObject:item];
    }
    self.topTabBar.items = itemList.copy;
    dispatch_async(dispatch_get_main_queue(), ^{
        self.topTabBar.selectedItemIndex = self.initialTabIndex;
        /// 刷新滚动视图
        [self.scrollView reloadDataWithCurrentPageIndex:self.initialTabIndex];
    });
}
#pragma mark ==================  ZDTabbarDelegate   ==================
- (void)tabbar:(ZDTabbar *)tabbar didSelectedItemAtIndex:(NSInteger)index {
    [self.scrollView setCurrentPageIndex:index animate:NO];
}
#pragma mark ==================  ZDBannerViewDelegate   ==================
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat x = scrollView.contentOffset.x;
    NSInteger maxIndex = (NSInteger)(self.viewControllers.count - 1);
    if (x >= 0 && x <= kZDUIScreenWidth * maxIndex) {
        [self.topTabBar updateSubViewsWhenParentScrollViewScroll:scrollView];
    }
}
- (NSInteger)numberOfPagesForBannerView:(ZDBannerView *)bannerView {
    return self.viewControllers.count;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSUInteger page = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.topTabBar.selectedItemIndex = page;
}
- (ZDBannerPageView *)bannerView:(ZDBannerView *)banner viewForPageIndex:(NSInteger)pageIndex {
    UIViewController *pageVC = [self.viewControllers zd_ObjectAtIndex:pageIndex];
    ZDBannerPageView *pageView = [banner dequeueReusablePageWithIdentifier:@"page"];
    if (!pageView) {
        pageView = [[ZDBannerPageView alloc] initWithReuseIdentifier:NSStringFromClass([pageVC class])];
    }
    if (![pageVC.view.superview isEqual:pageView]) {
        [pageView addSubview:pageVC.view];
        pageVC.view.frame = CGRectMake(0, 0, pageView.frame.size.width, pageView.frame.size.height);
        pageVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return pageView;
}
#pragma mark ==================  lazy method  ==================
- (ZDBannerView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[ZDBannerView alloc] initWithFrame:CGRectZero];
        _scrollView.delegate = self;
        _scrollView.pageControl.hidden = YES;
        ZDUIAdjustsScrollViewInsets_NO(_scrollView.scrollView, self);
    }
    return _scrollView;
}
- (ZDScrollTopBar *)topTabBar {
    if (!_topTabBar) {
        _topTabBar = [ZDScrollTopBar tabbar];
        _topTabBar.delegate = self;
    }
    return _topTabBar;
}
@end
