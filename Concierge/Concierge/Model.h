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

@interface Model : NSObject

@property (strong) Restaurant* selectedRestaurant;
@property (strong) Table* selectedTable;

+(Model*)shared;
+(float)distanceBetween:(CGPoint)p1 and:(CGPoint)p2;

@end
