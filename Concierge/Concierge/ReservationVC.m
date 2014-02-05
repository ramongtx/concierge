//
//  ReservationVC.m
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 2/4/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "ReservationVC.h"

@interface ReservationVC ()
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
}

- (IBAction)dateSelected:(id)sender {
}

-(void) saveReservation
{
    [RESERVATION setDate:[self.datePicker date]];
    [RESERVATION setDetails:[self.detailsTextView text]];
}

@end
