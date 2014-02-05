//
//  TableReviewVC.m
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 2/4/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "TableReviewVC.h"

@interface TableReviewVC ()
@property (weak, nonatomic) IBOutlet UITextField *numberTextView;
@property (weak, nonatomic) IBOutlet UITextField *chairsTextView;
@property (weak, nonatomic) IBOutlet UITextView *detailsTextView;

@end

@implementation TableReviewVC

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
    self.detailsTextView.layer.borderColor = [[UIColor grayColor] CGColor];
    
    [self reload];
    
	// Do any additional setup after loading the view.
}

-(void)reload
{
    [self.numberTextView setText:[NSString stringWithFormat:@"%ld",[TABLE numberOfChairs]]];
    [self.chairsTextView setText:[NSString stringWithFormat:@"%ld",[TABLE tableNumber]]];
    [self.detailsTextView setText:[TABLE details]];
}

@end
