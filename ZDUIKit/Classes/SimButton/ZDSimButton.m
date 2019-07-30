//
//  ZDSimButton.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/17.
//

#import "ZDSimButton.h"

static CGFloat const kZDUIGap = 5;

@implementation ZDSimButton

- (void)setExtInteractEdge:(NSInteger)extInteractEdge {
    _extInteractEdge = extInteractEdge;
    if (UIEdgeInsetsEqualToEdgeInsets(_extInteractInsets, UIEdgeInsetsZero)) {
        self.extInteractInsets = UIEdgeInsetsMake(extInteractEdge, extInteractEdge, extInteractEdge, extInteractEdge);
    }
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return CGRectContainsPoint(CGRectMake(self.bounds.origin.x - self.extInteractInsets.left, self.bounds.origin.y - self.extInteractInsets.top, self.bounds.size.width + self.extInteractInsets.left + self.extInteractInsets.right, self.bounds.size.height + self.extInteractInsets.top + self.extInteractInsets.bottom), point);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (_iconPosition != ZDSimButtonIconPositionTypeDefault) {
        [self.titleLabel sizeToFit];
        
        // icon在文案 左或者右
        if (_iconPosition == ZDSimButtonIconPositionTypeLeft || _iconPosition == ZDSimButtonIconPositionTypeRight) {
            // width
            CGRect titleLabelFrame = self.titleLabel.frame;
            titleLabelFrame.size.width = MIN(self.frame.size.width - _iconTextMargin - kZDUIGap - self.imageView.frame.size.width, self.titleLabel.frame.size.width);
            self.titleLabel.frame = titleLabelFrame;
        } else {
            // width
            CGRect titleLabelFrame = self.titleLabel.frame;
            titleLabelFrame.size.width = MIN(self.frame.size.width - kZDUIGap, self.titleLabel.frame.size.width);
            self.titleLabel.frame = titleLabelFrame;
        }
        
        if (_iconPosition == ZDSimButtonIconPositionTypeLeft) {
            
            CGFloat width = self.imageView.frame.size.width + self.titleLabel.frame.size.width + _iconTextMargin;
            // right
            CGFloat right = self.frame.size.width / 2 + width / 2;
            CGRect titleLabelFrame = self.titleLabel.frame;
            titleLabelFrame.origin.x = right - titleLabelFrame.size.width;
            self.titleLabel.frame = titleLabelFrame;
            // left
            CGFloat left = self.frame.size.width / 2 - width / 2;
            CGRect imageViewFrame = self.imageView.frame;
            imageViewFrame.origin.x = left;
            self.imageView.frame = imageViewFrame;
            
        } else if (_iconPosition == ZDSimButtonIconPositionTypeRight) {
            CGFloat width = self.imageView.frame.size.width + self.titleLabel.frame.size.width + _iconTextMargin;
            // right
            CGRect frame = self.frame;
            CGFloat right = frame.size.width / 2 + width / 2;
            CGRect imageViewFrame = self.imageView.frame;
            imageViewFrame.origin.x = right - imageViewFrame.size.width;
            self.imageView.frame = imageViewFrame;
            // left
            CGFloat left = frame.size.width / 2 - width / 2;
            CGRect titleLabelFrame = self.titleLabel.frame;
            titleLabelFrame.origin.x = left;
            self.titleLabel.frame = titleLabelFrame;
            
        } else if (_iconPosition == ZDSimButtonIconPositionTypeCenter) {
            // centerX
            CGRect frame = self.frame;
            CGFloat centerX = frame.size.width / 2;
            CGPoint imageViewCenter = self.imageView.center;
            imageViewCenter = CGPointMake(centerX, imageViewCenter.y);
            self.imageView.center = imageViewCenter;
            // centerX
            CGPoint titleLabelCenter = self.titleLabel.center;
            titleLabelCenter = CGPointMake(centerX, titleLabelCenter.y);
            self.titleLabel.center = titleLabelCenter;
            
        } else if (_iconPosition == ZDSimButtonIconPositionTypeTop) {
            CGRect titleLabelFrame = self.titleLabel.frame;
            CGRect imageViewFrame = self.imageView.frame;
            CGFloat height = imageViewFrame.size.height + titleLabelFrame.size.height + _iconTextMargin;
            // top
            CGRect frame = self.frame;
            CGFloat top = frame.size.height / 2 - height / 2;
            imageViewFrame.origin.y = top;
            self.imageView.frame = imageViewFrame;
            // bottom
            CGFloat bottom = frame.size.height / 2 + height / 2;
            titleLabelFrame.origin.y = bottom - titleLabelFrame.size.height;
            self.titleLabel.frame = titleLabelFrame;
            // centerX
            CGFloat centerX = frame.size.width / 2;
            CGPoint imageViewCenter = self.imageView.center;
            imageViewCenter = CGPointMake(centerX, imageViewCenter.y);
            self.imageView.center = imageViewCenter;
            
            CGPoint titleLabelCenter = self.titleLabel.center;
            titleLabelCenter = CGPointMake(centerX, titleLabelCenter.y);
            self.titleLabel.center = titleLabelCenter;
            
        } else if (_iconPosition == ZDSimButtonIconPositionTypeBottom) {
            CGRect titleLabelFrame = self.titleLabel.frame;
            CGRect imageViewFrame = self.imageView.frame;
            CGFloat height = imageViewFrame.size.height + titleLabelFrame.size.height + _iconTextMargin;
            // bottom
            CGRect frame = self.frame;
            CGFloat bottom = frame.size.height / 2 + height / 2;
            imageViewFrame.origin.y = bottom - imageViewFrame.size.height;
            self.imageView.frame = imageViewFrame;
            //  top
            CGFloat top = frame.size.height / 2 - height / 2;
            titleLabelFrame.origin.y = top;
            self.titleLabel.frame = frame;
            //  centerX
            CGFloat centerX = frame.size.width / 2;
            CGPoint imageViewCenter = self.imageView.center;
            imageViewCenter = CGPointMake(centerX, imageViewCenter.y);
            self.imageView.center = imageViewCenter;
            
            CGPoint titleLabelCenter = self.titleLabel.center;
            titleLabelCenter = CGPointMake(centerX, titleLabelCenter.y);
            self.titleLabel.center = titleLabelCenter;
        }
    }
}
- (void)sizeToFit {
    if (_iconPosition != ZDSimButtonIconPositionTypeDefault) {
        [self.titleLabel sizeToFit];
        
        UIImage *image = self.currentImage;
        CGFloat width = 0, height = 0;
        
        CGFloat titleWidth = self.titleLabel.frame.size.width, titleHeight = self.titleLabel.frame.size.height;
        
        if (_iconPosition == ZDSimButtonIconPositionTypeLeft || _iconPosition == ZDSimButtonIconPositionTypeRight){
            width = titleWidth + image.size.width + _iconTextMargin + kZDUIGap;
            height = MAX(titleHeight, image.size.height);
        } else if (_iconPosition == ZDSimButtonIconPositionTypeTop || _iconPosition == ZDSimButtonIconPositionTypeBottom) {
            height = titleHeight + image.size.height + _iconTextMargin;
            width = MAX(titleWidth, image.size.width) + kZDUIGap;
        } else if (_iconPosition == ZDSimButtonIconPositionTypeCenter) {
            width = MAX(titleWidth, image.size.width) + kZDUIGap;
            height = MAX(titleHeight, image.size.height) + kZDUIGap;
        }
        // size
        CGRect frame = self.frame;
        frame.size = CGSizeMake(ceil(width), ceil(height));
        self.frame = frame;
    } else {
        [super sizeToFit];
    }
}
- (void)setIconTextMargin:(CGFloat)iconTextMargin {
    if (_iconTextMargin != iconTextMargin) {
        _iconTextMargin = iconTextMargin;
        if (_iconPosition == ZDSimButtonIconPositionTypeLeft || _iconPosition == ZDSimButtonIconPositionTypeRight){
            [self setContentEdgeInsets:UIEdgeInsetsMake(0, _iconTextMargin/2, 0, _iconTextMargin/2)];
        }
        else if (_iconPosition == ZDSimButtonIconPositionTypeTop || _iconPosition == ZDSimButtonIconPositionTypeBottom){
            [self setContentEdgeInsets:UIEdgeInsetsMake(_iconTextMargin/2, 0, _iconTextMargin/2, 0)];
        }
    }
    [self invalidateIntrinsicContentSize];
}
- (CGSize)intrinsicContentSize {
    CGSize labelSize = self.titleLabel.intrinsicContentSize;
    CGSize imageSize = self.imageView.intrinsicContentSize;
    // iOS9以下
    if (!([[UIDevice currentDevice].systemVersion compare:@"9.0" options:NSNumericSearch] != NSOrderedAscending)) {
        imageSize = self.currentImage.size;
    }
    CGFloat width = 0, height = 0;
    if (_iconPosition == ZDSimButtonIconPositionTypeLeft || _iconPosition == ZDSimButtonIconPositionTypeRight){
        width = labelSize.width + imageSize.width + _iconTextMargin + kZDUIGap;
        height = MAX(labelSize.height, imageSize.height);
    } else if (_iconPosition == ZDSimButtonIconPositionTypeTop || _iconPosition == ZDSimButtonIconPositionTypeBottom) {
        height = labelSize.height + imageSize.height + _iconTextMargin;
        width = MAX(labelSize.width, imageSize.width) + kZDUIGap;
    } else if (_iconPosition == ZDSimButtonIconPositionTypeCenter) {
        width = MAX(labelSize.width, imageSize.width) + kZDUIGap;
        height = MAX(labelSize.height, imageSize.height) + kZDUIGap;
    }
    return CGSizeMake(ceil(width), ceil(height));
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
