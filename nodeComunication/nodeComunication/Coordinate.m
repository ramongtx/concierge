//
//  Coordinate.m
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 04/02/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import "Coordinate.h"

@implementation Coordinate

-(id) initWithCGPoint:(CGPoint)point
{
    self.latitude = point.y;
    self.longitude = point.x;
    return self;
}

@end
