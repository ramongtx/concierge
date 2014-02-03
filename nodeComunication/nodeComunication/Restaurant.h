//
//  Restaurant.h
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Table.h"

@interface Restaurant : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *picture; //endereco que deve ser chamado para baixar a foto deste restaurante
@property (nonatomic) float longitude;
@property (nonatomic) float latitude;
@property (nonatomic, strong) NSArray *tables;
@property (nonatomic, strong) NSString *restaurantId;

-(id) initWithName: (NSString *) name
  andPictureString: (NSString *) pictureString
      andLongitude: (float) longitude
       andLatitude: (float) latitude
         andTables: (NSArray *) tables
             andId: (NSString *) restaurantId;

-(NSDictionary*) restaurantToDictionary;
 @end
