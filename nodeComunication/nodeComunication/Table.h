//
//  Table.h
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Table : NSObject
@property (nonatomic, strong)NSString *number;
@property (nonatomic) Boolean *status;
@property (nonatomic) NSInteger *chairs;
@property (nonatomic) Boolean *connected;
@property (nonatomic, strong) NSMutableArray *tableConnections;
@property (nonatomic) float longitude;
@property (nonatomic) float latitude;


-(id) initWithNumer: (NSString *) number
          andStatus: (Boolean *) status
          andChairs: (NSInteger *) chairs
        andLatitude: (float) latitude
       andLongitude: (float) longitude;
@end
