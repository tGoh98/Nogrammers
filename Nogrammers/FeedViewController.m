//
//  FeedViewController.m
//  Nogrammers
//
//  Created by Timothy Goh on 10/9/20.
//

#import "FeedViewController.h"
#import "FeedTableViewCell.h"
#import "AFNetworking.h"

@interface FeedViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *FeedTableView;
@property (strong, nonatomic) NSArray *events;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.FeedTableView.dataSource = self;
    self.FeedTableView.delegate = self;
    
     [self fetchEvents];
//    [self getAccessToken];
}

-(void) fetchEvents {
    NSString *urlString = @"http://riceduncan.mooo.com/api/v1/events/";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:urlString]];
    [request addValue:@"Bearer: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiVGltIEciLCJlbWFpbCI6InRtZzVAcmljZS5lZHUiLCJpYXQiOjE2MDIzMTQ0NzksImV4cCI6MTYwMjMxODA3OX0.dxrVwzsDaUF4nYQ1EAWcGrwFzSKbU1NLoFS0TNNuAqc" forHTTPHeaderField:@"Authorization"];
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
    NSString *postString = @"{email:tmg5@rice.edu,password:abcd}";
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"sad");
        }
        else {
            NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"%@", dataArray);
        }
    }];
    [task resume];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell" forIndexPath:indexPath];
    cell.descriptionLabel.text = self.events[indexPath.row][@"description"];
    NSURL *url;
    if (self.events[indexPath.row][@"image"] == [NSNull null]) {
        url = [NSURL URLWithString:@"https://duncancollegeblogsrice.files.wordpress.com/2019/05/cropped-download-2.jpg?w=240;"];
    } else {
        url = [NSURL URLWithString:self.events[indexPath.row][@"image"]];
    }
    
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
    cell.eventImage.image = [UIImage imageWithData: imageData];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.events.count;
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
