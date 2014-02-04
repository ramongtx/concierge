//
//  RestaurantVC.m
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/31/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "RestaurantVC.h"

@interface RestaurantVC () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextView;
@property (weak, nonatomic) IBOutlet UITextField *typeTextView;
@property (weak, nonatomic) IBOutlet UITextView *detailsTextView;
@property (weak, nonatomic) IBOutlet UIButton *editTableButton;

@property (strong) Restaurant* restaurant;

@end

@implementation RestaurantVC


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
    self.detailsTextView.layer.borderWidth = 0.5f;
    self.detailsTextView.layer.borderColor = [[UIColor grayColor] CGColor];;
    

    [self.detailsTextView setDelegate:self];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reload];
}

-(void) reload {
    self.nameTextView.text = [RESTAURANT name];
    self.typeTextView.text = [RESTAURANT type];
    self.detailsTextView.text = [RESTAURANT details];
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    [self saveRestaurant];
}

- (IBAction)editingFinished:(id)sender {
    [self saveRestaurant];
}
- (IBAction)saveAndBack:(id)sender {
    [MODEL addRestaurantToList:RESTAURANT];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)saveRestaurant
{
    [RESTAURANT setName:self.nameTextView.text];
    [RESTAURANT setType:self.typeTextView.text];
    [RESTAURANT setDetails:self.detailsTextView.text];
}

@end
