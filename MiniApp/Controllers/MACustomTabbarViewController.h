//
//  MACustomTabbarViewController.h
//  MiniApp
//
//  Created by Quoc on 1/24/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MACustomTabbarView.h"
@interface MACustomTabbarViewController : UITabBarController <TabBarDelegate>

@property (nonatomic, retain) IBOutlet MACustomTabbarView *customTabBarView;

-(void) hideExistingTabBar;

@end
