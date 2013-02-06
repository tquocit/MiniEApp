//
//  MAApiClient.h
//  MiniApp
//
//  Created by Quoc on 2/6/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "AFHTTPClient.h"

@interface MAApiClient : AFHTTPClient

+ (id)sharedClient;

@end
