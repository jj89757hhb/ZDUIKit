//
//  UIView+ZDLayout.m
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "UIView+ZDLayout.h"
#import "ZDFoundationMacro.h"
ZDSYNTH_DUMMY_CLASS(UIView_ZDLayout)

@implementation UIView (ZDLayout)

- (CGFloat)zd_x {
    return self.frame.origin.x;
}

- (void)setzd_x:(CGFloat)zd_x {
    CGRect frame = self.frame;
    frame.origin.x = zd_x;
    self.frame = frame;
}

- (CGFloat)zd_y {
     return self.frame.origin.y;
}

- (void)setzd_y:(CGFloat)zd_y {
    CGRect frame = self.frame;
    frame.origin.y = zd_y;
    self.frame = frame;
}

- (CGFloat)zd_left {
    return self.zd_x;
}

- (void)setzd_left:(CGFloat)zd_left {
    self.zd_x = zd_left;
}

- (CGFloat)zd_top {
    return self.zd_y;
}

- (void)setzd_top:(CGFloat)zd_top {
    self.zd_y = zd_top;
}

- (CGFloat)zd_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setzd_right:(CGFloat)zd_right {
    CGRect frame = self.frame;
    frame.origin.x = zd_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)zd_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setzd_bottom:(CGFloat)zd_bottom {
    CGRect frame = self.frame;
    frame.origin.y = zd_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)zd_width {
    return self.frame.size.width;
}

- (void)setzd_width:(CGFloat)zd_width {
    CGRect frame = self.frame;
    frame.size.width = zd_width;
    self.frame = frame;
}

- (CGFloat)zd_height {
    return self.frame.size.height;
}

- (void)setzd_height:(CGFloat)zd_height {
    CGRect frame = self.frame;
    frame.size.height = zd_height;
    self.frame = frame;
}

- (CGFloat)zd_centerX {
    return self.center.x;
}

- (void)setzd_centerX:(CGFloat)zd_centerX {
    self.center = CGPointMake(zd_centerX, self.center.y);
}

- (CGFloat)zd_centerY {
    return self.center.y;
}

- (void)setzd_centerY:(CGFloat)zd_centerY {
    self.center = CGPointMake(self.center.x, zd_centerY);
}

- (CGPoint)zd_origin {
    return self.frame.origin;
}

- (void)setzd_origin:(CGPoint)zd_origin {
    CGRect frame = self.frame;
    frame.origin = zd_origin;
    self.frame = frame;
}

- (CGSize)zd_size {
    return self.frame.size;
}

- (void)setzd_size:(CGSize)zd_size {
    CGRect frame = self.frame;
    frame.size = zd_size;
    self.frame = frame;
}

@end
