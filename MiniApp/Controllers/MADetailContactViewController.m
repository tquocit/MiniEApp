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

#define PADDING 15;
#define DEFAULTWIDTH 216;
@interface MADetailContactViewController ()
@property (nonatomic) int countCell;
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
    self.navigationController.delegate = self;
    self.title = self.people.name;
    MADetailContactCell *avatarcell = [self.tableView dequeueReusableCellWithIdentifier:@"AvatarCell"];
    MADetailContactCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"EmailCell"];
    
    NSMutableArray *mutable = [NSMutableArray array];
    
    UIFont *font = avatarcell.contentDetail.font;
    CGFloat width = avatarcell.contentDetail.frame.size.width;
    
    
    //calculate size for image and role
    CGSize sizelable = [self.people.role sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000) lineBreakMode:UILineBreakModeWordWrap];
    if (sizelable.height < avatarcell.frame.size.height) {
        sizelable.height = avatarcell.frame.size.height;
    }
    mutable = [NSMutableArray arrayWithObject:[NSNumber numberWithDouble:sizelable.height]];

    //calculate size for email
    [mutable addObject:[NSNumber numberWithDouble:cell.frame.size.height]];
    
    //calculate size for contact number
    [mutable addObject:[NSNumber numberWithDouble:cell.frame.size.height]];
    
    //calculate size for like
    sizelable = [self.people.like sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000) lineBreakMode:UILineBreakModeWordWrap];
    if (sizelable.height < cell.frame.size.height) {
        sizelable.height = cell.frame.size.height;
    }
    [mutable addObject:[NSNumber numberWithDouble:sizelable.height]];
    
    //calculate size for dislike
    sizelable = [self.people.dislike sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000) lineBreakMode:UILineBreakModeWordWrap];
    if (sizelable.height < cell.frame.size.height) {
        sizelable.height = cell.frame.size.height;
    }
    [mutable addObject:[NSNumber numberWithDouble:sizelable.height]];

    self.heightArray = [mutable copy];
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backButtonImage = [UIImage imageNamed:@"icon_back.png"];
    [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(getBack:) forControlEvents:UIControlEventTouchUpInside];
    backButton.frame = CGRectMake(0.0f, 0.0f, backButtonImage.size.width, backButtonImage.size.height);
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backButtonItem;
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *addButtonImage = [UIImage imageNamed:@"icon_add_contact.png"];
    [addButton setBackgroundImage:addButtonImage forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addToContact:) forControlEvents:UIControlEventTouchUpInside];
    addButton.frame = CGRectMake(0.0f, 0.0f, addButtonImage.size.width, addButtonImage.size.height);
    UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addButton];
    self.navigationItem.rightBarButtonItem = addButtonItem;
    
}

//get back to contact list
- (void)getBack:(id)sender {
    if(self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

//button to add 1 people to address book
- (void)addToContact:(id)sender
{
    NSString *message = [NSString stringWithFormat:@"Do you want to add %@ to your Address Book?", self.people.name];
    UIActionSheet * action = [[UIActionSheet alloc]
                              initWithTitle:message
                              delegate: self
                              cancelButtonTitle:@"Cancel"
                              destructiveButtonTitle:nil
                              otherButtonTitles:@"Yes",nil];
    [action showFromBarButtonItem:self.navigationItem.rightBarButtonItem animated:YES];
    [action setActionSheetStyle:UIActionSheetStyleBlackOpaque];
}

//action add
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        CFErrorRef  anError = NULL;
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &anError);
        ABRecordRef newContact = ABPersonCreate();

        //ABRecordsetvalue to set name
        
        ABRecordSetValue(newContact, kABPersonFirstNameProperty, CFBridgingRetain(self.people.name), &anError);
        ABRecordSetValue(newContact, kABPersonOrganizationProperty, @"2359Media", &anError);
        ABRecordSetValue(newContact, kABPersonNoteProperty, CFBridgingRetain(self.people.role), &anError);
        
        //use ABMutableMultiValueRef to add another value
        
        //set phone
        if(self.people.contact) {
            ABMutableMultiValueRef phones = ABMultiValueCreateMutable(kABMultiStringPropertyType);
            ABMultiValueAddValueAndLabel(phones, CFBridgingRetain(self.people.contact), kABWorkLabel, NULL) ;
            ABRecordSetValue(newContact, kABPersonPhoneProperty, phones, &anError);
        }
        
        //set Email
        if(self.people.userName){
            ABMutableMultiValueRef emails = ABMultiValueCreateMutable(kABMultiStringPropertyType);
            ABMultiValueAddValueAndLabel(emails, CFBridgingRetain(self.people.userName), kABWorkLabel, NULL);
            ABRecordSetValue(newContact, kABPersonEmailProperty, emails, &anError);
        }
        
        ABAddressBookAddRecord(addressBook, newContact, &anError);
        ABAddressBookSave(addressBook, &anError);
        UIAlertView *success = [[UIAlertView alloc] init];
        [success addButtonWithTitle:@"Success"];
        [success show];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//animation for each cell
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([viewController isMemberOfClass:[MADetailContactViewController class]]) {
        [self.tableView beginUpdates];
        NSArray *indexPaths = [NSArray arrayWithObjects:
                               [NSIndexPath indexPathForRow:0 inSection:0],
                               [NSIndexPath indexPathForRow:1 inSection:0],
                               [NSIndexPath indexPathForRow:2 inSection:0],
                               [NSIndexPath indexPathForRow:3 inSection:0],
                               [NSIndexPath indexPathForRow:4 inSection:0], nil];
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
        self.countCell = indexPaths.count;
        [self.tableView endUpdates];
        
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.countCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self.heightArray objectAtIndex:indexPath.row] doubleValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MADetailContactCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"DetailsCell"];
//    [cell setFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)];
    CGRect cellframe = cell.frame;
    MAPeople *model = self.people;
    [cell configurewithDetail:model atIndexPath:indexPath];
    [cell setFrame:cellframe];
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
