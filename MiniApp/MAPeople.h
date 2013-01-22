//
//  MAPeople.h
//  MiniApp
//
//  Created by Quoc on 1/21/13.
//  Copyright (c) 2013 Quoc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAPeople : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *role;
@property (nonatomic,strong) NSString *like;
@property (nonatomic,strong) NSString *dislike;
@property (nonatomic,strong) NSString *timeStamp;

- (id)initWithDictionary:(NSDictionary *)personDictionary;

- (NSArray *) getTitle;
@end
