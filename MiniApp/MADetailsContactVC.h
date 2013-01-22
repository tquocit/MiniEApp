//
//  MADetailsFeedVC.h
//  MiniApp
//
//  Created by Quoc on 1/21/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAPeople.h"
@interface MADetailsFeedVC : UITableViewController
@property (strong,nonatomic) MAPeople *people;
@property (strong) NSMutableArray *heightArray;
@end
