//
//  SecondViewController.m
//  LearningOC1
//
//  Created by  whatsup on 2024/11/4.
//

#import "SecondViewController.h"
#import "FirstClass.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, strong) FirstClass *firstClass;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.firstClass = [[FirstClass alloc] init];
    BOOL isSecond = [self isKindOfClass:[SecondViewController class]];
    NSLog(@"%@", [SecondViewController superclass]);
    BOOL isViewController = [SecondViewController isSubclassOfClass:[UIViewController class]];
    NSLog(@"%d", isSecond);
    NSLog(@"%d", isViewController);
    self.view.backgroundColor = [UIColor whiteColor];
}
- (IBAction)clickButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)dealloc {
    NSLog(@"dealloc secondViewController");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
