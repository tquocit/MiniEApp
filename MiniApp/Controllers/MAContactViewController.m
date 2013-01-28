//
//  MAFeedViewController.m
//  MiniApp
//
//  Created by Quoc on 1/21/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "MAContactViewController.h"
#import "MAPeople.h"
#import "MAContactViewCell.h"
#import "MADetailContactViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AFNetworking.h"
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
//    [self loaddata];
    
    
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    [refresh addTarget:self action:@selector(refreshView:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
    
}

-(void)refreshView:(UIRefreshControl *)refresh {
    
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Refreshing data..."];
    // custom refresh logic would be placed here...
    self.countClick = [NSUserDefaults standardUserDefaults];        
     NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    NSString *lastUpdated = [NSString stringWithFormat:@"Last updated on %@",[formatter stringFromDate:[NSDate date]]];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated];
    [self setTitle:@"2359 MEDIA"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://dl.dropbox.com/u/11295402/MiniEval/data.json"]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSMutableArray *results = [NSMutableArray array];
        for (id staffDictionary in JSON) {
            MAPeople *people = [[MAPeople alloc] initWithDictionary:staffDictionary];
            [results addObject:people];
        }
        self.result = results;
        self.highestAt = [self getHighestClick];
        [self.tableView reloadData];
        [refresh endRefreshing];
                
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){}];
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
        if ([p.gender isEqual:@"male"]) {
            [cell.nameContact setTextColor:[UIColor orangeColor]];
        }
        else
        {
            [cell.nameContact setTextColor:[UIColor blueColor]];
        }
        cell.emailContact.text = [NSString stringWithFormat:@"%@", p.userName];
        [cell.avatarContact setImageWithURL:[NSURL URLWithString:p.image] placeholderImage:[UIImage imageNamed:@"icon_profile.png"]];
        cell.avatarContact.layer.cornerRadius = 20.0;
        cell.avatarContact.clipsToBounds = YES;

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
        MADetailContactViewController *destinationVC = (MADetailContactViewController *)segue.destinationViewController;
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
