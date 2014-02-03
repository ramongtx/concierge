//
//  Shared.m
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/29/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "Model.h"

@implementation Model
static Model* sharedModel = nil;

-(id)init
{
    self = [super init];
    if (self) {
        self.selectedRestaurant = [[Restaurant alloc] init];
        self.listOfRestaurants = [[NSMutableArray alloc] init];
        self.selectedTable = NULL;
    }
    return self;
}

+(Model*)shared
{
    if(!sharedModel) sharedModel = [[Model alloc] init];
    return sharedModel;
}

+(float)distanceBetween:(CGPoint)p1 and:(CGPoint)p2
{
    return sqrt(((p1.x-p2.x)*(p1.x-p2.x))+((p1.y-p2.y)*(p1.y-p2.y)));
}

@end
