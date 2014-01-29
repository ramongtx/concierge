//
//  Table.h
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/29/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Table : NSObject
@property CGPoint location;
@property NSInteger tableNumber;
@property NSInteger numberOfChairs;
@property (strong) NSString* details;
@end
