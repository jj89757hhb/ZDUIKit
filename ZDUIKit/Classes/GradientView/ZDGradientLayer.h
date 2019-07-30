//
//  ZDGradientLayer.h
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/12.
//

#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, ZDGradientDirection) {
    ZDGradientDirectionTopToBottom, // 从上到下
    ZDGradientDirectionBottomToTop, // 从下到上
    ZDGradientDirectionLeftToRight, // 从左到右
    ZDGradientDirectionRightToLeft, // 从右到左
};

@interface ZDGradientLayer : CAGradientLayer
+ (instancetype)gradientBeginColor:(UIColor *)beginColor endColor:(UIColor *)endColor direction:(ZDGradientDirection)direction;
@end

/**
 内联函数 创建GradientLayer
 */
NS_INLINE ZDGradientLayer *ZDCreateGradientLayer(UIColor *beiginColor, UIColor *endColor, ZDGradientDirection direction) {
    return [ZDGradientLayer gradientBeginColor:beiginColor endColor:endColor direction:direction];
}

