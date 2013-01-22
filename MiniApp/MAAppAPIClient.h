//
//  MAAppAPIClient.h
//  MiniApp
//
//  Created by Quoc on 1/21/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface MAAppAPIClient : AFHTTPClient

+(id) sharedClient;

@end
