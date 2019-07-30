//
//  UIView+ZDExtend.m
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "UIView+ZDExtend.h"

#import "ZDFoundationMacro.h"
ZDSYNTH_DUMMY_CLASS(UIView_ZDExtend)

@implementation UIView (ZDExtend)
- (void)zd_removeAllSubviews {
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

@end
