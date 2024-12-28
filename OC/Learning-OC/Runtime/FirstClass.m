//
//  FirstClass.m
//  LearningOC1
//
//  Created by  whatsup on 2024/11/4.
//

#import "FirstClass.h"

@implementation FirstClass

+ (void)initialize {
    if (self == [FirstClass self]) {
        NSLog(@"init first");
    }
}

// 第一次在被加载到内存时被调用 在main函数调用之前
// 先父类再子类 类别是根据编译顺序决定
+ (void)load {
//    NSLog(@"%@", self);
    NSLog(@"first load");
}

- (instancetype)init {
    if(self = [super init]) {
        NSLog(@"init init init first");
        NSLog(@"%@ %p", self, &self);
    }
    return self;
}


- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    FirstClass *copy = [[self class] allocWithZone:nil];
    return copy;
}

- (void)dealloc {
    NSLog(@"firstClass dealloc");
}

@end
