//
//  Shared.m
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/29/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "Model.h"
@interface Model()
@property (nonatomic, strong) RestaurantRequest *restaurantRequest;
@property (nonatomic, strong) UserRequest *userRequest;
@property (nonatomic, strong) UIImage *image;
@end

@implementation Model
static Model* sharedModel = nil;
-(id)init
{
    self = [super init];
    if (self) {
        self.selectedRestaurant = [[Restaurant alloc] init];
        self.listOfRestaurants = [[NSMutableArray alloc] init];
        self.selectedTable = NULL;
    }
    return self;
}

+(Model*)shared
{
    if(!sharedModel) sharedModel = [[Model alloc] init];
    return sharedModel;
}

+(float)distanceBetween:(CGPoint)p1 and:(CGPoint)p2
{
    return sqrt(((p1.x-p2.x)*(p1.x-p2.x))+((p1.y-p2.y)*(p1.y-p2.y)));
}

-(void)addRestaurantToList:(Restaurant*)restaurant
{
    [[self listOfRestaurants] addObject:restaurant];
}

-(void) addUser:(User *) newUser
{
    //TODO
}
-(void) pullRestaurantsList
{
    //TODO
}

-(void) pullUsersList
{
    //TODO
}
-(void) pickRestaurantWithCoordinates:(CGPoint) coordinates
{
    //TODO
}

-(void) pickUserWithName:(NSString *) userName
{
    //TODO
}

-(UIImage *) getRestaurantImage
{
    UIImage *image;
    //TODO
    return  image;
}

#pragma mark - Request operations
-(void) request: (RestaurantRequest*) request didFinishWithObject:(id) object
{
    NSMutableArray *response = [[NSMutableArray alloc] init];
    
    response = object;
    NSLog(@"%@",response[0]);
    NSDictionary *teste = response[0];
    
    
    if ([teste objectForKey:@"picture"] != nil) {
        //_response eh um array de restaurantes!
        UIImage *uimageReceived = [self.restaurantRequest convertToUIImage: [teste objectForKey:@"picture"]];
        self.image = uimageReceived;
    }
    else if ([teste objectForKey:@"password"]){
        // _response eh um array de usuarios
    }
    
    NSLog(@"Objeto de retorno %@", response);
    
    
}

-(void) request: (RestaurantRequest*) request didFailWithError:(NSError*) error
{
    NSLog(@"error with stocks request: %@",error);
}

@end
