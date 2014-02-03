//
//  TableInfoVC.m
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 2/3/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "TableInfoVC.h"

@interface TableInfoVC () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *numberTextView;
@property (weak, nonatomic) IBOutlet UITextField *chairsTextView;
@property (weak, nonatomic) IBOutlet UITextView *detailsTextView;

@end

@implementation TableInfoVC

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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reload];
}

-(void)reload
{
    [self.numberTextView setText:[NSString stringWithFormat:@"%d",[TABLE numberOfChairs]]];
    [self.chairsTextView setText:[NSString stringWithFormat:@"%d",[TABLE tableNumber]]];
    [self.detailsTextView setText:[TABLE details]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    [self saveTable];
}
- (IBAction)editingFinished:(id)sender {
    [self saveTable];
}

-(void) saveTable
{
    [TABLE setNumberOfChairs:[[self.chairsTextView text] integerValue]];
    [TABLE setTableNumber:[[self.numberTextView text] integerValue]];
    [TABLE setDetails:[self.detailsTextView text]];
}

@end
