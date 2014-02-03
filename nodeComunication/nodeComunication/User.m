//
//  User.m
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import "User.h"

@implementation User
 -(id) init
{
    self = [super init];
    if (self)
    {
    }
    
    return  self;
}



-(id) initWithName:(NSString *)name andPassword:(NSString *)password andImage:(UIImage *)image
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.password = password;
        self.owner =  FALSE;
        self.restauranId = @"blablabla";
        self.image = image;
        

    }
    return self;
}

-(NSDictionary*) userToDictionary
{
    
    NSDictionary * dictionaryUser = [[NSDictionary alloc] initWithObjectsAndKeys:self.name, @"name", self.owner , @"owner", self.feature, @"feature", nil];
    
    
    return dictionaryUser;
}

@end
