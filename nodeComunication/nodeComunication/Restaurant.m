//
//  Restaurant.m
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

-(id)initWithName:(NSString *)name andPictureString:(NSString *)pictureString andCoordinates:(CGPoint)coordinates andType:(NSString *)type andDetails:(NSString *)details andTables:(NSMutableArray *)tableArrays andId:(NSString *)restaurantId andOwner:(User *)owner andPlaceLocation:(NSString *)location
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.picture = pictureString;
        self.coordinates = coordinates;
        self.type = type;
        self.details = details;
        self.tableArrays = tableArrays;
        self.restaurantId = restaurantId;
        self.owner = owner;
        self.placeLocation = location;
    }
    return self;
}


-(NSDictionary *) transformTableArraysOnNSDictionary
{
    
    NSMutableDictionary * mutableDictionary = [[NSMutableDictionary alloc] init];
    
    for (Table * table in self.tableArrays)
    {
        [mutableDictionary setObject:[table transformToDictionary] forKey:table.tableNumber];
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
