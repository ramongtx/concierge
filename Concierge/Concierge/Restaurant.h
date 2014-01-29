//
//  Restaurant.h
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/29/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Table.h"

@interface Restaurant : NSObject
@property CGPoint location;
@property (strong) NSString* name;
@property (strong) NSMutableArray* tableArray;
@property (strong) NSString* type;
@property (strong) NSString* details;
@end
