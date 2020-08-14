//
//  TestTableViewCell.m
//  ZDUIKit_Example
//
//  Created by hhb201708 on 2020/8/14.
//  Copyright © 2020 jj89757hhb. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

@implementation TestTableViewRow

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setCellClass:[TestTableViewCell class]];
    }
    return self;

}

- (CGFloat)ZDTableViewCellHeightWithProxy:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath{
    return 80;
}


@end
