//
//  ZDScrollTableVC.h
//  ZDUIKit
//
//  Created by huhuabin on 2019/7/6.
//

#import "ZDBannerView.h"
#import "ZDScrollTopBar.h"

/**
 可滚动的列表视图界面
 */
@interface ZDScrollTableVC : UIViewController <ZDTabbarDelegate, ZDBannerViewDelegate>
/// 顶部选项栏
@property (nonatomic, strong) ZDScrollTopBar *topTabBar;
/// 分页滚动容器视图
@property (nonatomic, strong) ZDBannerView *scrollView;
/// 所有分页视图控制器
@property (nonatomic, copy) NSArray *viewControllers;
/// 初始化选中的索引 (默认为0)
@property (nonatomic, assign) NSInteger initialTabIndex;
@end


