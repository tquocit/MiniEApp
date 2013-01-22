//
//  MAAppAPIClient.m
//  MiniApp
//
//  Created by Quoc on 1/21/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "MAAppAPIClient.h"
static NSString * const kAppBaseURL = @"https://api.mongolab.com";
@implementation MAAppAPIClient

+ (MAAppAPIClient *)sharedClient {
    static MAAppAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[MAAppAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kAppBaseURL]];
    });
    
    return _sharedClient;
}

@end
