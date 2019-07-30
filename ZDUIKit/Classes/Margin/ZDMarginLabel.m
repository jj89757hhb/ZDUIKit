//
//  ZDMarginLabel.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/12.
//

#import "ZDMarginLabel.h"

@implementation ZDMarginLabel

+ (instancetype)marginLabel:(UIEdgeInsets)textInsets {
    ZDMarginLabel *label = [[self alloc] initWithFrame:CGRectZero];
    label.textInsets = textInsets;
    return label;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        self.textInsets = UIEdgeInsetsZero;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.textInsets = UIEdgeInsetsZero;
    }
    return self;
}
- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.textInsets)];
}
    
- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    size.width += self.textInsets.left + self.textInsets.right;
    size.height += self.textInsets.top + self.textInsets.bottom;
    return size;
}@end
