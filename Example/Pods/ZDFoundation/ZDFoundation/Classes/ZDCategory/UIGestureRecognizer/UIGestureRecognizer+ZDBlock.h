//
//  UIGestureRecognizer+ZDBlock.h
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIGestureRecognizer (ZDBlock)

- (instancetype)initWithActionBlock:(void (^)(id sender))block;

- (void)zd_addActionBlock:(void (^)(id sender))block;

- (void)zd_removeAllActionBlocks;
@end

