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
            [self.nameContact setTextColor:[UIColor colorWithRed:100.0/255 green:0.0/255 blue:1.0/255 alpha:0.6]];
        }
        else{
            [self.nameContact setTextColor:[UIColor blueColor]];
        }
        self.emailContact.text = [NSString stringWithFormat:@"%@", people.userName];
        
        [self.avatarContact setImageWithURL:[NSURL URLWithString:people.image] placeholderImage:[UIImage imageNamed:@"icon_profile.png"]];
        self.avatarContact.layer.cornerRadius = 30.0;
        self.avatarContact.clipsToBounds = YES;
        
//        self..backgroundColor = [UIColor redColor];
    }
    UIView *view = [[UIView alloc]initWithFrame:self.frame];
    switch (indexPaths.row%5) {
        case 0:
            view.backgroundColor = [UIColor colorWithRed:231.0/255 green:27.0/255 blue:30.0/255 alpha:0.6];
            self.backgroundView = view;
            break;
        case 1:
            view.backgroundColor = [UIColor colorWithRed:237.0/255 green:106.0/255 blue:24.0/255 alpha:0.9];
            self.backgroundView = view;
            break;
        case 2:
            view.backgroundColor = [UIColor colorWithRed:231.0/255 green:215.0/255 blue:57.0/255 alpha:1];
            self.backgroundView = view;
            break;
        case 3:
            view.backgroundColor = [UIColor colorWithRed:143.0/255 green:164.0/255 blue:231.0/255 alpha:1];
            self.backgroundView = view;
            break;
        case 4:
            view.backgroundColor = [UIColor colorWithRed:19.0/255 green:186.0/255 blue:94.0/255 alpha:1];
            self.backgroundView = view;
            break;
            
        default:
            break;
    }
    
    self.mostView.hidden = YES;
    if ([[self.delegate markStarForHighest] isEqualToString:people.name]) {
        self.mostView.hidden = NO;
    }
    
    
    
}

@end
