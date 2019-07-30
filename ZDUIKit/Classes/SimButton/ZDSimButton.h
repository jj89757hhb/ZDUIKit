//
//  ZDSimButton.h
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/17.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZDSimButtonIconPositionType) {
    ZDSimButtonIconPositionTypeDefault, // 系统默认
    ZDSimButtonIconPositionTypeLeft, // icon 在文本左边
    ZDSimButtonIconPositionTypeRight, // icon 在文本右边
    ZDSimButtonIconPositionTypeTop, // icon 在文本上边
    ZDSimButtonIconPositionTypeBottom, // icon 在文本下边
    ZDSimButtonIconPositionTypeCenter // icon 在文本上边，居中对齐
};

@interface ZDSimButton : UIButton
/// 图文 间距
@property (nonatomic, assign) CGFloat iconTextMargin;
/// 本文 位置类型
@property (nonatomic, assign) ZDSimButtonIconPositionType iconPosition;
/// 按钮点击范围，设定值为单侧的px，上下左右都会加上这个扩展值
@property (nonatomic, assign) NSInteger extInteractEdge;
/// 自定义扩展上下左右的值
@property (nonatomic, assign) UIEdgeInsets extInteractInsets;
@end


