//
//  ZDScrollTopBar.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/7/6.
//

#import "ZDScrollTopBar.h"
#import "ZDUIAssets.h"

const CGFloat kZDUIScrollTopBarHeight = 45;

@implementation ZDScrollTopBar
+ (instancetype)tabbar {
    return [[self alloc] initWithFrame:CGRectMake(0, 0, kZDUIScreenWidth, kZDUIScrollTopBarHeight)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}
- (void)commonInit {
    self.itemTitleColor = kZDUIMiddleGrayColor;
    self.itemTitleSelectedColor = kZDUIMainColor;
    self.itemTitleFont = [ZDUIAssets PFMediumFont:15];
    self.itemTitleSelectedFont = [ZDUIAssets PFMediumFont:15];
    self.indicatorScrollFollowContent = YES;
    self.indicatorColor = kZDUIMainColor;
    [self setIndicatorWidthFixTextAndMarginTop:kZDUIScrollTopBarHeight - 2 marginBottom:0 tapSwitchAnimated:YES];
}
@end
