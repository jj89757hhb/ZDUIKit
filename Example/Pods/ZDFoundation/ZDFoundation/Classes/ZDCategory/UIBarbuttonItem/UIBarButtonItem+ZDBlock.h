//
//  UIBarButtonItem+ZDBlock.h
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (ZDBlock)

@property (nullable, nonatomic, copy) void (^zd_actionBlock)(id);

@end

NS_ASSUME_NONNULL_END
