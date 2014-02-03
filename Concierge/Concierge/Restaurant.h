//
//  Restaurant.h
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/29/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Table.h"

@class User;

@interface Restaurant : NSObject
@property CGPoint latLong;
@property (strong) NSString* name;
@property (strong) NSString* placeLocation;
@property (strong) NSMutableArray* tableArray;
@property (strong) NSString* type;
@property (strong) NSString* details;
@property (strong) User* owner;

-(void) newTable:(Table*)tb;
-(Table*) tableWithLocation:(CGPoint)location;

@end
