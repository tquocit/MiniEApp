//
//  MADetailsFeedVC.m
//  MiniApp
//
//  Created by Quoc on 1/21/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "MADetailsContactVC.h"
#import "MADetailsViewCell.h"
#define PADDING 20
@interface MADetailsFeedVC ()

@end

@implementation MADetailsFeedVC

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
    MADetailsViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Detail People"];
    NSMutableArray *mutable = [NSMutableArray array];
    
    CGFloat width = cell.contentLabel.frame.size.width;
    UIFont *font = cell.contentLabel.font;
    
    CGSize sizelable = [self.people.name sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000) lineBreakMode: NSLineBreakByWordWrapping];
    mutable = [NSMutableArray arrayWithObject:[NSNumber numberWithDouble:sizelable.height]];
    
    sizelable = [self.people.userName sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000) lineBreakMode: NSLineBreakByWordWrapping];
    [mutable addObject:[NSNumber numberWithDouble:sizelable.height]];

    sizelable = [self.people.role sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000) lineBreakMode: NSLineBreakByWordWrapping];
    [mutable addObject:[NSNumber numberWithDouble:sizelable.height]];

    sizelable = [self.people.like sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000) lineBreakMode: NSLineBreakByWordWrapping];
    [mutable addObject:[NSNumber numberWithDouble:sizelable.height]];
    
    sizelable = [self.people.dislike sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000) lineBreakMode: NSLineBreakByWordWrapping];
    [mutable addObject:[NSNumber numberWithDouble:sizelable.height]];
    
    sizelable = [self.people.timeStamp sizeWithFont:font constrainedToSize: CGSizeMake(width, 1000) lineBreakMode: NSLineBreakByWordWrapping];
    [mutable addObject:[NSNumber numberWithDouble:sizelable.height]];
    
    
    
    self.heightArray = [mutable copy];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.heightArray objectAtIndex:indexPath.row] doubleValue] + PADDING;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
//    return 6;
    return [[self.people getTitle] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Detail People";
    MADetailsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    cell.titleLabel.text = [[self.people getTitle][indexPath.row] capitalizedString];
    cell.contentLabel.text = [self.people valueForKey:[self.people getTitle][indexPath.row]];
    cell.contentLabel.numberOfLines = 0;
    [cell.contentLabel sizeToFit];
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
