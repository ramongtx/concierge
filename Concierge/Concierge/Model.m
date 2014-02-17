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
        self.listOfUsers = [[NSMutableArray alloc] init];
        self.restaurantRequest = [[RestaurantRequest alloc] init];
        self.userRequest = [[UserRequest alloc] init];
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
    [self.restaurantRequest insertRestaurant:restaurant andDelegate:self];
}

-(void) addUser:(User *) newUser
{
    [self.userRequest insertUser:newUser andDelegate:self];
}
-(void) pullRestaurantsList
{
    [self.restaurantRequest pullAllRestaurants:self];
    NSLog(@"list of Restaurants %@", self.listOfRestaurants );
}

-(void) pullUsersList
{
    [self.userRequest pullAllUsers:self];
}
-(void) pickRestaurantWithCoordinates:(CGPoint) coordinates
{
    
    [self pullRestaurantsList];
    for (NSDictionary * rest in self.listOfRestaurants) {
       NSDictionary *aux = [rest objectForKey:@"coordinates"];
        if ([[aux objectForKey:@"latitude"] floatValue] == coordinates.y)
        {
            if ([[ aux objectForKey:@"longitude"] floatValue] == coordinates.x) {
                self.selectedRestaurant = [[Restaurant alloc] initWithDictionary:aux];
                break;
            }
        }
    }
}

-(void) pickUserWithName:(NSString *) userName
{
    [self pullUsersList];
    for (NSDictionary * userDictionary in self.listOfUsers)
    {
        if ([[userDictionary objectForKey:@"name"] isEqualToString: userName]) {
            MODEL.user = [[User alloc] initWithDictionary:userDictionary ];
            break;
        }
    }
}

-(UIImage *) getRestaurantImage
{
    UIImage *image;
    image = [RestaurantRequest convertToUIImage: self.selectedRestaurant.picture];
    return  image;
}

#pragma mark - Request operations
-(void) request: (RestaurantRequest*) request didFinishWithObject:(id) object
{
    NSMutableArray *response = [[NSMutableArray alloc] init];
    
    response = object;
    NSLog(@"%@",response[0]);
    NSDictionary *teste = response[0];
    if ([teste objectForKey:@"password"] == nil) {
        //_response eh um array de restaurantes!
        [self convertResponseToRestaurant: response];
        NSLog(@"Objeto de retorno como restaurants %@", response);

    }
    else     if ([teste objectForKey:@"password"] != nil) {
    
        self.listOfUsers = response;
        NSLog(@"Objeto de retorno como usuarios %@", response);
    }
}

-(void) request: (RestaurantRequest*) request didFailWithError:(NSError*) error
{
    NSLog(@"error with stocks request: %@",error);
}

-(void) convertResponseToRestaurant: (NSMutableArray *) arrayJson
{
    //este metodo converte o array de restaurantes em Json em um array de restaurantes no formato restaurantes, inserindo no array de restaurantes
    for (NSDictionary * restaurantJson in arrayJson) {
        Restaurant * novo = [[Restaurant alloc] initWithDictionary:restaurantJson];
        [self insertRestaurants:novo]; //Todo verificar se o restaurante nao existe na hora de inseri-lo novamente.
    }
}

#pragma mark - Support
-(void) insertRestaurants: (Restaurant *) newRestaurant
{
    int inserido = 0;
    for (Restaurant * auxRestaurant in self.listOfRestaurants )
    {
        if ([auxRestaurant.name isEqualToString: newRestaurant.name]) {
            NSLog(@"restaurant ja cadastrado-> %@", newRestaurant.name);
            inserido = 1;
            break;
        }
    
    }
    if (inserido == 0) {
        [self.listOfRestaurants addObject:newRestaurant];
        NSLog(@"restaurant %@, inserido com sucesso", newRestaurant.name);
    }
    
    
}
@end
