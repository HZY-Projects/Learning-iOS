//
//  CustomButton.m
//  LearningOC1
//
//  Created by  whatsup on 2024/11/15.
//

#import "CustomButton.h"
#import "UIButton+EdgeInset.h"

@implementation CustomButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setEdgeInsets:@20];
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect rect = self.bounds;
    double inset = [self getEdgeInsets].doubleValue;
    CGRect newRect = CGRectZero;
    if (inset) {
        newRect.origin.x = rect.origin.x - inset;
        newRect.origin.y = rect.origin.y - inset;
        newRect.size.width = rect.size.width + inset * 2;
        newRect.size.height = rect.size.height + inset * 2;
    }
    return CGRectContainsPoint(newRect, point);
}

@end
