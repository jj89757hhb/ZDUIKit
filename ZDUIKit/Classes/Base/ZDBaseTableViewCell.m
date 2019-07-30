//
//  ZDBaseTableViewCell.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/13.
//

#import "ZDBaseTableViewCell.h"

@implementation ZDBaseTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupSubviews];
        [self makeConstrains];
    }
    return self;
}
- (void)setupSubviews {}
- (void)makeConstrains {}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
