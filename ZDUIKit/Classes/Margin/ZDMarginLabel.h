//
//  ZDMarginLabel.h
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/12.
//

#import <UIKit/UIKit.h>

/**
 能设置内边距的label
 */
@interface ZDMarginLabel : UILabel
/// 内边距
@property (nonatomic, assign) UIEdgeInsets textInsets;
+ (instancetype)marginLabel:(UIEdgeInsets)textInsets;
@end


