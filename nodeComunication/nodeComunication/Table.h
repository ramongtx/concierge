//
//  Table.h
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Table : NSObject
@property (nonatomic) NSInteger *tableNumber;
@property (nonatomic) NSInteger *numberOfChairs;
@property (nonatomic) Boolean *status;
@property (nonatomic) CGPoint * coordinates;
@property (nonatomic) NSString * details;


-(id) initWithNumer: (NSInteger *) tableNumber
            andStatus: (Boolean *) status
          andChairs: (NSInteger *) numberOfChairs
        andCoorinates: (CGPoint *) coordinates
          andDetails: (NSString *) details;

@end
