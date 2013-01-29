//
//  MADetailContactCell.h
//  MiniApp
//
//  Created by Quoc on 1/23/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAPeople.h"

@interface MADetailContactCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageDetail;
@property (weak, nonatomic) IBOutlet UILabel *contentDetail;

- (void)configurewithDetail: (MAPeople *)detailPeople atIndexPath:(NSIndexPath *)indexPath;
@end
