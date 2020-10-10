//
//  FeedTableViewCell.h
//  Nogrammers
//
//  Created by Timothy Goh on 10/9/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FeedTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *apiButton;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *eventImage;

@end

NS_ASSUME_NONNULL_END
