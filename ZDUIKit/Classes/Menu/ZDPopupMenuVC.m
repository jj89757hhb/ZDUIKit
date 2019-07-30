//
//  ZDPopupMenuVC.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/27.
//

#import "ZDPopupMenuVC.h"
#import "ZDUIMacros.h"
#import "ZDPopupMenuCell.h"
#import <ZDFoundation/ZDFoundation.h>
#import <Masonry/Masonry.h>


@interface ZDPopupMenuVC () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *backgroundMaskView;
/// 内容视图的高的约束
@property (nonatomic, strong) MASConstraint *heightConstraint;
@end

static CGFloat kZDUIPopCellHeight = 44;

@implementation ZDPopupMenuVC
#pragma mark ==================  init method  ==================
- (instancetype)initWithMenuTitles:(NSArray *)titles {
    self = [super init];
    if (self) {
        _menuTitles = titles;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.view.backgroundColor = [UIColor clearColor];
    [self setupSubviews];
    self.selectedIndex = _selectedIndex;
}
- (void)setupSubviews {
    [self.view addSubview:self.backgroundMaskView];
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [self.backgroundMaskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}
#pragma mark ==================  Public method  ==================
- (void)presentInTargetVC:(UIViewController *)targetVC contentHeight:(CGFloat)contentHeight {
    _targetVC = targetVC;
    [targetVC addChildViewController:self];
    [targetVC.view addSubview:self.view];
    if ((targetVC.navigationController && !targetVC.navigationController.navigationBar.translucent) || !targetVC.navigationController) {
        self.view.frame = targetVC.view.bounds;
    } else {
        [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(kZDUITopBarHeight, 0, 0, 0));
        }];
    }
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        self.heightConstraint = make.height.mas_equalTo(0);
    }];
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.heightConstraint.mas_equalTo(contentHeight);
        self.backgroundMaskView.alpha = 1;
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
    } completion:nil];
}
- (void)dismiss {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.heightConstraint.mas_equalTo(0);
        self.backgroundMaskView.alpha = 0;
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (self.dismissBlock) {
            self.dismissBlock();
        }
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
}
- (CGFloat)maxContentHeight {
    return self.menuTitles.count * kZDUIPopCellHeight;
}
#pragma mark ==================  table datasource and delegate  ==================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuTitles.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kZDUIPopCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDPopupMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDPopupMenuCell" forIndexPath:indexPath];
    cell.titleLabel.text = [self.menuTitles zd_ObjectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectedIndex = indexPath.row;
    [self dismiss];
    if (self.didSelectedBlock) {
        self.didSelectedBlock(indexPath.row);
    }
}
#pragma mark ==================  Setter   ==================
- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    if (selectedIndex < 0 || selectedIndex >= self.menuTitles.count) {
        if (_tableView.indexPathForSelectedRow) {
            [_tableView deselectRowAtIndexPath:_tableView.indexPathForSelectedRow animated:NO];
        }
    } else {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
        [_tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
}
#pragma mark ==================  Getter   ==================
- (UIButton *)backgroundMaskView {
    if (!_backgroundMaskView) {
        _backgroundMaskView = [[UIButton alloc] initWithFrame:CGRectZero];
        _backgroundMaskView.backgroundColor = ZDUIRGBA(0, 0, 0, 0.5);
        [_backgroundMaskView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        _backgroundMaskView.alpha = 0;
    }
    return _backgroundMaskView;
}
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _contentView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delaysContentTouches = YES;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorColor = kZDUILineColor;
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.sectionHeaderHeight = 0.01;
        _tableView.sectionFooterHeight = 0.01;
        if (@available(iOS 11.0, *)) {
            _tableView.estimatedSectionFooterHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
        }
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView zd_RegisterCells:@[ZDCellType2(@"ZDPopupMenuCell")]];
    }
    return _tableView;
}
@end
