//
//  ZDToastImageView.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/13.
//

#import "ZDToastImageView.h"

@implementation ZDToastImageView
- (CGSize)intrinsicContentSize {
    if (CGSizeEqualToSize(self.frame.size, CGSizeZero)) {
        return [super intrinsicContentSize];
    }
    return self.frame.size;
}
@end
