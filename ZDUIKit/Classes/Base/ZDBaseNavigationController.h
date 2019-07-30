//
//  ZDBaseNavigationController.h
//  ZDOnlineSchool
//
//  Created by huhuabin on 2019/4/23.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZDNavigationItem : NSObject
/// view正在出现中
@property (nonatomic, assign, readonly) BOOL isViewAppearing;
/// view正在消失中
@property (nonatomic, assign, readonly) BOOL isViewDisappearing;
/// 隐藏 navigationbar
@property (nonatomic, assign) BOOL navigationBarHidden;
/// 禁用 右滑返回
@property (nonatomic, assign) BOOL disableInteractivePopGestureRecognizer;
/// 动画隐藏navigationbar
- (void)setNavigationBarHidden:(BOOL)navigationBarHidden animated:(BOOL)animated;
@end

@interface UIViewController (ZDNavigationItem)
@property (nonatomic, strong, readonly, nullable) ZDNavigationItem *ZDNavigationItem;
@end

/**
 底层基础导航控制器
 */
@interface ZDBaseNavigationController : UINavigationController<UINavigationControllerDelegate>

@end
