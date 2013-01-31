//
//  MACustomNavigationViewController.m
//  MiniApp
//
//  Created by Quoc on 1/31/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "MACustomNavigationViewController.h"

@interface MACustomNavigationViewController ()

@end

@implementation MACustomNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.customNavigationBar setBackgroundImage:[UIImage imageNamed:@"navi"] forBarMetrics:0];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
