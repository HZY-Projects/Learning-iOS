//
//  LoadOperation.h
//  LearningOC1
//
//  Created by  whatsup on 2024/11/18.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *kScanCountKey;
extern NSString *kPathKey;
extern NSString *kLoadImageDidFinish;

@interface LoadOperation : NSOperation

- (id)initWithURL:(NSURL *)url scanCount:(NSInteger)scanCount;

@end

NS_ASSUME_NONNULL_END
