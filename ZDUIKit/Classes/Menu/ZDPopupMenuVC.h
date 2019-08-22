//
//  ZDPopupMenuVC.h
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/27.
//

/**
 选择菜单控件
 */
@interface ZDPopupMenuVC : UIViewController
/// 弹出菜单所有项目标题
@property (nonatomic, copy, readonly) NSArray *menuTitles;
/// 当前选中的下标
@property (nonatomic, assign) NSInteger selectedIndex;
/// 选中事件
@property (nonatomic, copy) void (^didSelectedBlock)(NSInteger index);
/// 消失操作
@property (nonatomic, copy) void (^dismissBlock)(void);
/// 菜单显示的目标视图控制器
@property (nonatomic, weak, readonly) UIViewController *targetVC;

/**
 禁用初始化
 */
- (instancetype)init NS_UNAVAILABLE;

/**
 初始化方法
 @param titles 菜单标题列表
 */
- (instancetype)initWithMenuTitles:(NSArray *)titles;

/**
 显示菜单

 @param targetVC 目标视图控制器
 @param contentHeight 菜单内容显示高度
 */
- (void)presentInTargetVC:(UIViewController *)targetVC contentHeight:(CGFloat)contentHeight;

/**
 取消菜单显示
 */
- (void)dismiss;

/**
 计算所有内容高度
 */
- (CGFloat)maxContentHeight;
@end


