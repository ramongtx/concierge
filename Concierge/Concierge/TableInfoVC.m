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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
