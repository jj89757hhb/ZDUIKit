//
//  ZDPromptBtn.m
//  ZDOnlineSchool
//
//  Created by huhuabin on 2019/5/22.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "ZDPromptBtn.h"
#import "ZDMarginLabel.h"
#import <Masonry/Masonry.h>
@interface ZDPromptBtn ()
/// 红点展示
@property (nonatomic, strong) ZDMarginLabel *redLabel;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ZDPromptBtn
+ (instancetype)promptWithImage:(UIImage *)image {
    ZDPromptBtn *btn = [[self alloc] initWithFrame:CGRectZero];
    btn.imageView.image = image;
    return btn;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = NO;
        [self setupSubviews];
    }
    return self;
}
- (void)setupSubviews {
    [self addSubview:self.imageView];
    [self addSubview:self.redLabel];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [self.redLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(16);
        make.centerX.equalTo(self.mas_centerX).multipliedBy(2);
        make.top.equalTo(self.mas_top).offset(-8);
        make.width.mas_greaterThanOrEqualTo(16);
    }];
}
- (void)setPromptNumber:(NSInteger)number {
    self.redLabel.hidden = (!number);
    self.redLabel.text = (number > 99) ? @"99+" : [NSString stringWithFormat:@"%ld", (long)number];
}
#pragma mark ==================  lazy method  ==================
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _imageView;
}
- (ZDMarginLabel *)redLabel {
    if (!_redLabel) {
        _redLabel = [ZDMarginLabel marginLabel:UIEdgeInsetsMake(2, 4, 2, 4)];
        _redLabel.backgroundColor = [UIColor colorWithRed:228 / 255.0 green:89 / 255.0 blue:63 / 255.0 alpha:1];
        _redLabel.textColor = UIColor.whiteColor;
        _redLabel.font = [UIFont systemFontOfSize:10];
        _redLabel.layer.cornerRadius = 8;
        _redLabel.layer.masksToBounds = YES;
        _redLabel.textAlignment = NSTextAlignmentCenter;
        _redLabel.hidden = YES;
    }
    return _redLabel;
}
@end
