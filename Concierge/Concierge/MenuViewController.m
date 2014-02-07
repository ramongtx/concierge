//
//  MenuViewController.m
//  Concierge
//
//  Created by Fellipe Marcondes on 06/02/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *topImageView;

@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView;

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    [self.topImageView setImage:[UIImage imageNamed:@"top.jpg"]];
    
    [self.bottomImageView setImage:[UIImage imageNamed:@"bottom.jpg"]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
