//
//  UIBarButtonItem+ZDBlock.m
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "UIBarButtonItem+ZDBlock.h"
#import <objc/runtime.h>
#import "ZDFoundationMacro.h"
ZDSYNTH_DUMMY_CLASS(UIBarButtonItem_ZDBlock)
static const int zd_block_key;

@interface _ZDUIBarButtonItemBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);

- (id)initWithBlock:(void (^)(id sender))block;
- (void)invoke:(id)sender;

@end

@implementation _ZDUIBarButtonItemBlockTarget

- (id)initWithBlock:(void (^)(id sender))block{
    self = [super init];
    if (self) {
        _block = [block copy];
    }
    return self;
}

- (void)invoke:(id)sender {
    if (self.block) self.block(sender);
}

@end


@implementation UIBarButtonItem (ZDBlock)

- (void)setzd_actionBlock:(void (^)(id sender))block {
    _ZDUIBarButtonItemBlockTarget *target = [[_ZDUIBarButtonItemBlockTarget alloc] initWithBlock:block];
    objc_setAssociatedObject(self, &zd_block_key, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setTarget:target];
    [self setAction:@selector(invoke:)];
}

- (void (^)(id)) zd_actionBlock {
    _ZDUIBarButtonItemBlockTarget *target = objc_getAssociatedObject(self, &zd_block_key);
    return target.block;
}
@end
