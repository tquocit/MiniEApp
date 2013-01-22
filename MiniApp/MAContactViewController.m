//
//  MAFeedViewController.m
//  MiniApp
//
//  Created by Quoc on 1/21/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "MAContactViewController.h"
#import "MAAppAPIClient.h"
#import "MAPeople.h"
#import "MADetailsContactVC.h"
#import "MAContactViewCell.h"

@interface MAContactViewController ()


@property (strong,nonatomic) NSMutableArray *result;
@property (strong,nonatomic) NSUserDefaults *countClick;
@property (nonatomic,assign) int highestAt;
@property (nonatomic,assign) int highestClick;

@end

@implementation MAContactViewController

//-(NSMutableArray*)result
//{
//    if(!_result)
//        _result = [[NSMutableArray alloc]init];
//    return _result;
//}

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

    self.countClick = [NSUserDefaults standardUserDefaults];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.mongolab.com/api/1/databases/2359media/collections/user?apiKey=50bc7070e4b07d292a90b92b"]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSMutableArray *results = [NSMutableArray array];
        for (id staffDictionary in JSON) {
            MAPeople *people = [[MAPeople alloc] initWithDictionary:staffDictionary];
            [results addObject:people];
        }
        self.result = results;
        self.highestAt = [self getHighestClick];
        [self.tableView reloadData];

    } failure:nil];
    [operation start];
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
    return self.result.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MAContactViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell staff"];
      
    id obj = [self.result objectAtIndex:indexPath.row];

    
    if ([obj isKindOfClass:[MAPeople class]]) {
        MAPeople *p = obj;
        if (self.highestAt == indexPath.row) {
            cell.mostView.image = [UIImage imageNamed:@"icon_star.png"];
        }
        else
        {
            cell.mostView.image = [UIImage imageNamed:@""];
        }
        
        cell.nameContact.text = [NSString stringWithFormat:@"%@", p.name];
        cell.emailContact.text = [NSString stringWithFormat:@"%@", p.userName];
        cell.avatarContact.image = [UIImage imageNamed:@"people.png"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    cell.backgroundColor = ([indexPath row]%2)?[UIColor colorWithRed:0.5 green:0.5 blue:1 alpha:0.6]:[UIColor colorWithRed:0.5 green:0.5 blue:1 alpha:0.3];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexpath = [self.tableView indexPathForCell:sender];
    MAPeople *persons = [self.result objectAtIndex: indexpath.row];
    if([sender isKindOfClass:[UITableViewCell class]])
    {
//        UITableViewCell *currentCell = sender;
//        if ([currentCell.superview isEqual: self.searchDisplayController.searchResultsTableView])
//        {
//            MAPeople *persons = [self.filteredNameArray objectAtIndex: indexpath.row];
//        }
        MADetailsFeedVC *destinationVC = (MADetailsFeedVC *)segue.destinationViewController;
        destinationVC.people = persons;
        int hits = [self.countClick integerForKey:persons.name] + 1;
        if (hits > self.highestClick) {
            self.highestClick = hits;
            self.highestAt = [(UITableView *)[sender superview]  indexPathForSelectedRow].row;
        }
        [self.countClick setInteger:hits forKey:persons.name];
        [self.countClick synchronize];

    }
    
    [self.tableView reloadData];
    
    
}

//count the highest count click
-(int) getHighestClick
{
    int start = 0;
    for(int i = 0; i<self.result.count; i++)
    {
        int clicked = [self.countClick integerForKey:[self.result[i] name]];
        if( clicked > self.highestClick)
        {
            self.highestClick = clicked;
            start = i;
        }

    }
    return start;
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