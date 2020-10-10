//
//  SDSViewController.m
//  Nogrammers
//
//  Created by Timothy Goh on 10/10/20.
//

#import "SDSViewController.h"
#import "SDSCell.h"

@interface SDSViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *sdsTableView;
@property (strong, nonatomic) NSArray *sdsPosts;
@end

@implementation SDSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sdsTableView.delegate = self;
    self.sdsTableView.dataSource = self;
    
    [self fetchPosts];
    // Do any additional setup after loading the view.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SDSCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SDSCell" forIndexPath:indexPath];
    cell.usernameLabel.text = self.sdsPosts[indexPath.row][@"author"];
    cell.sdsText.text = self.sdsPosts[indexPath.row][@"content"];
    cell.dateLabel.text = self.sdsPosts[indexPath.row][@"timestamp"];
    
    cell.angryLabel.text = [NSString stringWithFormat:@"%@", self.sdsPosts[indexPath.row][@"reacs"][@"angry"]];
    cell.hahaLabel.text = [NSString stringWithFormat:@"%@",self.sdsPosts[indexPath.row][@"reacs"][@"haha"]];
    cell.likeLabel.text = [NSString stringWithFormat:@"%@",self.sdsPosts[indexPath.row][@"reacs"][@"like"]];
    cell.loveLabel.text = [NSString stringWithFormat:@"%@",self.sdsPosts[indexPath.row][@"reacs"][@"love"]];
    cell.sadLabel.text = [NSString stringWithFormat:@"%@",self.sdsPosts[indexPath.row][@"reacs"][@"sad"]];
    cell.wowLabel.text = [NSString stringWithFormat:@"%@",self.sdsPosts[indexPath.row][@"reacs"][@"wow"]];
    cell.userImage.image = [UIImage imageNamed:@"kFB.png"];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sdsPosts.count;
}

-(void) fetchPosts {
    NSString *urlString = @"https://fbmock.uc.r.appspot.com/groups/posts";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:urlString]];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"sad");
        }
        else {
            NSDictionary *dataArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            self.sdsPosts = dataArray[@"recent_posts"];
            NSLog(@"%@", self.sdsPosts);
            [self.sdsTableView reloadData];
            
        }
    }];
    [task resume];
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
