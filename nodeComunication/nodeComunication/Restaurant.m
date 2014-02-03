//
//  Restaurant.m
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

-(id) initWithName: (NSString *) name andPictureString: (NSString *) pictureString andLongitude: (float) longitude andLatitude: (float) latitude andTables: (NSArray *) tables andId: (NSString *) restaurantId
{
    self = [super init];
    
    if (self)
    {
    
    }
    return self;
}

- (NSDictionary *) restaurantToDictionary
{
    NSDictionary *dictionaryRestaurant = [[NSDictionary alloc] init];
    //TODO
    
    return dictionaryRestaurant;
}
@end
