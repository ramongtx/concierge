//
//  Coordinate.h
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 04/02/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coordinate : NSObject
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;


-(id) initWithCGPoint: (CGPoint) point;

@end
