//
//  OperationViewController.m
//  LearningOC1
//
//  Created by  whatsup on 2024/11/18.
//

#import "OperationViewController.h"

@interface OperationViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *tableRecords;
@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableString *imagesFoundStr;
@property (nonatomic, assign) NSInteger scanCount;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation OperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.queue = [[NSOperationQueue alloc] init];
    self.tableRecords = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(anyThread_handleLoadedImages:)
                                                 name:kLoadImageDidFinish
                                               object:nil];
        
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)setResultsString:(NSString *)string
{
    [self willChangeValueForKey:@"imagesFoundStr"];
    self.imagesFoundStr = [NSMutableString stringWithString:string];
    [self didChangeValueForKey:@"imagesFoundStr"];
}

- (void)updateCountIndicator
{
    // set the number of images found indicator string
    NSString *resultStr = [NSString stringWithFormat:@"Images found: %ld", [self.tableRecords count]];
    [self setResultsString: resultStr];
}
    
- (void)mainThread_handleLoadedImages:(NSNotification *)note
{
    // Pending NSNotifications can possibly back up while waiting to be executed,
    // and if the user stops the queue, we may have left-over pending
    // notifications to process.
    //
    // So make sure we have "active" running NSOperations in the queue
    // if we are to continuously add found image files to the table view.
    // Otherwise, we let any remaining notifications drain out.
    //
    NSDictionary *notifData = [note userInfo];
    
    NSNumber *loadScanCountNum = [notifData valueForKey:kScanCountKey];
    NSInteger loadScanCount = [loadScanCountNum integerValue];
    
    
        // make sure the current scan matches the scan of our loaded image
        if (self.scanCount == loadScanCount)
        {
            [self.tableRecords addObject:notifData];
            [self.tableView reloadData];
            
            // set the number of images found indicator string
            [self updateCountIndicator];
        }
}

- (void)anyThread_handleLoadedImages:(NSNotification *)note
{
    // update our table view on the main thread
    [self performSelectorOnMainThread:@selector(mainThread_handleLoadedImages:) withObject:note waitUntilDone:NO];
}

- (void)loadFileURLs:(NSURL *)fromURL
{
    [self.queue cancelAllOperations];
    
    // start the GetPathsOperation with the root path to start the search
    GetPathsOperation *getPathsOp = [[GetPathsOperation alloc] initWithRootURL:fromURL queue:self.queue scanCount:self.scanCount];
    
    [self.queue addOperation:getPathsOp];    // this will start the "GetPathsOperation"
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cells";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Text %li", (long)indexPath.row];
    return cell;
}



@end
