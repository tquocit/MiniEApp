//
//  MAApiClient.m
//  MiniApp
//
//  Created by Quoc on 2/6/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "MAApiClient.h"

@implementation MAApiClient

+ (id)sharedClient
{
    static MAApiClient *__sharedInstance;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        __sharedInstance = [[MAApiClient alloc] initWithBaseURL:
                            [NSURL URLWithString:kBaseURL]];
    }   );
    return __sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        //custom settings
        [self setDefaultHeader:@"x-api-token" value:kStaffAPI];
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    
    return self;
}
@end
