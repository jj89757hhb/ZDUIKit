//
//  ZDBannerPageView.m
//  ZDOnlineSchool
//
//  Created by huhuabin on 2019/5/27.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "ZDBannerPageView.h"

@interface ZDBannerPageView ()
@property (nonatomic, readwrite, copy) NSString *reuseIdentifier;
@property (nonatomic, strong, readwrite) UITapGestureRecognizer *tapGesture;
@end


@implementation ZDBannerPageView
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.reuseIdentifier = NSStringFromClass([self class]);
    }
    return self;
}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.reuseIdentifier = reuseIdentifier;
        [self addGestureRecognizer:self.tapGesture];
    }
    return self;
}
- (void)prepareForReuse {
    // 子类需要重写
}
- (UITapGestureRecognizer *)tapGesture {
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] init];
        _tapGesture.enabled = NO;
    }
    return _tapGesture;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@end
