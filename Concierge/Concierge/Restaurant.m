//
//  Restaurant.m
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/29/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

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

@end
