//
//  Restaurant.h
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Table.h"
#import "User.h"
@class User;

@interface Restaurant : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *picture; //endereco que deve ser chamado para baixar a foto deste restaurante
@property (nonatomic) CGPoint  coordinates;
@property (nonatomic, strong) NSString *placeLocation;
@property (nonatomic, strong) NSMutableArray *tableArrays;
@property (nonatomic) NSString *type;
@property (nonatomic) NSString *details;
@property (nonatomic, strong) NSString *restaurantId;
@property (nonatomic) User* owner;

//tableArrays devem ser inseridos um a um para evitar problemas com restaurantes sem mesa
-(id) initWithName: (NSString *) name
  andPictureString: (NSString *) pictureString
       andCoordinates: (CGPoint) coordinates
           andType: (NSString *) type
        andDetails: (NSString *) details
             andId: (NSString *) restaurantId
              andOwner: (User *) owner
  andPlaceLocation: (NSString *) location;


-(NSDictionary *) transformTableArraysOnNSDictionary;
-(NSDictionary *) transformCoordinatesOnNSDictionary;
 @end
