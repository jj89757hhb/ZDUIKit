//
//  UIScrollView+ZDExtend.h
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (ZDExtend)

- (void)zd_scrollToTop;

- (void)zd_scrollToBottom;

- (void)zd_scrollToLeft;

- (void)zd_scrollToRight;

- (void)zd_scrollToTopAnimated:(BOOL)animated;

- (void)zd_scrollToBottomAnimated:(BOOL)animated;

- (void)zd_scrollToLeftAnimated:(BOOL)animated;

- (void)zd_scrollToRightAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
