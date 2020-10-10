//
//  FeedTableViewCell.m
//  Nogrammers
//
//  Created by Timothy Goh on 10/9/20.
//

#import "FeedTableViewCell.h"

@implementation FeedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)onTap:(id)sender {
    self.apiButton.tintColor = UIColor.cyanColor;
    
    NSString *urlString = @"http://riceduncan.mooo.com/api/v1/events/";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:urlString]];
    [request addValue:@"Bearer: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiVGltIEciLCJlbWFpbCI6InRtZzVAcmljZS5lZHUiLCJpYXQiOjE2MDIzMDg3OTcsImV4cCI6MTYwMjMxMjM5N30.vlwRfRMLSsVm661Iy-cq-gQC1xxbnefMf2fiCekbHI4" forHTTPHeaderField:@"Authorization"];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"sad");
        }
        else {
            NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"%@", [dataDictionary description]);
        }
    }];
    [task resume];
       
    
}




@end
//
//- (NSString *) getDataFrom:(NSString *)url{
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setHTTPMethod:@"GET"];
//    [request setURL:[NSURL URLWithString:url]];
//    [request addValue:@"Bearer: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiVGltIEciLCJlbWFpbCI6InRtZzVAcmljZS5lZHUiLCJpYXQiOjE2MDIzMDY5NTMsImV4cCI6MTYwMjMxMDU1M30.6yr2wrR_JpRMEXPl1_3SuWmUlpRw10DaNQxjrqEtLno" forHTTPHeaderField:@"Authorization"];
//
//    NSError *error = nil;
//    NSHTTPURLResponse *responseCode = nil;
//
//    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
//
//    if([responseCode statusCode] != 200){
//        NSLog(@"Error getting %@, HTTP status code %i", url, [responseCode statusCode]);
//        return nil;
//    }
//
//    return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
//}

//GET request -> http://riceduncan.mooo.com/api/v1/events/
//Authorization, Bearer: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiVGltIEciLCJlbWFpbCI6InRtZzVAcmljZS5lZHUiLCJpYXQiOjE2MDIzMDY5NTMsImV4cCI6MTYwMjMxMDU1M30.6yr2wrR_JpRMEXPl1_3SuWmUlpRw10DaNQxjrqEtLno

// get back a response
