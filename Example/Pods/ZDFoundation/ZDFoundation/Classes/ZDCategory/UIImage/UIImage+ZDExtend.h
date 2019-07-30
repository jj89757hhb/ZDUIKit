//
//  UIImage+ZDExtend.h
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ZDImageVerticalTop = 0,
    ZDImageVerticalCenter,
    ZDImageVerticalBottom
}ZDImageVertical;


typedef enum {
    ZDImageHorizontalLeft = 0,
    ZDImageHorizontalCenter,
    ZDImageHorizontalRight
}ZDImageHorizontal;


NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ZDExtend)

- (UIImage *)zd_imageForSize:(CGSize)size;
- (UIImage *)zd_getSubImage:(CGRect)rect;
- (UIImage *)zd_scaleToSmallOfSize:(CGSize)size;
- (UIImage *)zd_scaleToBigOfSize:(CGSize)size;

+ (UIImage *)zd_imageWithColor:(UIColor *)color;
+ (UIImage *)zd_imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)zd_resizedImageWithName:(NSString *)name;
+ (UIImage *)zd_resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
- (UIImage *)zd_resizedImageWithLeft:(CGFloat)left top:(CGFloat)top;
+ (UIImage *)zd_roundImageWithImage:(UIImage *)image cornerRadius:(CGFloat)radius;

- (UIImage *)zd_tintImageWithColor:(UIColor *)tintColor;

//按宽度等比例缩放（给定宽度）
- (UIImage*)zd_scaleToSmallWithWidth:(CGFloat)aWidth;

//按规定的尺寸（给定宽高）裁剪图片
//1.若图片原本宽高比大于规定的宽高比，则先将图片缩小的高度缩小／放大到规定高度，再对宽度进行裁剪，裁剪原则：vertical
//1.若图片原本宽高比小于规定的宽高比，则先将图片缩小的宽度缩小／放大到规定宽度，再对高度进行裁剪，裁剪原则：horizontal
- (UIImage *)zd_imageForSize:(CGSize)size vertical:(ZDImageVertical)vertical horizontal:(ZDImageHorizontal)horizontal;

/** 根据图片生成一张宽度或者高度跟屏幕适配的图片 */
+ (UIImage *)zd_imageByScalingToMaxSize:(UIImage *)sourceImage;

/**
 ScaleAspectFit 模式下尺寸
 
 @param size 视图的尺寸
 @return 合适的尺寸
 */
- (CGSize)zd_scaleAspectFitAsSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
