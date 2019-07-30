//
//  ZDBaseTableViewCell.h
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/13.
//

#import <UIKit/UIKit.h>

/**
 基础单元格
 */
@interface ZDBaseTableViewCell : UITableViewCell
/// 布局子视图
- (void)setupSubviews;
/// 添加约束
- (void)makeConstrains;
@end


