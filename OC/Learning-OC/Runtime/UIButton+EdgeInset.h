//
//  UIButton+EdgeInset.h
//  LearningOC1
//
//  Created by  whatsup on 2024/11/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (EdgeInset)

- (void)setEdgeInsets:(NSNumber *)inset;
- (NSNumber *)getEdgeInsets;

@end

NS_ASSUME_NONNULL_END
