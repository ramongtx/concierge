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
    self.user = [self.user initWithName:@"Bruno" andPassword:@"123" andImage:self.imageSended.image];
    self.buscadorRestaurant = [[RestaurantRequest alloc] init];
    self.buscadorUser = [[UserRequest alloc] init];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pushButton:(id)sender {
    NSLog(@"apertei o botao");
    
    [self.buscadorRestaurant pedirTodasInformacoes:self];
    
    
}
- (IBAction)pushButtonSend:(id)sender {

    NSLog(@"objeto enviado %@", self.todosRestaurantes);
    [self.buscadorRestaurant enviarRestaurante:self.todosRestaurantes andDelegate:self];

}
- (IBAction)getUser:(id)sender {
    [self.buscadorUser  pedirTodasInformacoes:self];
}

- (IBAction)sendUser:(id)sender {
    NSDictionary  *temp = [self.user userToDictionary];
    [self.buscadorUser enviarUsuario: temp andDelegate:self];
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
    
//    NSBlockOperation *operation = [[NSBlockOperation alloc] init];
//   __weak NSBlockOperation *weakOperation = operation;
//
//    [operation addExecutionBlock:^{
//        NSMutableArray * tempArray = [[NSMutableArray alloc] init];
//        
//        for(NSDictionary *flickrPhoto in object)
//        {
//            if([weakOperation isCancelled])
//            {
//                return ;
//            }
//            if (![flickrPhoto isKindOfClass:[NSDictionary class]])
//            {
//                continue;
//            }
//            Restaurant * novoRestaurant = [[Restaurant alloc] initWithFlickrFoto:flickrPhoto];
//            [tempArray addObject: novaFoto];
//            
//        }
//        
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            fotosGrupo = [tempArray copy];
//            
//            NSLog(@"mandei recarregar a collection view");
//            [[self myCollectionView] reloadData];
//            
//        }];
//        
//    }];
//    
//    [_queue addOperation:operation];
    
}

-(void) request: (RestaurantRequest*) request didFailWithError:(NSError*) error
{
    NSLog(@"error with stocks request: %@",error);
}

@end
