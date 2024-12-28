//
//  FirstSubClass.h
//  LearningOC1
//
//  Created by  whatsup on 2024/11/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstSubClass : NSObject {
    //实例变量 不生成setget 引用计数不增加 不涉及内存
    @public
    NSString *_var;
    NSString *_firstVar;
}

@property (nonatomic, strong) NSString *last;

- (instancetype)initWithLast:(NSString *)last;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NSNumber *level;
@property (nonatomic, assign) int number;


- (instancetype)initWithDicMethod1:(NSDictionary *)dic;
- (instancetype)initWithDicMethod2:(NSDictionary *)dic;
- (instancetype)initWithDicMethod3:(NSDictionary *)dic;
- (instancetype)initWithDicMethod4:(NSDictionary *)dic;

- (void)setFirstVar:(NSString *)firstVar;
- (NSString *)firstVar;

@end

NS_ASSUME_NONNULL_END
