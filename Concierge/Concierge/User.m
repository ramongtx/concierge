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
        self.isOwner = NO;
    }
    return self;
}

@end
