//
//  ZDRefreshFooter.h
//  ZDOnlineSchool
//
//  Created by huhuabin on 2019/5/23.
//  Copyright © 2019 ZD. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>
/**
 加载更多footer
 */
@interface ZDRefreshFooter : MJRefreshBackStateFooter
/// 菊花类型
@property (nonatomic, assign) UIActivityIndicatorViewStyle activityIndicatorViewStyle;
@end

