//
//  ViewController.h
//  LearningOC1
//
//  Created by  whatsup on 2024/11/4.
//

#import <UIKit/UIKit.h>

@protocol MyProtocol <NSObject>

@property (nonatomic, readonly) NSString *pd;

- (void)dosomething;

@end

@interface ViewController : UIViewController

@property (nonatomic, weak) id<MyProtocol> delegate;
- (void)doSomeProtocol;

- (void)classFunction;
- (void)dosomething;
@end

