//
//  ZDDataStack.m
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import "ZDDataStack.h"
struct Node {
    void *data;
    struct Node *next;
};
typedef struct Node Node;


struct Stack {
    Node *top;
    int size;
};
typedef struct Stack Stack;

@interface ZDDataStack () {
    Stack *stack;
}
@end

@implementation ZDDataStack
- (void)dealloc {
    [self destroyStack];
}
+ (instancetype)stack {
    return [[self alloc] init];
}
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initStack];
    }
    return self;
}
- (void)initStack {
    stack = (Stack *)malloc(sizeof(Stack));
    if (!stack) {
        stack = NULL;
        return;
    }
    stack->size = 0;
    Node *node = (Node *)malloc(sizeof(Node));
    node -> next = NULL;
    node -> data = NULL;
    stack -> top = node ?: NULL;
}

- (void)push:(id)element {
    if (stack -> top == NULL) return;
    
    Node *node = (Node *)malloc(sizeof(Node));
    node -> data = (__bridge_retained void *)element;
    node -> next = stack -> top;
    stack -> top = node;
    stack -> size ++;
}
- (void)pop {
    // 如果为空直接返回
    if (stack -> size <= 0) return;
    
    Node *top = stack -> top;
    stack -> top = stack -> top -> next;
    if (top -> data) {
        CFRelease(top -> data);
    }
    free(top);
    stack -> size --;
}
- (NSInteger)size {
    return stack -> size;
}
- (BOOL)isEmpty {
    return !(stack -> size);
}
- (id)top {
    if (stack -> size > 0) {
        return (__bridge id)stack -> top -> data;
    }
    return nil;
}
- (NSArray *)allElements {
    NSMutableArray *marray = [NSMutableArray array];
    Node *currentNode = stack -> top;
    while (currentNode -> next) {
        [marray addObject:(__bridge id)currentNode -> data];
        currentNode = currentNode -> next;
    }
    return marray;
}
- (void)clearStack {
    while (stack -> top && stack -> top -> next) {
        Node *top = stack -> top;
        stack -> top = stack -> top -> next;
        if (top -> data) {
            CFRelease(top -> data);
        }
        free(top);
    }
    stack -> size = 0;
}
// 销毁 栈
- (void)destroyStack {
    while (stack -> top) {
        Node *top = stack -> top;
        stack -> top = stack -> top -> next;
        if (top -> data) {
            CFRelease(top -> data);
        }
        free(top);
    }
    free(stack);
    stack = NULL;
}
@end
