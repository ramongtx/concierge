//
//  User.m
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/29/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "User.h"

@implementation User

-(id)init
{
    self = [super init];
    if (self)
    {
        self.isOwner = dontOwn;
    }
    return self;
}

- (id) initWithDictionary:(NSDictionary *)dictionary
{
    
    self = [super init];
    if (self) {
        self.name = [dictionary objectForKey:@"name"];
        self.phone = [dictionary objectForKey:@"phone"];
        self.email = [dictionary objectForKey:@"email"];
        self.isOwner = [[dictionary objectForKey:@"owner"]integerValue];
        self.restaurant = [dictionary objectForKey:@"restaurant"];
    }
    return self;
    
}

@end
