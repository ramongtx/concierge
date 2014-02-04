//
//  RestaurantInfoSearchViewController.m
//  Concierge
//
//  Created by Fellipe Marcondes on 03/02/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "RestaurantInfoSearchViewController.h"

@interface RestaurantInfoSearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextView;
@property (weak, nonatomic) IBOutlet UITextField *typeTextView;
@property (weak, nonatomic) IBOutlet UITextView *detailsTextView;

@end

@implementation RestaurantInfoSearchViewController

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
    self.detailsTextView.layer.borderWidth = 0.5f;
    self.detailsTextView.layer.borderColor = [[UIColor grayColor] CGColor];;
    self.detailsTextView.editable = NO;
    
    self.nameTextView.text = [RESTAURANT name];
    self.detailsTextView.text = [NSString stringWithFormat:@"Latitude = %f, Longitude = %f\nAddress = %@", [RESTAURANT latLong].x , [RESTAURANT latLong].y, [RESTAURANT placeLocation]];
}

@end
