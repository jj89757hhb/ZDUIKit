//
//  ZDBannerPageView.h
//  ZDOnlineSchool
//
//  Created by huhuabin on 2019/5/27.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 banner的单元格视图
 */
@interface ZDBannerPageView : UIView
/// 重用标识符
@property (nonatomic, copy, readonly) NSString *reuseIdentifier;
/// 点击手势
@property (nonatomic, strong, readonly) UITapGestureRecognizer *tapGesture;

/**
 初始化
 @param reuseIdentifier 重用标识符
 @return 初始化的PageView
 */
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;

/**
 当pageView准备被重用的时候会触发这个方法
 */
- (void)prepareForReuse;
@end

