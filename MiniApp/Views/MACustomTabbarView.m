//
//  MACustomTabbarView.m
//  MiniApp
//
//  Created by Quoc on 1/25/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "MACustomTabbarView.h"

@implementation MACustomTabbarView
@synthesize delegate;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (IBAction)infoTouch:(id)sender
{
    if(self.delegate != nil && [self.delegate respondsToSelector:@selector(tabWasSelected:)]) {
        
        [self.infoButton setImage:[UIImage imageNamed:@"icon_info_selected.png"] forState:UIControlStateNormal];
        [self.contactButton setImage:[UIImage imageNamed:@"icon_contacts.png"] forState:UIControlStateNormal];
        [self.delegate tabWasSelected:self.infoButton.tag];
    }
}

- (IBAction)contactTouch:(id)sender {
    if(self.delegate != nil && [self.delegate respondsToSelector:@selector(tabWasSelected:)]) {
        [self.infoButton setImage:[UIImage imageNamed:@"icon_info.png"] forState:UIControlStateNormal];
        [self.contactButton setImage:[UIImage imageNamed:@"icon_contacts_selected.png"] forState:UIControlStateNormal];
        [self.delegate tabWasSelected:self.contactButton.tag];

    }
}




@end
