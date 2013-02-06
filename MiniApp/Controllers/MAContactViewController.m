//
//  MAFeedViewController.m
//  MiniApp
//
//  Created by Quoc on 1/21/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "MADetailContactViewController.h"

//#import "AFNetworking.h"

@interface MAContactViewController () <MAStaffCellDelegate>


@property (strong,nonatomic) NSMutableArray *result;
@property (nonatomic, strong) NSUserDefaults *countClick;
@property (nonatomic, assign) NSString *mostVisitedAtName;
@property (nonatomic, assign) int highestClick;

@end

@implementation MAContactViewController

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
    self.mostVisitedAtName = [self getNameOfHighestVisited];

    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    [refresh addTarget:self action:@selector(refreshView:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
    
}

-(void)refreshView:(UIRefreshControl *)refresh {
    
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Refreshing data..."];
     NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    NSString *lastUpdated = [NSString stringWithFormat:@"Last updated on %@",[formatter stringFromDate:[NSDate date]]];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated];
    [self setTitle:@"2359 Media"];
    
    [[MAApiClient sharedClient] getPath:kStaffAPI parameters:nil
                               success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                   NSMutableArray *results = [NSMutableArray arrayWithCapacity:[responseObject count]];
                                   for (id obj in responseObject) {
                                       MAPeople *people = [[MAPeople alloc] initWithDictionary:obj];
                                       [results addObject:people];
                                   }
                                   self.result = results;
                                   [refresh endRefreshing];
                                   [self.tableView reloadData];
                               }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                   
                               }];
    
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
    static NSString *CellIdentifier = @"Cell staff";
    MAContactViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if(!cell)
    {
        cell = [[MAContactViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    MAPeople *model = [self.result objectAtIndex:indexPath.row];
    cell.delegate = self;
    [cell cofigurewithModel:model atIndex:indexPath];
    
    
    return cell;

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexpath = [self.tableView indexPathForCell:sender];
    MAPeople *persons = [self.result objectAtIndex: indexpath.row];
    if([sender isKindOfClass:[UITableViewCell class]])
    {
        MADetailContactViewController *destinationVC = (MADetailContactViewController *)segue.destinationViewController;
        destinationVC.people = persons;
//        [self countClickOf:persons.name];
    
    }
    
    [self.tableView reloadData];    
}

//count click
- (void)countClickOf:(NSString*)personName
{
    self.countClick = [NSUserDefaults standardUserDefaults];
    int hit = [self.countClick integerForKey: personName] + 1;
    if(hit > self.highestClick)
    {
        self.highestClick = hit;
        self.mostVisitedAtName = personName;
    }
    [self.countClick setInteger:hit forKey:personName];
    [self.countClick synchronize];
    
}

//find people with highest visited
-(NSString *)getNameOfHighestVisited
{
    int star = 0;
    for (int i = 0; i < self.result.count; i++) {
        int click = [self.countClick integerForKey:[self.result[i] name]];
        if( click > self.highestClick)
        {
            self.highestClick = click;
            star = i;
        }
    }
    if(star)
    {
        return nil;
    }
    else return [self.result[star] name];
}



-(NSString *)markStarForHighest
{
    return self.mostVisitedAtName;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end
