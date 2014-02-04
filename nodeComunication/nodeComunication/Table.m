//
//  Table.m
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import "Table.h"

@implementation Table


-(id) initWithNumer:(NSInteger *)tableNumber andStatus:(Boolean *)status andChairs:(NSInteger *)numberOfChairs andCoorinates:(CGPoint *)coordinates andDetails:(NSString *)details
{
    self = [super init];
    if (self)
    {
        self.tableNumber = tableNumber;
        self.status = status;
        self.numberOfChairs = numberOfChairs;
        self.coordinates= coordinates;
        self.details = details;
    }
    return self;
}

@end
