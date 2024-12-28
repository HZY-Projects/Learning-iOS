//
//  UIButton+EdgeInset.m
//  LearningOC1
//
//  Created by  whatsup on 2024/11/15.
//

#import "UIButton+EdgeInset.h"
#import <objc/runtime.h>

@implementation UIButton (EdgeInset)

static char insetKey;

- (void)setEdgeInsets:(NSNumber *)inset {
    objc_setAssociatedObject(self, &insetKey, inset, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)getEdgeInsets {
    return objc_getAssociatedObject(self, &insetKey);
}

@end

