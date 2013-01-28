//
//  MAWebVC.m
//  MiniApp
//
//  Created by Quoc on 1/21/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "MAWebVC.h"

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

- (void)webViewDidFinishLoad:(UIWebView *)aWebView
{
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.viewWebsite loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString:@"http://2359media.com/"]]];

    self.viewWebsite.scalesPageToFit = YES;
    
}


@end
