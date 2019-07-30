//
//  ZDPopupMenuCell.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/27.
//

#import "ZDPopupMenuCell.h"
#import "ZDUIAssets.h"
@implementation ZDPopupMenuCell

- (void)setupSubviews {
    self.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.titleLabel];
}
- (void)makeConstrains {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(0);
        make.height.mas_equalTo(15);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.titleLabel.textColor = selected ? kZDUIMainColor : kZDUIDarkColor;
}
#pragma mark ==================  lazy method  ==================
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [ZDUIAssets PFMediumFont:14];
        _titleLabel.textColor = kZDUIDarkColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end
