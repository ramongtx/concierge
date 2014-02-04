//
//  User.h
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Restaurant.h"
@class Restaurant;

@interface User : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *email;
@property (nonatomic) BOOL isOwner;
@property (nonatomic) Restaurant* restaurant;

//if isOwner is false, the attribute restaurant must be nil;
-(id)initWithName: (NSString *) name andPhone: (NSString *) phone andEmail: (NSString *) email hasRestaurant: (BOOL) isOwner andRestaurant:(Restaurant*) restaurant;

//-(NSDictionary *) userToDictionary;
@end
