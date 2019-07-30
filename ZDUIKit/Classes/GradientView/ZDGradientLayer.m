//
//  ZDGradientLayer.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/12.
//

#import "ZDGradientLayer.h"

@implementation ZDGradientLayer
+ (instancetype)gradientBeginColor:(UIColor *)beginColor endColor:(UIColor *)endColor direction:(ZDGradientDirection)direction {
    return [[self alloc] initWithBeginColor:beginColor endColor:endColor direction:direction];
}
- (instancetype)initWithBeginColor:(UIColor *)beginColor endColor:(UIColor *)endColor direction:(ZDGradientDirection)direction {
    self = [super init];
    if (self) {
        self.colors = @[(__bridge id)beginColor.CGColor, (__bridge id)endColor.CGColor];
        switch (direction) {
            case ZDGradientDirectionTopToBottom: {
                self.startPoint = CGPointMake(0.5, 0);
                self.endPoint = CGPointMake(0.5, 1);
            }
                break;
            case ZDGradientDirectionBottomToTop: {
                self.startPoint = CGPointMake(0.5, 1);
                self.endPoint = CGPointMake(0.5, 0);
            }
                break;
            case ZDGradientDirectionLeftToRight: {
                self.startPoint = CGPointMake(0, 0.5);
                self.endPoint = CGPointMake(1, 0.5);
            }
                break;
            case ZDGradientDirectionRightToLeft: {
                self.startPoint = CGPointMake(1, 0.5);
                self.endPoint = CGPointMake(0, 0.5);
            }
                break;
        }
    }
    return self;
}
@end
