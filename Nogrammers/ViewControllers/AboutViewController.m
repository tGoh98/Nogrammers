//
//  AboutViewController.m
//  Nogrammers
//
//  Created by Timothy Goh on 10/10/20.
//

#import "AboutViewController.h"

@interface AboutViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *logoImg;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)logoTapped:(id)sender {
    NSURL* url = [[NSURL alloc] initWithString: @"https://duncan.rice.edu/"];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
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
