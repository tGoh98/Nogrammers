//
//  ShoutOutViewController.m
//  Nogrammers
//
//  Created by Timothy Goh on 10/10/20.
//

#import "ShoutOutViewController.h"
#import "ShoutOutCell.h"
@import Firebase;

@interface ShoutOutViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *shoutoutsTableView;
@property (strong, nonatomic) FIRDatabaseReference *fbRef;
@property (strong, nonatomic) NSArray *posts;

@end

@implementation ShoutOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fbRef =  [[FIRDatabase database] reference];
    self.shoutoutsTableView.dataSource = self;
    self.shoutoutsTableView.delegate = self;
    [self fetchPosts];
}

- (void)fetchPosts {
    [[self.fbRef child:@"shoutouts"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        //self.posts = [NSDictionary dictionaryWithDictionary:(NSDictionary *)[snapshot children]];
        NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];

        self.posts = [snapshot.value sortedArrayUsingDescriptors:@[sort]];
        [self.shoutoutsTableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShoutOutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoutOutCell"];
    cell.descriptionLabel.text = self.posts[indexPath.row][@"text"];
    cell.usernameLabel.text = self.posts[indexPath.row][@"poster"];
    double date = [self.posts[indexPath.row][@"date"] doubleValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterShortStyle;
    NSString *dateString = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
    
    cell.dateLabel.text = dateString;
    return cell;
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
