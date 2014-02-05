//
//  Table.h
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/29/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    occupieble=0,
    occupied=1
}STATUS;

@interface Table : NSObject
@property CGPoint location;
@property NSInteger tableNumber;
@property NSInteger numberOfChairs;
@property (strong) NSString* details;
@property (nonatomic) STATUS status;

-(id)initWithDictionary:(NSDictionary *) dictionary;
-(NSDictionary *) transformToDictionary;

@end
