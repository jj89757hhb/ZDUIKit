//
//  ZDGradientView.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/12.
//

#import "ZDGradientView.h"

@implementation ZDGradientView
+ (Class)layerClass {
    return [ZDGradientLayer class];
}
- (void)ZDAddGradient:(ZDGradientLayer *)layer {
    if ([self.layer isKindOfClass:[ZDGradientLayer class]]) {
        [(ZDGradientLayer *)self.layer setColors:layer.colors];
        [(ZDGradientLayer *)self.layer setStartPoint:layer.startPoint];
        [(ZDGradientLayer *)self.layer setEndPoint:layer.endPoint];
    }
}

@end
