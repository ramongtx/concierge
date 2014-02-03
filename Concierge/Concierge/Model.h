//
//  Shared.h
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/29/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reservation.h"

#define MODEL [Model shared]
#define RESTAURANT [MODEL selectedRestaurant]
#define TABLE [MODEL selectedTable]
#define LIST [MODEL listOfRestaurants]

@interface Model : NSObject

@property (strong) NSMutableArray* listOfRestaurants;
@property (strong) Restaurant* selectedRestaurant;
@property (strong) Table* selectedTable;

+(Model*)shared;
+(float)distanceBetween:(CGPoint)p1 and:(CGPoint)p2;
-(void)addRestaurantToList:(Restaurant*)restaurant;
@end
