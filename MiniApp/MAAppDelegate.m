//
//  MAAppDelegate.m
//  MiniApp
//
//  Created by Quoc on 1/21/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "MAAppDelegate.h"

@implementation MAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self customizeInterface];
     
    
    UITabBarController *tabController = (UITabBarController *)self.window.rootViewController;
        
    UITabBarItem *tabInfo = tabController.tabBar.items[0];
    UITabBarItem *tabContact = tabController.tabBar.items[1];
//
    [tabInfo setFinishedSelectedImage:[UIImage imageNamed:@"icon_info_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"icon_info.png"]];
    [tabContact setFinishedSelectedImage:[UIImage imageNamed:@"icon_contacts_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"icon_contacts.png"]];

//    NSArray *tabs =  tabController.viewControllers;
//    UIViewController *tab1 = [tabs objectAtIndex:0];
//    tab1.tabBarItem.image = [UIImage imageNamed:@"icon_info.png"];
//    UIViewController *tab2 = [tabs objectAtIndex:1];
//    tab2.tabBarItem.image = [UIImage imageNamed:@"icon_contacts.png"];
//  
//    
//       tabBarInfo.titlePositionAdjustment = UIOffsetMake(0, -5);
    return YES;
   
}

- (void)customizeInterface
{
    UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
//
////    [[UINavigationBar appearance] setBackgroundImage:tabBarBackground];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
////    [[UINavigationBar appearance] setBackground:tabBarBackground];
//    
//    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"selection-tab.png"]];
    // Create resizable images
    
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
