//
//  ZDToast+ZDExtension.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/7/3.
//

#import "ZDToast+ZDExtension.h"
#import "ZDUIAssets.h"
#import "ZDSimButton.h"

@implementation ZDToast (ZDExtension)
+ (instancetype)ZDShowPrompt:(NSString *)info inView:(UIView *)view {
    if (!view || !info.length) return nil;
    [self hideInView:view];
    ZDToast *toast = [ZDToast showHUDAddedTo:view animated:YES];
    toast.mode = MBProgressHUDModeText;
    toast.detailsLabel.font = [ZDUIAssets PFMediumFont:15];
    toast.margin = 0;
    toast.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    toast.bezelView.backgroundColor = UIColor.blackColor;
    toast.bezelView.layer.cornerRadius = 20;
    CGSize size = [info boundingRectWithSize:CGSizeMake(MAXFLOAT, 40) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : toast.detailsLabel.font} context:nil].size;
    CGFloat width = size.width + 50 > [UIScreen mainScreen].bounds.size.width - 40 ? [UIScreen mainScreen].bounds.size.width - 40 : size.width + 50;
    toast.minSize = CGSizeMake(width, 40);
    toast.detailsLabel.text = info ?: @"";
    [toast hideAnimated:YES afterDelay:[self durationForDisplayString:info ?: @""]];
    return toast;
}
+ (instancetype)ZDShowSuccessInfo:(NSString *)successInfo inView:(UIView *)view {
    if (!view || !successInfo.length) return nil;
    [self hideInView:view];
    ZDToast *toast = [ZDToast showHUDAddedTo:view animated:YES];
    toast.mode = MBProgressHUDModeCustomView;
    toast.detailsLabel.font = [ZDUIAssets PFMediumFont:15];
    toast.margin = 0;
    toast.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    toast.bezelView.backgroundColor = kZDUIMainColor;
    toast.bezelView.layer.cornerRadius = 20;
    ZDSimButton *btn = [self fetchBtnWithString:successInfo];
    [btn sizeToFit];
    toast.minSize = CGSizeMake(10, 40);
    
    [toast.bezelView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 20, 0, 20));
    }];
    [toast hideAnimated:YES afterDelay:[self durationForDisplayString:successInfo ?: @""]];
    return toast;
}
+ (ZDSimButton *)fetchBtnWithString:(NSString *)string {
    ZDSimButton *simBtn = [[ZDSimButton alloc] initWithFrame:CGRectZero];
    simBtn.iconPosition = ZDSimButtonIconPositionTypeLeft;
    simBtn.iconTextMargin = 7;
    [simBtn setTitle:string forState:UIControlStateNormal];
    [simBtn setImage:[ZDUIAssets imageName:@"ZDToastSuccess"] forState:UIControlStateNormal];
    [simBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    simBtn.titleLabel.font = [ZDUIAssets PFMediumFont:15];
    return simBtn;
}
@end
