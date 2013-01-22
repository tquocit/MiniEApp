//
//  MAWebVC.m
//  MiniApp
//
//  Created by Quoc on 1/21/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "MAWebVC.h"
#import "TSMiniWebBrowser.h"

@interface MAWebVC ()

@end

@implementation MAWebVC

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
    [self.viewWebsite loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString:@"http://2359media.com/"]]];

    TSMiniWebBrowser *webBrowser = [[TSMiniWebBrowser alloc] initWithUrl:[NSURL URLWithString:@"http://2359media.com"]];
//    webBrowser.showURLStringOnActionSheetTitle = YES;
//    webBrowser.showPageTitleOnTitleBar = YES;
//    webBrowser.showActionButton = YES;
//    webBrowser.showReloadButton = YES;
//    webBrowser.mode = TSMiniWebBrowserModeNavigation;
//
//    webBrowser.barStyle = UIBarStyleBlack;
    
//    if (webBrowser.mode == TSMiniWebBrowserModeModal) {
//        webBrowser.modalDismissButtonTitle = @"Home";
        [self presentModalViewController:webBrowser animated:YES];
//    } else if(webBrowser.mode == TSMiniWebBrowserModeNavigation) {
//        [self.navigationController pushViewController:webBrowser animated:YES];
//    }
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
