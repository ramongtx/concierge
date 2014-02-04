//
//  Restaurant.m
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

-(id) initWithName: (NSString *) name andPictureString: (NSString *) pictureString andLongitude: (NSString *) longitude andLatitude: (NSString *) latitude andTables: (NSArray *) tables andId: (NSString *) restaurantId
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.picture = pictureString;
        self.longitude = longitude;
        self.latitude = latitude;
        self.tables = [[NSArray alloc] initWithObjects:@"bla", nil];
        self.restaurantId = restaurantId;
    
    }
    return self;
}

@end
