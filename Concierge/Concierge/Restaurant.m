//
//  Restaurant.m
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/29/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

-(id)init
{
    self = [super init];
    if(self) {
        [self setTableArray:[[NSMutableArray alloc] init]];
    }
    return self;
}

-(void) newTable:(Table*)tb {
    [self.tableArray addObject:tb];
}

-(Table*) tableWithLocation:(CGPoint)location
{
    for (Table* tb in [self tableArray]) {
        if ((tb.location.x == location.x) && (tb.location.y == location.y)) return tb;
    }
    return NULL;
}

-(NSDictionary *) transformTableArraysOnNSDictionary
{
    
    NSMutableDictionary * mutableDictionary = [[NSMutableDictionary alloc] init];
    
    for (Table * table in self.tableArray)
    {
        [mutableDictionary setObject:[table transformToDictionary] forKey:[NSNumber numberWithInt:table.tableNumber]];
    }
    
    return mutableDictionary;
}

-(NSDictionary *)transformCoordinatesOnNSDictionary
{
    NSMutableDictionary *coordinates = [[NSMutableDictionary alloc] init];
    [coordinates setObject: [NSNumber numberWithFloat:self.coordinates.x] forKey:@"longitude"];
    [coordinates setObject: [NSNumber numberWithFloat:self.coordinates.y] forKey:@"latitude"];
    return coordinates;
}
@end
