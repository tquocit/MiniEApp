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
//
//    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:27.0/255.0 green:28.0/255.0 blue:32.0/255.0 alpha:1.0]];
//    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor,[UIFont fontWithName:@"Helvetica Neue Bold" size:20.0], UITextAttributeFont, nil]];
//    
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];    return YES;
   
}

- (void)customizeInterface
{
//    UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];

    
//    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
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
