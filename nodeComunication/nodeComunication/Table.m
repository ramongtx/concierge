//
//  Table.m
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import "Table.h"

@implementation Table


-(id) initWithNumber:(NSNumber*)tableNumber andStatus:(Boolean *)status andChairs:(NSNumber *)numberOfChairs andCoorinates:(CGPoint)coordinates andDetails:(NSString *)details
{
    self = [super init];
    if (self)
    {
        self.tableNumber = tableNumber;
        self.status = status;
        self.numberOfChairs = numberOfChairs;
        self.coordinates= coordinates;
        self.details = details;
    }
    return self;
}

-(NSDictionary *) transformToDictionary
{
    NSMutableDictionary * mutableDictionary = [[NSMutableDictionary alloc] init];
    
    [mutableDictionary setObject:self.tableNumber forKey:@"number"];
   // [mutableDictionary setObject:[NSNumber numberWithUnsignedChar:(self.status)] forKey:@"avaible"];
    [mutableDictionary setObject:self.numberOfChairs forKey:@"chairs"];
    [mutableDictionary setObject:self.details forKey:@"details"];
    [mutableDictionary setObject:[self transformCoordinatesOnNSDictionary] forKey:@"coordinate"];
    return  mutableDictionary;
}

-(NSDictionary *)transformCoordinatesOnNSDictionary
{
    NSMutableDictionary *coordinates = [[NSMutableDictionary alloc] init];
    [coordinates setObject: [NSNumber numberWithFloat:self.coordinates.x] forKey:@"longitude"];
    [coordinates setObject: [NSNumber numberWithFloat:self.coordinates.y] forKey:@"latitude"];
    return coordinates;
}
@end
