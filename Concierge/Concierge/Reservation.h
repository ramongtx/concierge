//
//  Reservation.h
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/29/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Restaurant.h"

@interface Reservation : NSObject
@property (strong) User* client;
@property (strong) NSDate* date;
@property (strong) Table* table;
@property (strong) Restaurant* restaurant;
@property NSInteger numberOfPeople;
@property NSTimeInterval duration;
@property (strong) NSString* details;
@end
