//
//  MACustomTabbarViewController.m
//  MiniApp
//
//  Created by Quoc on 1/24/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "MACustomTabbarViewController.h"

@interface MACustomTabbarViewController ()

@end

@implementation MACustomTabbarViewController

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
    [self addMidButton];
	// Do any additional setup after loading the view.
}

- (void)addMidButton
{
    UIImage *image = [UIImage imageNamed:@"middle_button.png"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    CGPoint center = self.tabBar.center;
    button.frame = CGRectMake(center.x - image.size.width/2, center.y - image.size.height/2, image.size.width, image.size.height);
    button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [self.view addSubview:button];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
