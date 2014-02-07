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

-(id)initWithDictionary:(NSDictionary *) dictionary
{
    self = [super init];
    
    if (self) {
        NSLog(@"%@",dictionary);
//        self.tableNumber = [[dictionary objectForKey:@"number"] integerValue];
//        self.numberOfChairs = [[dictionary objectForKey:@"chairs"] integerValue];
//        self.details = [dictionary objectForKey:@"details"];
//        self.status = [[dictionary objectForKey:@"avaible"]integerValue];
//        self.location = [self transformNSDictionaryOnCoordinates:[dictionary objectForKey:@"coordinates"]];
        
        
    }else{
        NSLog(@"Falha ao instanciar a Table of dictionary :%@", dictionary);
    }
    return self;
}

-(NSDictionary *)transformCoordinatesOnNSDictionary
{
    NSMutableDictionary *coordinates = [[NSMutableDictionary alloc] init];
    [coordinates setObject: [NSNumber numberWithFloat:self.location.x] forKey:@"longitude"];
    [coordinates setObject: [NSNumber numberWithFloat:self.location.y] forKey:@"latitude"];
    return coordinates;
}

-(CGPoint ) transformNSDictionaryOnCoordinates: (NSString *)dictionary
{
    NSLog(@"%@",dictionary);
    
    NSArray *substrings = [dictionary componentsSeparatedByString:@"\""];
    NSString *latitude = substrings[1];
    NSString *longitude = substrings[3];
    
    
    NSLog(@"latitude: %f, and longitude %f", [latitude floatValue], [longitude floatValue]);
    
    return CGPointMake([latitude floatValue], [longitude floatValue]);
    
}
@end
