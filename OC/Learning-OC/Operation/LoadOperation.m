//
//  LoadOperation.m
//  LearningOC1
//
//  Created by  whatsup on 2024/11/18.
//

#import "LoadOperation.h"
#import <UniformTypeIdentifiers/UTCoreTypes.h>
#import <UniformTypeIdentifiers/UTType.h>
 
NSString *kScanCountKey = @"scanCount";
NSString *kPathKey = @"path";
NSString *kSizeKey = @"size";
NSString *kNameKey = @"name";
NSString *kModifiedKey = @"modified";
NSString *kLoadImageDidFinish = @"LoadImageDidFinish";
 
@interface LoadOperation () {
    NSURL *loadURL;
    NSInteger ourScanCount;
}
 
@property (retain) NSURL *loadURL;
 
@end
 
 
@implementation LoadOperation
 
@synthesize loadURL;
 
// -------------------------------------------------------------------------------
//  initWithPath:path
// -------------------------------------------------------------------------------
- (id)initWithURL:(NSURL *)url scanCount:(NSInteger)scanCount
{
    self = [super init];
    if (self)
    {
        self.loadURL = url;
        ourScanCount = scanCount;
    }
    return self;
}
 

- (BOOL)isImageFile:(NSURL *)url {
    BOOL isImageFile = NO;

    NSString *utiValue;
    [url getResourceValue:&utiValue forKey:NSURLTypeIdentifierKey error:nil];
    if (utiValue) {
        UTType *type = [UTType typeWithIdentifier:utiValue];
        isImageFile = [type conformsToType:UTTypeImage];
    }
    return isImageFile;
}
 
- (void)main {
    if (![self isCancelled])
    {
        // test to see if it's an image file
        if ([self isImageFile:loadURL])
        {
            // in this example, we just get the file's info (mod date, file size) and report it to the table view
            //
            NSNumber *fileSize;
            [self.loadURL getResourceValue:&fileSize forKey:NSURLFileSizeKey error:nil];
            
            NSDate *fileCreationDate;
            [self.loadURL getResourceValue:&fileCreationDate forKey:NSURLCreationDateKey error:nil];
            
            NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
            [formatter setTimeStyle:NSDateFormatterNoStyle];
            [formatter setDateStyle:NSDateFormatterShortStyle];
            NSString *modDateStr = [formatter stringFromDate:fileCreationDate];
            
            NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:
                                  [self.loadURL lastPathComponent], kNameKey,
                                  [self.loadURL absoluteString], kPathKey,
                                  modDateStr, kModifiedKey,
                                  [NSString stringWithFormat:@"%ld", [fileSize integerValue]], kSizeKey,
                                  [NSNumber numberWithInteger:ourScanCount], kScanCountKey,  // pass back to check if user cancelled/started a new scan
                                  nil];
            
            if (![self isCancelled])
            {
                // for the purposes of this sample, we're just going to post the information
                // out there and let whoever might be interested receive it (in our case its MyWindowController).
                //
                [[NSNotificationCenter defaultCenter] postNotificationName:kLoadImageDidFinish object:nil userInfo:info];
            }
        }
    }
}
 
@end
