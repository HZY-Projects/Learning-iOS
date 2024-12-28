//
//  TableViewCell.m
//  LearningOC1
//
//  Created by  whatsup on 2024/11/20.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier: reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    self.lab = [[UILabel alloc] init];
    self.lab.frame = CGRectMake(0, 0, 100, 30);
    [self addSubview:self.lab];
    NSTimer *timer = [NSTimer timerWithTimeInterval:1 repeats:true block:^(NSTimer * _Nonnull timer) {
        NSLog(@"1");
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//    NSThread *thread = [[NSThread alloc] initWithBlock:^{
//        NSTimer *timer = [[NSTimer alloc] initWithFireDate:NSDate.now interval:1 repeats:true block:^(NSTimer * _Nonnull timer) {
//            NSLog(@"1");
//        }];
//        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] run];
//    }];
//    [thread start];
}

@end
