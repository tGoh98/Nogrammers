//
//  eggViewController.m
//  Nogrammers
//
//  Created by Timothy Goh on 10/10/20.
//

#import "eggViewController.h"
@import Firebase;

@interface eggViewController ()
@property (weak, nonatomic) IBOutlet UIButton *jumpButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *jumpLabel;
@property (weak, nonatomic) IBOutlet UILabel *jumpFeetText;
@property (strong, nonatomic) FIRDatabaseReference *jumpRef;
@end

@implementation eggViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jumpRef =  [[FIRDatabase database] reference];
    [self listenTotalFeet];
}

- (void)listenTotalFeet {
    [[self.jumpRef child:@"jumpFeet"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        self.jumpFeetText.text = [NSString stringWithFormat: @"%@ ft", snapshot.value];
    }];
}

- (IBAction)onJump:(id)sender {
    [self.jumpButton setImage:[UIImage imageNamed:@"kJump.png"] forState:UIControlStateNormal];
    self.jumpButton.userInteractionEnabled = NO;
    double rand = arc4random_uniform((float) 20);
    
    [UIView animateWithDuration:1.0
     animations:^{
        self.jumpButton.frame = CGRectMake(self.jumpButton.frame.origin.x, self.jumpButton.frame.origin.y - rand * 15, self.jumpButton.frame.size.width, self.jumpButton.frame.size.height);
    }
     completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0
         animations:^{
            self.jumpLabel.text = [NSString stringWithFormat:@"Jump: %.f ft!!",rand];
            
            [[self.jumpRef child:@"jumpFeet"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
                NSNumber *curFeet = [NSNumber numberWithDouble:[self.jumpFeetText.text doubleValue] + rand];
                [[self.jumpRef child:@"jumpFeet"] setValue:curFeet];
            }];

            self.jumpButton.frame = CGRectMake(self.jumpButton.frame.origin.x, self.jumpButton.frame.origin.y + rand * 15, self.jumpButton.frame.size.width, self.jumpButton.frame.size.height);
        }
         completion:^(BOOL finished) {
            [self.jumpButton setImage:[UIImage imageNamed:@"kStill.png"] forState:UIControlStateNormal];
            self.jumpButton.userInteractionEnabled = YES;
        }
     ];
    }
     
     ];
    
//    [UIView animateWithDuration:1.5 animations:^{
//        self.jumpButton.frame = CGRectMake(self.jumpButton.frame.origin.x, self.jumpButton.frame.origin.y + rand * 50, self.jumpButton.frame.size.width, self.jumpButton.frame.size.height);
//    }];
}

-(void)comeDown: (double) rand {
    self.jumpButton.frame = CGRectMake(self.jumpButton.frame.origin.x, self.jumpButton.frame.origin.y + rand * 50, self.jumpButton.frame.size.width, self.jumpButton.frame.size.height);
    self.jumpButton.userInteractionEnabled = YES;
    [self.jumpButton setImage:[UIImage imageNamed:@"kStill.png"] forState:UIControlStateNormal];
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
