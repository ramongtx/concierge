//
//  Table.m
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import "Table.h"

@implementation Table


-(id) initWithNumer: (NSString *) number andStatus: (Boolean *) status andChairs: (NSInteger *) chairs andLatitude: (float) latitude andLongitude: (float) longitude
{
    self = [super init];
    if (self)
    {
        self.number = number;
        self.status = status;
        self.chairs = chairs;
        self.longitude = longitude;
        self.latitude = latitude;
    }
    
    return self;
}
@end
