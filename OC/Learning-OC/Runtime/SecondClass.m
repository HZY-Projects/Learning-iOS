//
//  SecondClass.m
//  LearningOC1
//
//  Created by  whatsup on 2024/11/4.
//

#import "SecondClass.h"

@implementation SecondClass

+ (void)load {
//    NSLog(@"second load");
}

// The superclass implementation may be called multiple times if subclasses do not implement initialize
// 当类第一次被调用的时候 runtime会通过objc_sendmsg发送信息先给父类initialize 然后子类
+ (void)initialize {
//    NSLog(@"init second");
    // 不实现的话会隐式调用super
//    [super initialize];
}

@end
