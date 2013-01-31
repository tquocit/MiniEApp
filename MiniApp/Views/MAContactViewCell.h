//
//  MAContactViewCell.h
//  MiniApp
//
//  Created by Quoc on 1/22/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "MAPeople.h"
@protocol MAStaffCellDelegate <NSObject>

-(NSString *)markStarForHighest;

@end

@interface MAContactViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameContact;
@property (weak, nonatomic) IBOutlet UILabel *emailContact;
@property (weak, nonatomic) IBOutlet UIImageView *avatarContact;
@property (weak, nonatomic) IBOutlet UIImageView *mostView;

@property (nonatomic, weak) id<MAStaffCellDelegate> delegate;

- (void)cofigurewithModel: (MAPeople *)people atIndex: (NSIndexPath *)indexPaths;
@end
