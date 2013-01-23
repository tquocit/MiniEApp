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
    p.contact = [personDictionary objectForKey:@"contact"];
    p.like = [personDictionary objectForKey:@"like"];
    p.dislike = [personDictionary objectForKey:@"dislike"];
    p.timeStamp = [personDictionary objectForKey:@"timeStamp"];
    p.image = [personDictionary objectForKey:@"image"];
    p.gender = [personDictionary objectForKey:@"gender"];
    
    return p;
}

@end
