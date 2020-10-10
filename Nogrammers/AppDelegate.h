//
//  AppDelegate.h
//  Nogrammers
//
//  Created by Timothy Goh on 10/9/20.
//

#import <UIKit/UIKit.h>
@import Firebase;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) FIRDatabaseReference *fbRef;

@end

