//
//  MADetailContactCell.m
//  MiniApp
//
//  Created by Quoc on 1/23/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "MADetailContactCell.h"
#import "UIImageView+AFNetworking.h"
#import <QuartzCore/QuartzCore.h>

@implementation MADetailContactCell

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

- (void)configurewithDetail:(MAPeople *)detailPeople
                atIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self.imageDetail setFrame:(CGRectMake(10, 10, 65, 65))];
            [self.imageDetail setImageWithURL:[NSURL URLWithString:detailPeople.image] placeholderImage:[UIImage imageNamed:@"icon_profile"]];
            self.contentDetail.text = [NSString stringWithFormat:@"%@",detailPeople.role];
            self.imageDetail.layer.cornerRadius = 35;
            self.imageDetail.clipsToBounds = YES;
            break;
        case 1:
            self.imageDetail.image = [UIImage imageNamed:@"icon_email.png"];
            if (detailPeople.userName) {
                self.contentDetail.text = detailPeople.userName;
            }
            break;
        case 2:
            self.imageDetail.image = [UIImage imageNamed:@"icon_sms.png"];
            if (detailPeople.contact) {
                self.contentDetail.text = detailPeople.contact;
            }
            break;
        case 3:
            self.imageDetail.image = [UIImage imageNamed:@"icon_like.png"];
            self.contentDetail.text = detailPeople.like;

            break;
        case 4:
            self.imageDetail.image = [UIImage imageNamed:@"icon_dislike.png"];
            self.contentDetail.text = detailPeople.dislike;
            break;
        default:
            break;
    }
    self.contentDetail.numberOfLines = 0;
    self.contentDetail.lineBreakMode = NSLineBreakByWordWrapping;
    

}

@end
