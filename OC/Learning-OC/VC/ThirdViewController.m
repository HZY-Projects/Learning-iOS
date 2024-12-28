//
//  ThirdViewController.m
//  LearningOC1
//
//  Created by  whatsup on 2024/11/4.
//

#import "ThirdViewController.h"
#import "FirstClass.h"

@interface ThirdViewController ()
@property (nonatomic, strong) FirstClass *firstClass;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(100, 100, 100, 50);
    button.titleLabel.text = @"Button";
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.firstClass = [FirstClass new];
}

- (void)dealloc {
    NSLog(@"dealloc ThirdViewController");
}

- (void)clickButton:(UIButton *)render {
    [self dismissViewControllerAnimated:true completion:nil];
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
