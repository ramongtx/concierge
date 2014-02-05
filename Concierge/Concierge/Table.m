//
//  Table.m
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/29/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "Table.h"

@implementation Table



-(NSDictionary *) transformToDictionary
{
    NSMutableDictionary * mutableDictionary = [[NSMutableDictionary alloc] init];
    
    [mutableDictionary setObject:[NSNumber numberWithInteger: self.tableNumber] forKey:@"number"];
    [mutableDictionary setObject:[NSNumber numberWithInt:(self.status)] forKey:@"avaible"];
    [mutableDictionary setObject:[NSNumber numberWithInteger: self.numberOfChairs] forKey:@"chairs"];
    [mutableDictionary setObject:self.details forKey:@"details"];
    [mutableDictionary setObject:[self transformCoordinatesOnNSDictionary] forKey:@"coordinate"];
    return  mutableDictionary;
}

-(NSDictionary *)transformCoordinatesOnNSDictionary
{
    NSMutableDictionary *coordinates = [[NSMutableDictionary alloc] init];
    [coordinates setObject: [NSNumber numberWithFloat:self.location.x] forKey:@"longitude"];
    [coordinates setObject: [NSNumber numberWithFloat:self.location.y] forKey:@"latitude"];
    return coordinates;
}
@end
