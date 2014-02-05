//
//  RestaurantRequest.h
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Restaurant.h"

@class RestaurantRequest;
@protocol RestaurantRequestDelegate <NSObject>
@optional
-(void) request: (RestaurantRequest*) request didFinishWithObject:(id) object;
-(void) request: (RestaurantRequest*) request didFailWithError:(NSError*) error;
-(void) recarregarCollectionView;

@end

@interface RestaurantRequest : NSObject<NSURLConnectionDataDelegate>
@property (nonatomic, strong) NSString *restauranteNome;
@property (nonatomic, strong) NSDictionary *dataRestaurant;
@property (nonatomic, strong) NSDictionary *allRestaurants;

-(void) pedirInformacoesRestaurant:(NSString*) nomeRestaurant delegate:(id<RestaurantRequestDelegate >) delegate;

-(void) pullAllRestaurants:(id<RestaurantRequestDelegate >) delegate;
-(void) insertRestaurant: (Restaurant *) restaurant andDelegate: (id<RestaurantRequestDelegate>) delegate;
-(UIImage *)convertToUIImage:(NSString *) encodedString;
-(NSString *) convertToString64bits:(UIImage *) image;


@end
