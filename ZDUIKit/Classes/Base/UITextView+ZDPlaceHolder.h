//
//  UITextView+XTPlaceHolder.h
//  ZDUIKit
//
//  Created by huhuabin on 2019/7/3.
//

#import <UIKit/UIKit.h>


/**
 textView 扩展
 */
@interface UITextView (XTPlaceHolder)
/**
 *  place holder
 */
@property (nonatomic,strong,nullable) NSString * placeHolder;


/**
 *  place holder Label
 */
@property (nonatomic,strong,readonly,nullable) UILabel * placeHolderLabel;

/**
 *  The font of placeHolder. If null it's equal to the font of UITextView
 */
@property (nonatomic,strong,nullable)  UIFont * placeHolderFont;

/**
 *  The color of placeHolder.Default is light gray. Not be null.
 */
@property (nonatomic,strong,nonnull) UIColor * placeHolderColor;
@end

