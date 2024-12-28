//
//  GetPathsOperation.h
//  LearningOC1
//
//  Created by  whatsup on 2024/11/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GetPathsOperation : NSOperation

- (id)initWithRootURL:(NSURL *)url queue:(NSOperationQueue *)qq scanCount:(NSInteger)scanCount;

@end

NS_ASSUME_NONNULL_END
