//
//  ZDBaseNavigationController.m
//  ZDOnlineSchool
//
//  Created by huhuabin on 2019/4/23.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "ZDBaseNavigationController.h"
#import <objc/runtime.h>
#import "ZDUIMethodSwizzling.h"

@interface ZDNavigationItem ()
@property (nonatomic, weak) UINavigationController *navigationController;
@property (nonatomic, assign, readwrite) BOOL isViewAppearing;
@property (nonatomic, assign, readwrite) BOOL isViewDisappearing;
/// 更新 navigationbar的显隐
- (void)updateNavigationBarHiddenAnimated:(BOOL)animated;
@end

@implementation ZDNavigationItem
- (void)setNavigationBarHidden:(BOOL)navigationBarHidden {
    [self setNavigationBarHidden:navigationBarHidden animated:NO];
}
- (void)setNavigationBarHidden:(BOOL)navigationBarHidden animated:(BOOL)animated {
    _navigationBarHidden = navigationBarHidden;
    [self updateNavigationBarHiddenAnimated:animated];
}
- (void)updateNavigationBarHiddenAnimated:(BOOL)animated {
    if (self.navigationController && self.navigationController.navigationBarHidden != _navigationBarHidden) {
        [self.navigationController setNavigationBarHidden:_navigationBarHidden animated:animated];
    }
}
@end

static char kZDNavigationItemKey;
@implementation UIViewController (ZDNavigationItem)
@dynamic ZDNavigationItem;
- (ZDNavigationItem *)ZDNavigationItem {
    ZDNavigationItem *item = objc_getAssociatedObject(self, &kZDNavigationItemKey);
    if (!item) {
        item = [ZDNavigationItem new];
        objc_setAssociatedObject(self, &kZDNavigationItemKey, item, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return item;
}
+ (void)load {
    ZDUIKitSwizzling(self, @selector(viewWillAppear:), @selector(_zd_viewWillAppear:));
    ZDUIKitSwizzling(self, @selector(viewDidAppear:), @selector(_zd_viewDidAppear:));
    ZDUIKitSwizzling(self, @selector(viewWillDisappear:), @selector(_zd_viewWillDisappear:));
    ZDUIKitSwizzling(self, @selector(viewDidDisappear:), @selector(_zd_viewDidDisappear:));
}

- (void)_zd_viewWillAppear:(BOOL)animated {
    self.ZDNavigationItem.isViewAppearing = YES;
    [self _zd_viewWillAppear:animated];
}
- (void)_zd_viewDidAppear:(BOOL)animated {
    if (self.ZDNavigationItem) {
        self.ZDNavigationItem.isViewAppearing = NO;
        // 正在消失
        if (self.ZDNavigationItem.isViewDisappearing) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.ZDNavigationItem updateNavigationBarHiddenAnimated:NO];
            });
        }
    }
    [self _zd_viewDidAppear:animated];
}
- (void)_zd_viewWillDisappear:(BOOL)animated {
    self.ZDNavigationItem.isViewDisappearing = YES;
    [self _zd_viewWillDisappear:animated];
}
- (void)_zd_viewDidDisappear:(BOOL)animated {
    self.ZDNavigationItem.isViewDisappearing = NO;
    [self _zd_viewDidDisappear:animated];
}
@end


@interface ZDBaseNavigationController ()<UIGestureRecognizerDelegate>
@end
@implementation ZDBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.interactivePopGestureRecognizer.delegate = self;
    [super setDelegate:self];
}
//支持旋转
- (BOOL)shouldAutorotate{
    return [self.topViewController shouldAutorotate];
}
//支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}
//默认的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

#pragma mark ==================  UIGestureRecognizerDelegate   ==================
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        if (self.viewControllers.count < 2 || self.visibleViewController == [self.viewControllers objectAtIndex:0]) {
            return NO;
        }
        UIViewController *topVC = [self topViewController];
        if (topVC.ZDNavigationItem.disableInteractivePopGestureRecognizer) {
            return NO;
        }
    }
    return YES;
}
#pragma mark ==================  UINavigationControllerDelegate   ==================
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(nonnull UIViewController *)viewController animated:(BOOL)animated {
    viewController.ZDNavigationItem.navigationController = self;
    [viewController.ZDNavigationItem updateNavigationBarHiddenAnimated:animated];
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = !viewController.ZDNavigationItem.disableInteractivePopGestureRecognizer;
    }
}
@end
