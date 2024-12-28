//
//  SecondClass.h
//  LearningOC1
//
//  Created by  whatsup on 2024/11/4.
//

#import <Foundation/Foundation.h>
#import "FirstClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondClass : FirstClass
@property (strong, nonatomic) NSString *secondName;
@end

NS_ASSUME_NONNULL_END
