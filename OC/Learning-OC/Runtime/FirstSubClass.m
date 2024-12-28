//
//  FirstSubClass.m
//  LearningOC1
//
//  Created by  whatsup on 2024/11/9.
//

#import "FirstSubClass.h"

@implementation FirstSubClass

- (instancetype)initWithLast:(NSString *)last {
    if (self = [super init]) {
        self.last = last;
    }
    return self;
}

- (instancetype)initWithDicMethod1:(NSDictionary *)dic {
    if (self = [super init]) {
        _name = dic[@"name"];
        _age = [dic[@"age"] integerValue];
        _level = dic[@"level"];
    }
    return self;
}

- (instancetype)initWithDicMethod2:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValue:dic[@"name"] forKey:@"name"];
        [self setValue:dic[@"age"] forKey:@"age"];
        [self setValue:dic[@"level"] forKey:@"level"];
    }
    return self;
}

- (instancetype)initWithDicMethod3:(NSDictionary *)dic {
    if (self = [super init]) {
        for (NSString *key in dic) {
            id value = dic[key];
            [self setValue:value forKey:key];
        }
    }
    return self;
}

- (instancetype)initWithDicMethod4:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"number"]) {
        _number = 0;
    } else {
        [super setNilValueForKey:key];
    }
}

- (void)setFirstVar:(NSString *)firstVar {
    _firstVar = firstVar;
}

- (NSString *)firstVar {
    return _firstVar;
}

@end
