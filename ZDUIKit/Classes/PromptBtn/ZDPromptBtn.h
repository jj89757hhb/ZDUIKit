//
//  ZDPromptBtn.h
//  ZDOnlineSchool
//
//  Created by huhuabin on 2019/5/22.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 红点提示视图
 */
@interface ZDPromptBtn : UIControl

/// 初始化
+ (instancetype)promptWithImage:(UIImage *)image;
- (void)setPromptNumber:(NSInteger)number;
@end

