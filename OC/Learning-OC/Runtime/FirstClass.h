//
//  FirstClass.h
//  LearningOC1
//
//  Created by  whatsup on 2024/11/4.
//

#import <Foundation/Foundation.h>
#import "FirstSubClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstClass : NSObject <NSCopying, NSMutableCopying>

+ (void)initialize;

@property (nonatomic, strong) FirstSubClass *firstSub;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *lastName;

@end

NS_ASSUME_NONNULL_END
