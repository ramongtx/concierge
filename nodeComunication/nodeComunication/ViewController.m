//
//  ViewController.m
//  nodeComunication
//
//  Created by Bruno Vargas Versignassi de Carvalho on 30/01/14.
//  Copyright (c) 2014 Bruno Vargas. All rights reserved.
//

#import "ViewController.h"
#import "Restaurant.h"
#import "RestaurantRequest.h"
#import "User.h"
#import "UserRequest.h"

@interface ViewController () <RestaurantRequestDelegate, UserRequestDelegate>
@property (nonatomic) RestaurantRequest *buscadorRestaurant;
@property (nonatomic) UserRequest *buscadorUser;
@property (nonatomic) User * user;
@property (nonatomic) Restaurant * restaurant;
@property (nonatomic, strong) NSDictionary *todosRestaurantes;
@end

@implementation ViewController

- (void)viewDidLoad
{
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated
{
    self.user = [User alloc];
    
    self.user = [self.user initWithName:@"Bruno" andPhone:@"+55019983355385" andEmail:@"brunoversignassi@gmail.com" hasRestaurant:TRUE andRestaurant:nil];
    self.restaurant = [Restaurant alloc];
    CGPoint point = CGPointMake(123, 321);
    self.restaurant = [self.restaurant initWithName:@"cantina" andPictureString:@"cinema.png" andCoordinates:point andType:@"italiana" andDetails:@"bom ba garai" andId:@"funfou porra" andOwner:@"Bruno" andPlaceLocation:@"Zelandia,123"];
        self.buscadorRestaurant = [[RestaurantRequest alloc] init];
    for (int i = 1; i <= 5; i ++) {
        Table * newTable = [Table alloc];
        CGPoint newPoint = CGPointMake(100, 101);
        newTable = [newTable initWithNumber:[NSNumber numberWithInt:i ] andStatus: TRUE andChairs: [NSNumber numberWithInt:7] andCoorinates: &newPoint andDetails:@"Teste criar mesa"];
        [self.restaurant.tableArrays addObject:newTable];
    }
    self.buscadorUser = [[UserRequest alloc] init];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pushButton:(id)sender {
    [self.buscadorRestaurant pedirTodasInformacoes:self];
    
    
}
- (IBAction)pushButtonSend:(id)sender {

    [self.buscadorRestaurant enviarRestaurante:self.restaurant andDelegate:self];

}
- (IBAction)getUser:(id)sender {
    [self.buscadorUser  pedirTodasInformacoes:self];
}

- (IBAction)sendUser:(id)sender {
    [self.buscadorUser enviarUsuario: self.user andDelegate:self];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
   // [_queue cancelAllOperations];
    
}

#pragma mark - Request operations
-(void) request: (RestaurantRequest*) request didFinishWithObject:(id) object
{

    self.todosRestaurantes = object;
    
    NSLog(@"Objeto de retorno %@", self.todosRestaurantes);
    
    
}

-(void) request: (RestaurantRequest*) request didFailWithError:(NSError*) error
{
    NSLog(@"error with stocks request: %@",error);
}

@end
