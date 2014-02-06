    //
//  RestaurantVC.m
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/31/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "RestaurantInfoVC.h"

@interface RestaurantInfoVC () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextView;
@property (weak, nonatomic) IBOutlet UITextField *typeTextView;
@property (weak, nonatomic) IBOutlet UITextView *detailsTextView;
@property (weak, nonatomic) IBOutlet UIButton *editTableButton;
@property (weak, nonatomic) IBOutlet UIButton *saveAndBackButton;

@property (strong) Restaurant* restaurant;

@end

@implementation RestaurantInfoVC


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
    self.saveAndBackButton.enabled = FALSE;
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
    if ([MODEL.selectedRestaurant numberOfTables] != 0)
    {
        self.saveAndBackButton.enabled = YES;
    }
}

- (IBAction)editingFinished:(id)sender {
    [self saveRestaurant];
    
}
- (IBAction)saveAndBack:(id)sender {
   
    if ([MODEL.selectedRestaurant numberOfTables] == 0)
        {
                [self saveAndBackEditing];
        }
}

- (IBAction)changeLocation:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)saveRestaurant
{
    [RESTAURANT setName:self.nameTextView.text];
    [RESTAURANT setType:self.typeTextView.text];
    [RESTAURANT setDetails:self.detailsTextView.text];
}

-(void) saveAndBackEditing
{
    [RESTAURANT setOwner:USER];
    [USER setRestaurant:RESTAURANT];
    [USER setIsOwner:own];
    [MODEL addRestaurantToList:RESTAURANT]; // quando nao tem restaurant cadastrado esta quebrando.
    NSLog(@"%lu",(unsigned long)[[RESTAURANT tableArray] count]);
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
