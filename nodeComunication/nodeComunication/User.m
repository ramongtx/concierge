//
//  User.m
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import "User.h"

@implementation User
-(id)initWithName:(NSString *)name andPhone:(NSString *)phone andEmail:(NSString *)email hasRestaurant:(BOOL)isOwner andRestaurant:(Restaurant *)restaurant
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.phone = phone;
        self.email = email;
        self.isOwner =  isOwner;
        self.restaurant = restaurant;
        
    }
    return self;

}

//-(NSDictionary*) userToDictionary
//{
//    
//    NSDictionary * dictionaryUser = [[NSDictionary alloc] initWithObjectsAndKeys:self.name, @"name", self.owner , @"owner", nil];
//    NSLog(@"dictinary user? %@", dictionaryUser);
//    
//    return dictionaryUser;
//}

@end
