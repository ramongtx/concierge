//
//  Shared.h
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/29/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reservation.h"
#import "RestaurantRequest.h"
#import "UserRequest.h"

#define MODEL [Model shared]
#define RESTAURANT [MODEL selectedRestaurant]
#define TABLE [MODEL selectedTable]
#define LIST [MODEL listOfRestaurants]
#define USER [MODEL user]
#define RESERVATION [MODEL reservation]

@interface Model : NSObject <RestaurantRequestDelegate,UserRequestDelegate>

@property (strong) NSMutableArray* listOfRestaurants;
@property (strong) Restaurant* selectedRestaurant;
@property (strong) Table* selectedTable;
@property (strong) User* user;
@property (strong) Reservation* reservation;

+(Model*)shared;
+(float)distanceBetween:(CGPoint)p1 and:(CGPoint)p2;
-(void) addRestaurantToList:(Restaurant*)restaurant;
-(void) addUser:(User *) newUser;
-(void) pullRestaurantsList;
-(void) pullUsersList;
-(void) pickRestaurantWithCoordinates:(CGPoint) coordinates;
-(void) pickUserWithName:(NSString *) userName;
-(UIImage *) getRestaurantImage;
@end
