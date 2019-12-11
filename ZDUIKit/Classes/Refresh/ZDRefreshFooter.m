//
//  ZDRefreshFooter.m
//  ZDOnlineSchool
//
//  Created by huhuabin on 2019/5/23.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "ZDRefreshFooter.h"

@interface ZDRefreshFooter ()
@property (nonatomic, weak) UIActivityIndicatorView *loadingView;
@end

@implementation ZDRefreshFooter
- (UIActivityIndicatorView *)loadingView {
    if (!_loadingView) {
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:self.activityIndicatorViewStyle];
        loadingView.hidesWhenStopped = YES;
        [self addSubview:_loadingView = loadingView];
    }
    return _loadingView;
}
- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle {
    _activityIndicatorViewStyle = activityIndicatorViewStyle;
    self.loadingView = nil;
    [self setNeedsLayout];
}
- (void)prepare {
    [super prepare];
    self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self setTitle:@"上拉加载" forState:MJRefreshStateIdle];
    [self setTitle:@"松开加载" forState:MJRefreshStatePulling];
    [self setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    [self setTitle:@"已经到底了哦" forState:MJRefreshStateNoMoreData];
}
- (void)placeSubviews {
    [super placeSubviews];
    // 箭头的中心点
    CGFloat arrowCenterX = self.mj_w * 0.5;
    if (!self.stateLabel.hidden) {
        arrowCenterX -= self.labelLeftInset + self.stateLabel.mj_textWidth * 0.5;
    }
    CGFloat arrowCenterY = self.mj_h * 0.5;
    CGPoint arrowCenter = CGPointMake(arrowCenterX, arrowCenterY);
    // 圈圈
    if (self.loadingView.constraints.count == 0) {
        self.loadingView.center = arrowCenter;
    }
}
- (void)setState:(MJRefreshState)state {
    MJRefreshCheckState
    if (state == MJRefreshStateRefreshing) {
        [self.loadingView startAnimating];
    } else {
        [self.loadingView stopAnimating];
    }
}
@end
