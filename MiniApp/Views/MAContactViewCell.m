//
//  MAContactViewCell.m
//  MiniApp
//
//  Created by Quoc on 1/22/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "MAContactViewCell.h"
#import "UIImageView+AFNetworking.h"
#import <QuartzCore/QuartzCore.h>


@implementation MAContactViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)cofigurewithModel: (MAPeople *)people atIndex:(NSIndexPath *)indexPaths
{
    if ([people isKindOfClass:[MAPeople class]]) {
        self.nameContact.text = [NSString stringWithFormat:@"%@", people.name];
        if ([people.gender isEqualToString:@"male"]){
            [self.nameContact setTextColor:[UIColor orangeColor]];
        }
        else{
            [self.nameContact setTextColor:[UIColor blueColor]];
        }
        self.emailContact.text = [NSString stringWithFormat:@"%@", people.userName];
        
        [self.avatarContact setImageWithURL:[NSURL URLWithString:people.image] placeholderImage:[UIImage imageNamed:@"icon_profile.png"]];
        self.avatarContact.layer.cornerRadius = 35.0;
        self.avatarContact.clipsToBounds = YES;
        
//        self..backgroundColor = [UIColor redColor];
    }
    UIView *view = [[UIView alloc]initWithFrame:self.frame];
    view.backgroundColor = (indexPaths.row%2)?[UIColor colorWithRed:0.5 green:0.5 blue:1 alpha:0.6]:[UIColor colorWithRed:0.5 green:0.5 blue:1 alpha:0.3];
    self.backgroundView = view;
    
}

@end
