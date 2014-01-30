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

@interface ViewController () <RestaurantRequestDelegate>
@property (nonatomic) RestaurantRequest *buscador;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.buscador = [[RestaurantRequest alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pushButton:(id)sender {
    NSLog(@"apertei o botao");
    
    [self.buscador pedirTodasInformacoes:self];
    
    NSLog(@"objeto buscado");
    
}

@end
