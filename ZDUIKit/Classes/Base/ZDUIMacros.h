//
//  ZDUIMacros.h
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/27.
//

#ifndef ZDUIMacros_h
#define ZDUIMacros_h

#define ZDUIRGB(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define ZDUIRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define ZDUIHEXColor(v) ZDUIRGB((v & 0xFF0000) >> 16, (v & 0xFF00) >> 8, (v & 0xFF))
/// 随机色
#define ZDUIRandomColor ZDUIRGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

#pragma mark ==================  颜色设置   ==================
/// 背景色
#define kZDUIBgColor ZDUIRGB(243, 243, 243)
/// 主色调
#define kZDUIMainColor ZDUIRGB(41, 143, 237)
/// 线的颜色
#define kZDUILineColor ZDUIRGB(229, 229, 229)
/// 黑色
#define kZDUIDarkColor ZDUIRGB(51, 51, 51)
/// 中灰色
#define kZDUIMiddleGrayColor ZDUIRGB(102, 102, 102)
///  深灰色
#define kZDUIDarkGrayColor ZDUIRGB(153, 153, 153)
/// 浅灰色
#define kZDUILightGrayColor ZDUIRGB(219, 219, 219)

/// 淡蓝
#define kZDUILightBlueColor ZDUIRGB(55, 171, 252)
/// 橘红
#define kZDUIRedColor   ZDUIRGB(231, 107, 83)
/// 青色
#define kZDUIGreenColor  ZDUIRGB(111, 194, 132)

/// 红色
#define kZDUINormalRedColor ZDUIRGB(228, 89, 63)

#pragma mark ==================  屏幕相关   ==================
/// 判断是否是iPad
#define kZDUIIsIPad  ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
/// 屏幕的宽
#define kZDUIScreenWidth   [[UIScreen mainScreen] bounds].size.width
/// 屏幕的高
#define kZDUIScreenHeight  [[UIScreen mainScreen] bounds].size.height
/// 屏幕的高宽比
#define kZDUIScreenRatio   kZDUIScreenHeight / kZDUIScreenWidth
#define kZDUIScreenWidthRatio  kZDUIScreenWidth / 320.0
/// 状态栏高度
#define kZDUIStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
/// 导航栏的高度
#define kZDUINavigationBarHeight  44
/// 头部的高 (状态栏 + 导航栏)
#define kZDUITopBarHeight  (kZDUIStatusBarHeight + kZDUINavigationBarHeight)
/// tabbar 的高
#define kZDUITabbarHeight 49
/// 底部bar的高 (tabbar的高 + 安全区的高)
#define kZDUIBottomBarHeight  (kZDUIStatusBarHeight > 20 ? 83 : 49)
/// 底部安全区的高度
#define kZDUIBottomSafeAreaHeight  (kZDUIStatusBarHeight > 20 ? 34 : 0)

#pragma mark ==================  宏方法   ==================
#define  ZDUIAdjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
NSMethodSignature *signature = [UIScrollView instanceMethodSignatureForSelector:@selector(setContentInsetAdjustmentBehavior:)];\
NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];\
NSInteger argumet = 2;\
invocation.target = scrollView;\
invocation.selector = @selector(setContentInsetAdjustmentBehavior:);\
[invocation setArgument:&argumet atIndex:2];\
[invocation invoke];\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)

#endif /* ZDUIMacros_h */
