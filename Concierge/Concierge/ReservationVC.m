//
//  ReservationVC.m
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 2/4/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "ReservationVC.h"

@interface ReservationVC () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UITextField *durationTextField;
@property (weak, nonatomic) IBOutlet UITextView *detailsTextView;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation ReservationVC

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
	// Do any additional setup after loading the view.
}

- (IBAction)submit:(id)sender
{
    [self saveReservation];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)dateSelected:(id)sender
{
    [self saveReservation];
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    [self saveReservation];
}

-(void) saveReservation
{
    [RESERVATION setDate:[self.datePicker date]];
    [RESERVATION setDetails:[self.detailsTextView text]];
    [RESERVATION setDuration:60*[[self.durationTextField text] intValue]];
    [RESERVATION setRestaurant:RESTAURANT];
    [RESERVATION setClient:USER];
    [RESERVATION setTable:TABLE];
    
}

@end
