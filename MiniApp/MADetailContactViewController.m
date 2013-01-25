//
//  MADetailContactViewController.m
//  MiniApp
//
//  Created by Quoc on 1/23/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "MADetailContactViewController.h"
#import "MADetailContactCell.h"
#import "UIImageView+AFNetworking.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#define PADDING 35;
@interface MADetailContactViewController () <MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>
@end

@implementation MADetailContactViewController

- (NSMutableArray *)heightArray
{
    if(!_heightArray)
        _heightArray = [NSMutableArray array];
    return _heightArray;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.people.name;
    MADetailContactCell *avatarcell = [self.tableView dequeueReusableCellWithIdentifier:@"AvatarCell"];
    MADetailContactCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"EmailCell"];

    NSMutableArray *mutable = [NSMutableArray array];
    
    UIFont *font = cell.emailDetail.font;
    CGFloat width = cell.emailDetail.frame.size.width;
    
    
       
    
    //calculate size for image and role
    CGSize sizelable = [self.people.role sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000)];
    if (sizelable.height < avatarcell.frame.size.height) {
        sizelable.height = avatarcell.frame.size.height;
    }
    mutable = [NSMutableArray arrayWithObject:[NSNumber numberWithDouble:sizelable.height]];

    //calculate size for email
    sizelable = [self.people.userName sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000)];
    [mutable addObject:[NSNumber numberWithDouble:sizelable.height]];
    
    //calculate size for contact number
    sizelable = [self.people.contact sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000) ];
    [mutable addObject:[NSNumber numberWithDouble:sizelable.height]];
    
    //calculate size for like
    sizelable = [self.people.like sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000)];
    if (sizelable.height < cell.frame.size.height) {
        sizelable.height = cell.frame.size.height;
    }
    [mutable addObject:[NSNumber numberWithDouble:sizelable.height]];
    
    //calculate size for dislike
    sizelable = [self.people.dislike sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000)];
    if (sizelable.height < cell.frame.size.height) {
        sizelable.height = cell.frame.size.height;
    }
    [mutable addObject:[NSNumber numberWithDouble:sizelable.height]];

    self.heightArray = [mutable copy];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self.heightArray objectAtIndex:indexPath.row] doubleValue]+PADDING;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MADetailContactCell *cell;
    switch (indexPath.row) {
        case 0:{
            cell = [tableView dequeueReusableCellWithIdentifier:@"AvatarCell"];
            [cell.avatarImage setImageWithURL:[NSURL URLWithString:self.people.image] placeholderImage:[UIImage imageNamed:@"icon_profile.png"]];
            cell.roleDetail.text = [self.people valueForKey:@"role"];
            
            break;}
        case 1:{
            cell = [tableView dequeueReusableCellWithIdentifier:@"EmailCell"];
            cell.emailDetail.text = [self.people valueForKey:@"userName"];
            
            break;}
            
        case 2:{
            cell = [tableView dequeueReusableCellWithIdentifier:@"SMSCell"];
//            if (!self.people.contact) {
//                
//            }
//            else{
//                cell.smsDetail.text = [self.people valueForKey:@"contact"];
//            }
            cell.smsDetail.text = [self.people valueForKey:@"contact"];

            break;}
        case 3:{
            cell = [tableView dequeueReusableCellWithIdentifier:@"LikeCell"];
            cell.likeDetail.text = [self.people valueForKey:@"like"];
            [cell.likeDetail sizeToFit];
            break;}
        case 4: {
            cell = [tableView dequeueReusableCellWithIdentifier:@"DislikeCell"];
            cell.dislikeDetail.text = [self.people valueForKey:@"dislike"];
            [cell.dislikeDetail sizeToFit];
            
            break;
        }
        default:
            break;
    }
    [cell.roleDetail sizeToFit];
   
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        [self mail_check];
    }
    if (indexPath.row == 2) {
        [self sms_check];
    }
}

- (void)mail_check
{
    Class emailClass=(NSClassFromString(@"MFMailComposeViewController"));
    if (emailClass!=nil)
    {
        if ([emailClass canSendMail])
            [self displayComposerSheet];
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Email cannot be send!"
                                                         message:@"Device is not configured to send email"
                                                        delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Email cannot be send!"
                                                     message:@"Device cannot send email"
                                                    delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}


- (void)displayComposerSheet
{
    MFMailComposeViewController *composePage=[[MFMailComposeViewController alloc]init];
    composePage.mailComposeDelegate=self;
    
    NSArray *recipients=[NSArray arrayWithObject:self.people.userName];
    
    [composePage setToRecipients:recipients];
//    NSArray *ccRecipients = [NSArray arrayWithObjects:@"second@example.com", @"third@example.com", nil];
//    NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@example.com"];

    [composePage setSubject:@"This is a test email."];
    [composePage setMessageBody:@"Hi, I just mailed to say I love you." isHTML:NO];
    [composePage setTitle:@"Email"];
    
    // Attach an image to the email
    NSString *path = [[NSBundle mainBundle] pathForResource:@"rainy" ofType:@"png"];
    NSData *myData = [NSData dataWithContentsOfFile:path];
    [composePage addAttachmentData:myData mimeType:@"image/png" fileName:@"rainy"];

    composePage.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:composePage animated:YES completion:nil];

}
// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.
-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)sms_check
{
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
	if([MFMessageComposeViewController canSendText])
	{
		controller.body = @"Hello from Mugunth";
		controller.recipients = [NSArray arrayWithObjects:@"12345678", @"87654321", nil];
		controller.messageComposeDelegate = self;
		[self presentModalViewController:controller animated:YES];
	}
}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
	switch (result) {
		case MessageComposeResultCancelled:
			NSLog(@"Cancelled");
			break;
		case MessageComposeResultFailed:
			
			break;
		case MessageComposeResultSent:
            
			break;
		default:
			break;
	}
    
	[self dismissModalViewControllerAnimated:YES];
}
@end
