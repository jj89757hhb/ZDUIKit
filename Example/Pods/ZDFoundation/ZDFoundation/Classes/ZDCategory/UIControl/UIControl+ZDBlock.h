//
//  UIControl+ZDBlock.h
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (ZDBlock)

- (void)zd_removeAllTargets;

- (void)zd_setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

- (void)zd_addBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block;

- (void)zd_setBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block;

- (void)zd_removeAllBlocksForControlEvents:(UIControlEvents)controlEvents;

@end
