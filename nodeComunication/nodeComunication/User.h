//
//  User.h
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Restaurant.h"

@interface User : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *password; //ver como posso fazer isso de maneira segura.
@property (nonatomic) int owner;
@property (nonatomic, strong) NSString *restauranId;

-(id)initWithName: (NSString *) name andPassword: (NSString *) password hasRestaurant: (int) boolean;

//-(NSDictionary *) userToDictionary;
@end
