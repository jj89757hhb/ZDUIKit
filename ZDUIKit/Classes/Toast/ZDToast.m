//
//  ZDToast.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/6/13.
//

#import "ZDToast.h"
#import "ZDUIAssets.h"
static ZDToastErrorHandler globalErrorHandler = nil;
#define KZDWindow [UIApplication sharedApplication].keyWindow

@implementation ZDToast
+ (void)setErrorHandler:(ZDToastErrorHandler)errorHandler {
    globalErrorHandler = errorHandler;
}
+ (ZDToastErrorHandler)errorHandler {
    return globalErrorHandler;
}

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    if (self) {
        self.contentColor = [UIColor whiteColor];
        self.detailsLabel.font = [UIFont systemFontOfSize:14];
        self.bezelView.style = MBProgressHUDBackgroundStyleBlur;
        self.animationType = MBProgressHUDAnimationFade;
        self.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        self.bezelView.layer.cornerRadius = 10;
    }
    return self;
}

/// 通过传入的字符串 获取展示的时间
+ (NSTimeInterval)durationForDisplayString:(NSString *)string {
    return MAX(1.8, MIN((double)(string.length) * 0.1 + 0.5, 5.0));
}
/// 正在加载
+ (instancetype)showLoading:(NSString *)loading inView:(UIView *)view {
    if (!view) return nil;
    [self hideInView:view];
    ZDToast *toast = [ZDToast showHUDAddedTo:view animated:YES];
    toast.mode = MBProgressHUDModeCustomView;
    ZDToastImageView *imageView = [self fetchToastImageView];
    toast.customView = imageView;
    toast.square = YES;
    toast.detailsLabel.text = loading;
    [imageView startAnimating];
    return toast;
}
/// 展示成功信息
+ (instancetype)showSuccess:(NSString *)success inView:(UIView *)view {
    if (!view) return nil;
    [self hideInView:view];
    ZDToast *toast = [ZDToast showHUDAddedTo:view animated:YES];
    toast.mode = MBProgressHUDModeCustomView;
    toast.square = YES;
    toast.customView = [[UIImageView alloc] initWithImage:[ZDUIAssets imageName:@"ZDToastSuccess"]];
    toast.detailsLabel.text = success ?: @"";
    [toast hideAnimated:YES afterDelay:[self durationForDisplayString:success ?: @""]];
    return toast;
}

+ (instancetype)showInfo:(NSString *)info inView:(UIView *)view {
    if (!view) return nil;
    [self hideInView:view];
    ZDToast *toast = [ZDToast showHUDAddedTo:view animated:YES];
    toast.mode = MBProgressHUDModeText;
    toast.detailsLabel.text = info ?: @"";
    [toast hideAnimated:YES afterDelay:[self durationForDisplayString:info ?: @""]];
    return toast;
}
+ (instancetype)showError:(NSError *)error inView:(UIView *)view {
    if (!view) return nil;
    [self hideInView:view];
    ZDToastErrorHandler handler = [self errorHandler];
    NSString *message = handler ? handler(error) : error.localizedDescription;
    return [self showInfo:message inView:view];
}
/// 隐藏视图
+ (void)hideInView:(UIView *)view {
    if (view) {
        [ZDToast hideHUDForView:view animated:YES];
    }
}

+ (void)hideToast {
    [self hideHUDForView:KZDWindow animated:YES];
}
/// 显示成功提示框，自动隐藏
+ (void)showSuccess {
    [self hideToast];
    [self showText:nil icon:@"iconSuccess" view:nil];
}
+ (void)showSuccessWithString:(NSString *)string {
    [self hideToast];
    [self showText:string icon:@"iconSuccess" view:nil];
}
/// 显示错误提示框，自动隐藏
+ (void)showError {
    [self hideToast];
    [self showText:nil icon:@"iconError" view:nil];
}
+ (void)showErrorWithString:(NSString *)string {
    [self hideToast];
    [self showText:string icon:@"iconError" view:nil];
}
/// 加载视图，一般用于网络请求
+ (void)showLoading {
    [self showLoadingWithString:nil];
}
/// 加载视图，底部附带文字
+ (void)showLoadingWithString:(NSString *)string {
    [self hideToast];
    ZDToast *toast = [ZDToast showHUDAddedTo:KZDWindow animated:YES];
    toast.minSize = CGSizeMake(120, 120);
    toast.mode = MBProgressHUDModeCustomView;
    ZDToastImageView *imageView = [self fetchToastImageView];
    toast.customView = imageView;
    toast.square = YES;
    if (string) {
        toast.detailsLabel.text = string;
        toast.detailsLabel.textColor = UIColor.whiteColor;
        toast.detailsLabel.font = [UIFont systemFontOfSize:14];
    }
    [imageView startAnimating];
}
+ (void)showInfoWithString:(NSString *)string {
    [self hideToast];
    if (!string) return;
    ZDToast *toast = [ZDToast showHUDAddedTo:KZDWindow animated:YES];
    toast.margin = 18;
    toast.mode = MBProgressHUDModeText;
    toast.detailsLabel.textColor = UIColor.whiteColor;
    toast.detailsLabel.text = string ?: @"";
    toast.detailsLabel.font = [UIFont systemFontOfSize:14];
    [toast hideAnimated:YES afterDelay:[self durationForDisplayString:string ?: @""]];
}
#pragma mark ==================  private method  ==================
+ (void)showText:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    if (!view) view = KZDWindow;
    ZDToast *toast = [ZDToast showHUDAddedTo:view animated:YES];
    toast.minSize = text.length ? CGSizeMake(160, 113) : CGSizeMake(120, 120);
    toast.detailsLabel.text = text ?: @"";
    toast.detailsLabel.textColor = UIColor.whiteColor;
    if (icon) {
        toast.customView = [[UIImageView alloc] initWithImage:[ZDUIAssets imageName:@"icon"]];
        toast.mode = MBProgressHUDModeCustomView;
    }
    /// 隐藏时，从父视图上移除
    toast.removeFromSuperViewOnHide = YES;
    [toast hideAnimated:YES afterDelay:[self durationForDisplayString:text ?: @""]];
}
+ (ZDToastImageView *)fetchToastImageView {
    ZDToastImageView *imageView = [[ZDToastImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    NSMutableArray *images = [NSMutableArray array];
    for (NSInteger i = 1; i <= 46; i++) {
        [images addObject:[ZDUIAssets imageName:[NSString stringWithFormat:@"ZDLoading%02ld", i]]];
    }
    imageView.animationImages = images;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.animationDuration = 3.f;
    imageView.animationRepeatCount = 0;
    return imageView;
}
@end
