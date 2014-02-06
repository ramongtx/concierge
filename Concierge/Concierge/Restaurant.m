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


-(id) initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        [self setTableArray:[[NSMutableArray alloc] init]];
        self.name = [dictionary objectForKey:@"name"];
        self.picture = [dictionary objectForKey:@"picture"];
        self.coordinates = [self transformNSDictionaryOnCoordinates:[dictionary objectForKey:@"coordinates"]];
        self.type = [dictionary objectForKey:@"type"];
        self.details = [dictionary objectForKey:@"details"];
        self.restaurantId = [dictionary objectForKey:@"_id"];
        self.owner = [dictionary objectForKey:@"user"];
        self.placeLocation = [dictionary objectForKey:@"location"];

        for (NSNumber * auxKey in [dictionary allKeys])
        {
            Table * newTable = [[Table alloc] initWithDictionary: [dictionary objectForKey:auxKey]];
            [self newTable: newTable];
        }
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

-(CGPoint ) transformNSDictionaryOnCoordinates: (NSString *)dictionary
{
    //nao esta funcionando esta parte estou  dictionary quando eh um restaurante,
    //estou recebendo uma string.................. devo mudar a maneira de inserir no banco, ele esta transformando o dictionary em string
    
    NSLog(@"%@",dictionary);
    
    NSArray *substrings = [dictionary componentsSeparatedByString:@"\""];
    NSString *latitude = substrings[1];
    NSString *longitude = substrings[3];
    

    

    NSLog(@"latitude: %f, and longitude %f", [latitude floatValue], [longitude floatValue]);
    return CGPointMake([latitude floatValue], [longitude floatValue]);
}

- (int) numberOfTables
{
    return [self.tableArray count];
}
@end
