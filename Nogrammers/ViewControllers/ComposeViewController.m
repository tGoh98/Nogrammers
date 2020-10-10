//
//  ComposeViewController.m
//  Nogrammers
//
//  Created by Timothy Goh on 10/10/20.
//

#import "ComposeViewController.h"
@import Firebase;

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *shoutoutText;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) FIRDatabaseReference *fbRef;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fbRef = [[FIRDatabase database] reference];
}

- (IBAction)onSubmit:(id)sender {
    [[self.fbRef child:@"shoutouts"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        //self.posts = [NSDictionary dictionaryWithDictionary:(NSDictionary *)[snapshot children]];
        NSUInteger count = snapshot.childrenCount;
        NSString *msg = self.shoutoutText.text;
        self.fbRef = [[FIRDatabase database] reference];
        [[self.fbRef child:[NSString stringWithFormat: @"shoutouts/%lu", count]] setValue:@{@"poster":@"tgoh",@"text": msg, @"date":[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]]}];
        [self dismissViewControllerAnimated:YES completion:NULL];    }];
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
