//
//  MAPeople.m
//  MiniApp
//
//  Created by Quoc on 1/21/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import "MAPeople.h"

@implementation MAPeople

-(id) initWithDictionary:(NSDictionary *)personDictionary
{
    MAPeople *p = [[MAPeople alloc]init];
    p.name = [personDictionary objectForKey:@"name"];
    p.userName = [personDictionary objectForKey:@"userName"];
    p.role = [personDictionary objectForKey:@"role"];
    p.like = [personDictionary objectForKey:@"like"];
    p.dislike = [personDictionary objectForKey:@"dislike"];
    p.timeStamp = [personDictionary objectForKey:@"timeStamp"];
    
    
    return p;
}
- (NSArray *) getTitle
{
    return [NSArray arrayWithObjects:@"name", @"userName",@"role",@"like",@"dislike",@"timeStamp", nil];
}


@end
