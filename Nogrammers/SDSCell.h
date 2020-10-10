//
//  SDSCell.h
//  Nogrammers
//
//  Created by Timothy Goh on 10/10/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDSCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;
@property (weak, nonatomic) IBOutlet UILabel *loveLabel;
@property (weak, nonatomic) IBOutlet UILabel *hahaLabel;
@property (weak, nonatomic) IBOutlet UILabel *wowLabel;
@property (weak, nonatomic) IBOutlet UILabel *sadLabel;
@property (weak, nonatomic) IBOutlet UILabel *angryLabel;
@property (weak, nonatomic) IBOutlet UILabel *sdsText;

@end

NS_ASSUME_NONNULL_END
