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

@synthesize customTabBarView;


- (void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self hideExistingTabBar];
    
    NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomTabbar" owner:self options:nil];
    
    self.customTabBarView = [nibObjects objectAtIndex:0];
//
    CGRect customTabBarFrame = self.customTabBarView.frame;
    customTabBarFrame.origin.y = self.view.frame.size.height - customTabBarFrame.size.height;
    
    [self.customTabBarView setFrame:customTabBarFrame];
//
   self.customTabBarView.delegate = self;
    self.customTabBarView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
//
    [self.view addSubview:self.customTabBarView];
}

-(void) hideExistingTabBar
{
    
	for(UIView *view in self.view.subviews)
	{
		if([view isKindOfClass:[UITabBar class]])
		{
			view.hidden = YES;
			break;
		}
	}
}

-(void)tabWasSelected:(NSInteger)index {
    
    UIViewController *viewController = [self.viewControllers objectAtIndex:index];
    UIView * viewpresent = self.selectedViewController.view;
    UIView * viewnext = viewController.view;
    
    if (viewpresent != viewnext) {
        
        NSUInteger atIndex = [self.viewControllers indexOfObject:self.selectedViewController];
        [UIView transitionFromView:viewpresent
                            toView:viewnext
                          duration:0.5
                           options: index > atIndex ? UIViewAnimationOptionTransitionFlipFromTop : UIViewAnimationOptionTransitionFlipFromRight
                        completion:^(BOOL finished) {
                            if (finished) {
                                self.selectedIndex = index;
                            }
                        }];
    }
}



@end
