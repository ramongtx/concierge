//
//  Table.h
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Table : NSObject
@property (nonatomic) NSNumber *tableNumber;
@property (nonatomic) NSNumber *numberOfChairs;
@property (nonatomic) Boolean *status;
@property (nonatomic) CGPoint  coordinates;
@property (nonatomic) NSString * details;


-(id) initWithNumber: (NSNumber *) tableNumber
            andStatus: (Boolean *) status
           andChairs: (NSNumber *) numberOfChairs
         andCoorinates: (CGPoint ) coordinates
          andDetails: (NSString *) details;


-(NSDictionary *) transformToDictionary;
@end
