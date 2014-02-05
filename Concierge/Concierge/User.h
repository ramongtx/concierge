//
//  User.h
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/29/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Restaurant.h"
typedef enum {
    dontOwn=0,
    own=1
    
}Owner;

@interface User : NSObject
@property (strong) NSString* name;
@property (strong) NSString* phone;
@property (strong) NSString* email;
@property Owner isOwner;
@property (strong) Restaurant* restaurant;
@end
