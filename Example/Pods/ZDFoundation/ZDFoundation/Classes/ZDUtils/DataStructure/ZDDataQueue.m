//
//  ZDDataQueue.m
//  ZDFoundation
//
//  Created by huhuabin on 2019/6/14.
//

#import "ZDDataQueue.h"

// 节点结构
struct Node {
    void *data;
    struct Node *next;
};
typedef struct Node Node;

/// 队列结构
struct Queue {
    Node *front;
    Node *tail;
    int length;
};
typedef struct Queue Queue;

@interface ZDDataQueue () {
    Queue *queue;
}
@end

@implementation ZDDataQueue
- (void)dealloc {
    [self clearQueue];
    free(queue);
    queue = NULL;
}
+ (instancetype)queue {
    return [[self alloc] init];
}
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initQueue];
    }
    return self;
}
- (void)initQueue {
    queue = (Queue *)malloc(sizeof(Queue));
    if (!queue) queue = NULL;
    queue -> length = 0;
    queue -> front = NULL;
    queue -> tail = NULL;
}
/// 进队
- (void)enter:(id)element {
    Node *node = (Node *)malloc(sizeof(Node));
    node -> data = (__bridge_retained void *)element;
    node -> next = NULL;
    
    // 如果队尾有值直接在队尾插入
    if (queue -> tail) {
        queue -> tail -> next = node;
        queue -> tail = node;
    } else {
        queue -> tail = node;
        queue -> front = node;
    }
    queue -> length += 1;
}
/// 出队
- (void)exit {
    // 队列为空直接返回
    if (queue -> length <= 0) return;
    Node *node = queue -> front;
    queue -> front = queue -> front -> next;
    if (node -> data) {
        CFRelease(node -> data);
    }
    free(node);
    queue -> length -= 1;
}
/// 获取队头元素
- (id)frontElement {
    if (queue -> length) {
        return (__bridge id)queue -> front -> data;
    }
    return nil;
}
/// 获取队尾元素
- (id)tailElement {
    if (queue -> length) {
        return (__bridge id)queue -> tail -> data;
    }
    return nil;
}
/// 判空
- (BOOL)isEmpty {
    return !(queue -> length);
}

/// 获取队列中所有元素
- (NSArray *)allElements {
    NSMutableArray *marray = [NSMutableArray array];
    Node *currentNode = queue -> front;
    while (currentNode) {
        [marray addObject:(__bridge id)currentNode -> data];
        currentNode = currentNode -> next;
    }
    return marray;
}
/// 清空队列
- (void)clearQueue {
    while (queue -> front != NULL) {
        Node *node = queue -> front;
        queue -> front = queue -> front -> next;
        if (node -> data) {
            CFRelease(node -> data);
        }
        free(node);
    }
    queue -> front = NULL;
    queue -> tail = NULL;
    queue -> length = 0;
}
@end
