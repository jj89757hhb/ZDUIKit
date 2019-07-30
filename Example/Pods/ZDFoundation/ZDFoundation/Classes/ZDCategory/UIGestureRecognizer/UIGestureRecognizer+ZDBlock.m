//
//  UIGestureRecognizer+ZDBlock.m
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#import "UIGestureRecognizer+ZDBlock.h"
#import <objc/runtime.h>

#import "ZDFoundationMacro.h"
ZDSYNTH_DUMMY_CLASS(UIGestureRecognizer_ZDBlock)

static const int zd_block_key;

@interface _ZDUIGestureRecognizerBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);

- (id)initWithBlock:(void (^)(id sender))block;
- (void)invoke:(id)sender;

@end

@implementation _ZDUIGestureRecognizerBlockTarget

- (id)initWithBlock:(void (^)(id sender))block{
    self = [super init];
    if (self) {
        _block = [block copy];
    }
    return self;
}

- (void)invoke:(id)sender {
    if (_block) _block(sender);
}

@end

@implementation UIGestureRecognizer (ZDBlock)

- (instancetype)initWithActionBlock:(void (^)(id sender))block {
    self = [self init];
    [self zd_addActionBlock:block];
    return self;
}

- (void)zd_addActionBlock:(void (^)(id sender))block {
    _ZDUIGestureRecognizerBlockTarget *target = [[_ZDUIGestureRecognizerBlockTarget alloc] initWithBlock:block];
    [self addTarget:target action:@selector(invoke:)];
    NSMutableArray *targets = [self _zd_allUIGestureRecognizerBlockTargets];
    [targets addObject:target];
}

- (void)zd_removeAllActionBlocks{
    NSMutableArray *targets = [self _zd_allUIGestureRecognizerBlockTargets];
    [targets enumerateObjectsUsingBlock:^(id target, NSUInteger idx, BOOL *stop) {
        [self removeTarget:target action:@selector(invoke:)];
    }];
    [targets removeAllObjects];
}

- (NSMutableArray *)_zd_allUIGestureRecognizerBlockTargets {
    NSMutableArray *targets = objc_getAssociatedObject(self, &zd_block_key);
    if (!targets) {
        targets = [NSMutableArray array];
        objc_setAssociatedObject(self, &zd_block_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}
@end
