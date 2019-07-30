//
//  UIView+XTTapAction.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/21.
//

#import "UIView+ZDTapAction.h"
#import <objc/runtime.h>

static char kXTTapGestureKey;
static char kXTTapBlockKey;
@implementation UIView (ZDTapAction)
- (void)TapActionWithBlock:(void (^)(void))block {
    UITapGestureRecognizer *tapGR = objc_getAssociatedObject(self, &kXTTapGestureKey);
    if (!tapGR) {
        tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handlerActionForTapGesture:)];
        [self addGestureRecognizer:tapGR];
        objc_setAssociatedObject(self, &kXTTapGestureKey, tapGR, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kXTTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)handlerActionForTapGesture:(UITapGestureRecognizer *)tapGesture {
    if (tapGesture.state == UIGestureRecognizerStateRecognized) {
        void (^tapAction)(void) = objc_getAssociatedObject(self, &kXTTapBlockKey);
        if (tapAction) tapAction();
    }
}
@end
