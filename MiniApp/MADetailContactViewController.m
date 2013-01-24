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
#define PADDING 20;
@interface MADetailContactViewController ()

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
    MADetailContactCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"DetailCell"];

    NSMutableArray *mutable = [NSMutableArray arrayWithCapacity:5];
    
    UIFont *fontava = avatarcell.role.font;
    CGFloat widthava = avatarcell.role.frame.size.width;
    
    UIFont *font = cell.myContentDetail.font;
    CGFloat width = cell.myContentDetail.frame.size.width;
    
    
       
    
    //calculate size for image and role
    CGSize sizelable = [self.people.role sizeWithFont:fontava constrainedToSize: CGSizeMake(widthava, 1000) lineBreakMode: NSLineBreakByWordWrapping];
    if (sizelable.height < avatarcell.frame.size.height) {
        sizelable.height = avatarcell.frame.size.height;
    }
    mutable = [NSMutableArray arrayWithObject:[NSNumber numberWithDouble:sizelable.height]];

    //calculate size for email
    sizelable = [self.people.userName sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000) lineBreakMode: NSLineBreakByWordWrapping];
    [mutable addObject:[NSNumber numberWithDouble:sizelable.height]];
    
    //calculate size for contact number
    sizelable = [self.people.contact sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000) lineBreakMode: NSLineBreakByWordWrapping];
    [mutable addObject:[NSNumber numberWithDouble:sizelable.height]];
    
    //calculate size for like
    sizelable = [self.people.like sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000) lineBreakMode: NSLineBreakByWordWrapping];
    if (sizelable.height < cell.frame.size.height) {
        sizelable.height = cell.frame.size.height;
    }
    [mutable addObject:[NSNumber numberWithDouble:sizelable.height]];
    
    //calculate size for dislike
    sizelable = [self.people.dislike sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000) lineBreakMode: NSLineBreakByWordWrapping];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self.heightArray objectAtIndex:indexPath.row] doubleValue] + PADDING;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MADetailContactCell *cell;
    switch (indexPath.row) {
        case 0:{
            cell = [tableView dequeueReusableCellWithIdentifier:@"AvatarCell"];
            [cell.avatar setImageWithURL:[NSURL URLWithString:self.people.image] placeholderImage:[UIImage imageNamed:@"icon_profile.png"]];
            cell.role.text = [self.people valueForKey:@"role"];
            
            break;}
        case 1:{
            cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
            cell.imageDetail.image = [UIImage imageNamed:@"icon_email.png"];
            cell.myContentDetail.text = [self.people valueForKey:@"userName"];
//            [cell.contentDetail sizeToFit];
            break;}
        case 2:{
            cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
            cell.imageDetail.image = [UIImage imageNamed:@"icon_sms.png"];
            cell.myContentDetail.text = [self.people valueForKey:@"contact"];
//            [cell.contentDetail sizeToFit];
            break;}
        case 3:{
            cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
            cell.imageDetail.image = [UIImage imageNamed:@"icon_like.png"];
            cell.myContentDetail.text = [self.people valueForKey:@"like"];
//            [cell.contentDetail sizeToFit];
            break;}
        case 4: {
            cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
            cell.imageDetail.image = [UIImage imageNamed:@"icon_dislike.png"];
            cell.myContentDetail.text = [self.people valueForKey:@"dislike"];
//          2  [cell.contentDetail sizeToFit];
            break;
        }
        default:
            break;
    }
    [cell.role sizeToFit];
    [cell.myContentDetail sizeToFit];
   
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
