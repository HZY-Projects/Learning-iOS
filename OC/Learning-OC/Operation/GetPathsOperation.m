//
//  GetPathsOperation.m
//  LearningOC1
//
//  Created by  whatsup on 2024/11/18.
//

#import "GetPathsOperation.h"
#import "LoadOperation.h"
 
@interface GetPathsOperation ()
{
    NSURL *rootURL;
    NSOperationQueue *queue;
    NSInteger ourScanCount;
}
 
@property (retain) NSURL *rootURL;
@property (retain) NSOperationQueue *queue;
 
@end
 
@implementation GetPathsOperation
 
@synthesize rootURL, queue;
 
// -------------------------------------------------------------------------------
//  initWithRootPath:
// -------------------------------------------------------------------------------
- (id)initWithRootURL:(NSURL *)url queue:(NSOperationQueue *)qq scanCount:(NSInteger)scanCount
{
    self = [super init];
    if (self)
    {
        self.rootURL = url;
        self.queue = qq;
        ourScanCount = scanCount;
    }
    return self;
}
 
// -------------------------------------------------------------------------------
//  main:
// -------------------------------------------------------------------------------
- (void)main
{
    NSDirectoryEnumerator *itr =
        [[NSFileManager defaultManager] enumeratorAtURL:self.rootURL
                             includingPropertiesForKeys:nil
                                                options:(NSDirectoryEnumerationSkipsHiddenFiles | NSDirectoryEnumerationSkipsPackageDescendants)
                                           errorHandler:nil];
    for (NSURL *url in itr)
    {
        if ([self isCancelled])
        {
            break;  // user cancelled this operation
        }
    
        // use NSOperation subclass "LoadOperation"
        LoadOperation *op = [[LoadOperation alloc] initWithURL:url scanCount:ourScanCount];
        [op setQueuePriority:2.0];      // second priority
        [self.queue addOperation:op];   // this will start the load operation
    }
}
 
@end
