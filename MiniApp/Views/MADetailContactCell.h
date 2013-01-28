//
//  MADetailContactCell.h
//  MiniApp
//
//  Created by Quoc on 1/23/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADetailContactCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;
@property (weak, nonatomic) IBOutlet UILabel *roleDetail;

@property (weak, nonatomic) IBOutlet UILabel *emailDetail;

@property (weak, nonatomic) IBOutlet UILabel *smsDetail;

@property (weak, nonatomic) IBOutlet UILabel *likeDetail;

@property (weak, nonatomic) IBOutlet UILabel *dislikeDetail;

@end
