//
//  UITextView+XTPlaceHolder.m
//  ZDUIKit
//
//  Created by huhuabin on 2019/7/3.
//

#import "UITextView+ZDPlaceHolder.h"
#import <objc/runtime.h>
#import "ZDUIMethodSwizzling.h"

static char kXTTextViewPlaceHolder;
static char kXTTextViewPlaceHolderLabel;
static char kXTTextViewPlaceHolderFont;
static char kXTTextViewPlaceHolderColor;

@implementation UITextView (XTPlaceHolder)
+ (void)load {
    [super load];
    ZDUIKitSwizzling(self, @selector(initWithFrame:), @selector(initWithFrame_placeHolder:));
    ZDUIKitSwizzling(self, @selector(initWithCoder:), @selector(initWithCoder_placeHolder:));
    ZDUIKitSwizzling(self, @selector(setText:), @selector(setTezd_placeHolder:));
    ZDUIKitSwizzling(self, @selector(setFrame:), @selector(setFrame_placeHolder:));
    ZDUIKitSwizzling(self, @selector(setTextContainerInset:), @selector(setTextContainerInset_placeHolder:));
    ZDUIKitSwizzling(self, @selector(layoutSubviews), @selector(layoutSubviews_placeHolder));
}

- (void)textChanged_placeHolder:(NSNotification *)notification{
    if (notification.object == self) {
        if ([self placeHolderExist]) {
            if (self.text.length > 0) {
                self.placeHolderLabel.alpha = 0;
            }else{
                self.placeHolderLabel.alpha = 1;
            }
        }
    }
}

- (void)placeHolderResize {
    if ([self placeHolderExist]) {
        UILabel * placeHolderLabel = self.placeHolderLabel;
        UIEdgeInsets edge = self.textContainerInset;
        edge.left += self.textContainer.lineFragmentPadding;
        edge.right += self.textContainer.lineFragmentPadding;

        CGRect rect = CGRectMake(edge.left, edge.top, self.bounds.size.width - edge.left - edge.right, 100);
        NSDictionary *attributes = @{NSFontAttributeName: placeHolderLabel.font};
        CGSize size = [placeHolderLabel.text boundingRectWithSize:CGSizeMake(rect.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
        
        if (size.height > 0) {
            rect.size.height = MIN(size.height, self.bounds.size.height - edge.top - edge.bottom);
        } else {
            rect.size.height = self.bounds.size.height - edge.top - edge.bottom;
        }
        [placeHolderLabel setFrame:rect];
    }
}

#pragma mark override selecters
- (instancetype)init {
    self = [super init];
    if (self) {
        if ([self isKindOfClass:[UITextView class]]) {
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged_placeHolder:) name:UITextViewTextDidChangeNotification object:self];
            
        }
    }
    return self;
}
- (void)layoutSubviews_placeHolder {
    [self layoutSubviews_placeHolder];
    [self placeHolderResize];
}


#pragma mark swapped selecters
- (instancetype)initWithFrame_placeHolder:(CGRect)frame {
    self = [self initWithFrame_placeHolder:frame];
    if (self) {
        if ([self isKindOfClass:[UITextView class]]) {
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged_placeHolder:) name:UITextViewTextDidChangeNotification object:self];
            
        }
    }
    return self;
}

- (void)setFrame_placeHolder:(CGRect)frame {
    [self setFrame_placeHolder:frame];
    [self setNeedsDisplay];
}

- (instancetype)initWithCoder_placeHolder:(NSCoder *)coder {
    self = [self initWithCoder_placeHolder:coder];
    if (self) {
        if ([self isKindOfClass:[UITextView class]]) {
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged_placeHolder:) name:UITextViewTextDidChangeNotification object:self];
            
        }
    }
    return self;
}



- (void)setTezd_placeHolder:(NSString *)text {
    [self setTezd_placeHolder:text];
    
    if ([self placeHolderExist]) {
        if (text.length > 0) {
            self.placeHolderLabel.alpha = 0;
        }else{
            self.placeHolderLabel.alpha = 1;
        }
    }
}

- (void)setTextContainerInset_placeHolder:(UIEdgeInsets)textContainerInset {
    [self setTextContainerInset_placeHolder:textContainerInset];
    
    if ([self placeHolderExist]) {
        
        UILabel * label = self.placeHolderLabel;
        label.translatesAutoresizingMaskIntoConstraints = NO;
        
        for(NSLayoutConstraint * constraint in label.constraints) {
            switch (constraint.firstAttribute) {
                case NSLayoutAttributeLeft:
                    constraint.constant = textContainerInset.left;
                    break;
                case NSLayoutAttributeRight:
                    constraint.constant = textContainerInset.right;
                    break;
                case NSLayoutAttributeTop:
                    constraint.constant = textContainerInset.top;
                    break;
                default:
                    break;
            }
        }
        label.translatesAutoresizingMaskIntoConstraints = YES;
    }
}

- (void)setFont_placeHolder:(UIFont *)font {
    [self setFont_placeHolder:font];
    if ([self placeHolderExist]) {
        self.placeHolderLabel.font = self.placeHolderFont;
    }
}

#pragma mark getter placeHolderLabel
- (nullable UILabel *)placeHolderLabel {
    UILabel * result = objc_getAssociatedObject(self, &kXTTextViewPlaceHolderLabel);
    if (!result) {
        result = [[UILabel alloc] initWithFrame:(CGRect){0,0,100,100}];
        result.numberOfLines = NSIntegerMax;
        result.text = self.placeHolder;
        result.font = self.placeHolderFont;
        result.textColor = self.placeHolderColor;
        result.userInteractionEnabled = NO;
        
        if (self.text.length > 0) {
            result.alpha = 0;
        }else{
            result.alpha = 1;
        }
        [self addSubview:result];
        
        
        
        objc_setAssociatedObject(self, &kXTTextViewPlaceHolderLabel, result, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [self placeHolderResize];
    }
    return result;
}

- (BOOL)placeHolderExist {
    UILabel * result = objc_getAssociatedObject(self, &kXTTextViewPlaceHolderLabel);
    return result;
}


#pragma mark setter/getter placeHolder
- (void)setPlaceHolder:(nullable NSString *)placeHolder {
    NSString * _placeHolder = self.placeHolder;
    if (![_placeHolder isEqualToString:placeHolder]) {
        objc_setAssociatedObject(self, &kXTTextViewPlaceHolder, placeHolder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self placeHolderResize];
    }
    self.placeHolderLabel.text = placeHolder;
}
//- (void)layoutSubviews {
//    [super layoutSubviews];
//    [self placeHolderResize];
//}
- (nullable NSString *)placeHolder {
    NSString * result = objc_getAssociatedObject(self, &kXTTextViewPlaceHolder);
    return result;
}

#pragma mark setter/getter placeHolderFont
- (void)setPlaceHolderFont:(nullable UIFont *)placeHolderFont {
    UIFont * _placeHolderFont = self.placeHolderFont;
    if (![_placeHolderFont isEqual:placeHolderFont]) {
        objc_setAssociatedObject(self, &kXTTextViewPlaceHolderFont, placeHolderFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        if (!placeHolderFont) {
            placeHolderFont = self.font;
        }
        
        if ([self placeHolderExist]) {
            self.placeHolderLabel.font = placeHolderFont;
        }
    }
}

- (nullable UIFont *)placeHolderFont {
    UIFont * result = objc_getAssociatedObject(self, &kXTTextViewPlaceHolderFont);
    if (!result) {
        result = self.font;
    }
    if (!result) {
        result = [UIFont systemFontOfSize:14];
    }
    return result;
}

#pragma mark setter/getter placeHolderColor
- (void)setPlaceHolderColor:(nonnull UIColor *)placeHolderColor {
    UIColor * _placeHolderColor = self.placeHolderColor;
    if (![_placeHolderColor isEqual:placeHolderColor]) {
        objc_setAssociatedObject(self, &kXTTextViewPlaceHolderColor, placeHolderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        if ([self placeHolderExist]) {
            self.placeHolderLabel.textColor = _placeHolderColor;
        }
    }
}

- (nonnull UIColor *)placeHolderColor {
    UIColor * result = objc_getAssociatedObject(self, &kXTTextViewPlaceHolderColor);
    if (!result) {
        result = [UIColor lightGrayColor];
    }
    return result;
}


@end
