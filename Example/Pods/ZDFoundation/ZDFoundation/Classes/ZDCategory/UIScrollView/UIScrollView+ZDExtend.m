//
//  UIScrollView+ZDExtend.m
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "UIScrollView+ZDExtend.h"
#import "ZDFoundationMacro.h"
ZDSYNTH_DUMMY_CLASS(UIScrollView_ZDExtend)

@implementation UIScrollView (ZDExtend)

- (void)zd_scrollToTop {
    [self zd_scrollToTopAnimated:YES];
}

- (void)zd_scrollToBottom {
    [self zd_scrollToBottomAnimated:YES];
}

- (void)zd_scrollToLeft {
    [self zd_scrollToLeftAnimated:YES];
}

- (void)zd_scrollToRight {
    [self zd_scrollToRightAnimated:YES];
}

- (void)zd_scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

- (void)zd_scrollToBottomAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

- (void)zd_scrollToLeftAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = 0 - self.contentInset.left;
    [self setContentOffset:off animated:animated];
}

- (void)zd_scrollToRightAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self setContentOffset:off animated:animated];
}

@end
