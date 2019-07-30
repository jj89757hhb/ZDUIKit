//
//  ZDRefreshHeader.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/12.
//

#import "ZDRefreshHeader.h"
#import <Masonry/Masonry.h>
#import "ZDUIAssets.h"

@interface ZDRefreshHeader () {
    __unsafe_unretained UIImageView *_gifView;
}
/** 所有状态对应的动画图片 */
@property (strong, nonatomic) NSMutableDictionary *stateImages;
/** 所有状态对应的动画时间 */
@property (strong, nonatomic) NSMutableDictionary *stateDurations;
@end

@implementation ZDRefreshHeader
#pragma mark - 懒加载
- (UIImageView *)gifView {
    if (!_gifView) {
        UIImageView *gifView = [[UIImageView alloc] init];
        gifView.mj_w = 28;
        gifView.mj_h = 28;
        [self addSubview:_gifView = gifView];
    }
    return _gifView;
}
    
- (NSMutableDictionary *)stateImages {
    if (!_stateImages) {
        self.stateImages = [NSMutableDictionary dictionary];
    }
    return _stateImages;
}
    
- (NSMutableDictionary *)stateDurations {
    if (!_stateDurations) {
        self.stateDurations = [NSMutableDictionary dictionary];
    }
    return _stateDurations;
}
    
#pragma mark - 公共方法
- (void)setImages:(NSArray *)images duration:(NSTimeInterval)duration forState:(MJRefreshState)state {
    if (images == nil) return;
    self.stateImages[@(state)] = images;
    self.stateDurations[@(state)] = @(duration);
    
    /* 根据图片设置控件的高度 */
    UIImage *image = [images firstObject];
    if (image.size.height > self.mj_h) {
        self.mj_h = image.size.height;
    }
}
    
- (void)setImages:(NSArray *)images forState:(MJRefreshState)state{
    [self setImages:images duration:images.count * 0.1 forState:state];
}
    
#pragma mark - 实现父类的方法
- (void)prepare {
    [super prepare];
    
    // 初始化间距
    self.labelLeftInset = 20;
    
    //所有的自定义东西都放在这里
    [self setTitle:@"刷新成功" forState:MJRefreshStateIdle];
    [self setTitle:@"松开进行刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"正在刷新" forState:MJRefreshStateRefreshing];
    [self setTitle:@"即将刷新" forState:MJRefreshStateWillRefresh];
    [self setTitle:@"数据加载完毕" forState:MJRefreshStateNoMoreData];

    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    UIImage *image = [ZDUIAssets imageName:@"ZDRefresh01"];
    [idleImages addObject:image];
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *willRefreshImages = [NSMutableArray array];
    UIImage *image1 = [ZDUIAssets imageName:@"ZDRefresh01"];
    [willRefreshImages addObject:image1];
    [self setImages:willRefreshImages forState:MJRefreshStatePulling];
    
    
    NSMutableArray *refreshingingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=9; i++) {
        UIImage *image = [ZDUIAssets imageName:[NSString stringWithFormat:@"ZDRefresh0%zd", i]];
        [refreshingingImages addObject:image];
    }
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingingImages forState:MJRefreshStateRefreshing];
}
- (void)setState:(MJRefreshState)state {
    MJRefreshCheckState
    // 根据状态做事情
    if (state == MJRefreshStatePulling || state == MJRefreshStateRefreshing) {
        NSArray *images = self.stateImages[@(state)];
        if (images.count == 0) return;
        
        [self.gifView stopAnimating];
        if (images.count == 1) { // 单张图片
            self.gifView.image = [images lastObject];
        } else { // 多张图片
            self.gifView.animationImages = images;
            self.gifView.animationDuration = [self.stateDurations[@(state)] doubleValue];
            [self.gifView startAnimating];
        }
    } else if (state == MJRefreshStateIdle) {
        [self.gifView stopAnimating];
        self.gifView.image = [ZDUIAssets imageName:@"ZDRefresh10"];
    }
}
@end
