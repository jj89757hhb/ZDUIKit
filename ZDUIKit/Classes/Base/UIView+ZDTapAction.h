//
//  UIView+XTTapAction.h
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/21.
//

#import <UIKit/UIKit.h>



/**
 动态给UIView添加tap点击
 */
@interface UIView (ZDTapAction)
- (void)TapActionWithBlock:(void (^)(void))block;
@end


