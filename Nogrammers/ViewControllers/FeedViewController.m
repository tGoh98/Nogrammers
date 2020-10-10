//
//  FeedViewController.m
//  Nogrammers
//
//  Created by Timothy Goh on 10/9/20.
//

#import "FeedViewController.h"
#import "FeedTableViewCell.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
@import Firebase;

@interface FeedViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *FeedTableView;
@property (strong, nonatomic) NSArray *events;
@property (strong, nonatomic) NSString *token;
@property (strong, nonatomic) FIRDatabaseReference *fbRef;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.FeedTableView.dataSource = self;
    self.FeedTableView.delegate = self;
    
//    [self fetchEvents];
}

- (void)viewDidAppear:(BOOL)animated {
    [self getAccessToken];
}

-(void) fetchEvents {
    NSString *urlString = @"http://riceduncan.mooo.com/api/v1/events/";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:urlString]];
    [request addValue:[NSString stringWithFormat:@"Bearer: %@", self.token] forHTTPHeaderField:@"Authorization"];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"sad");
        }
        else {
            NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            self.events = dataArray;
            NSLog(@"%@", self.events);
            [self.FeedTableView reloadData];
            
        }
    }];
    [task resume];
}

-(void) getAccessToken {
    NSString *urlString = @"http://riceduncan.mooo.com/api/v1/auth/login";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setURL:[NSURL URLWithString:urlString]];
    NSDictionary *postDict = @{ @"email" : @"tmg5@rice.edu", @"password" : @"abcd"};
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:postDict options:0 error:&error];
    [request setHTTPBody:jsonData];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"sad");
        }
        else {
            NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"%@", dataDict);
            self.token = dataDict[@"token"];
            [self fetchEvents];
        }
    }];
    [task resume];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell" forIndexPath:indexPath];
    cell.descriptionLabel.text = self.events[indexPath.row + 1][@"description"];
    NSURL *url;
    if (self.events[indexPath.row + 1][@"image"] == [NSNull null]) {
        url = [NSURL URLWithString:@"https://duncancollegeblogsrice.files.wordpress.com/2019/05/cropped-download-2.jpg?w=240;"];
    } else {
        url = [NSURL URLWithString:self.events[indexPath.row + 1][@"image"]];
    }
    
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
    cell.eventImage.image = [UIImage imageWithData: imageData];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.events.count - 1;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}


@end
