//
//  MADetailContactCell.h
//  MiniApp
//
//  Created by Quoc on 1/23/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADetailContactCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageDetail;
@property (weak, nonatomic) IBOutlet UILabel *myContentDetail;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *role;

@end
