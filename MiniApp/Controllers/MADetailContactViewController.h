//
//  MADetailContactViewController.h
//  MiniApp
//
//  Created by Quoc on 1/23/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAPeople.h"
@interface MADetailContactViewController : UITableViewController <UINavigationControllerDelegate, UIActionSheetDelegate>

@property (strong, nonatomic) MAPeople *people;
@property (strong, nonatomic) NSMutableArray *heightArray;

@end
