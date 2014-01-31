//
//  KeyboardVC.m
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/31/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "KeyboardVC.h"

@interface KeyboardVC ()

@end

@implementation KeyboardVC

UITapGestureRecognizer* tapRecognizer;

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
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:
     UIKeyboardWillShowNotification object:nil];
    
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:
     UIKeyboardWillHideNotification object:nil];
    
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                            action:@selector(didTapAnywhere:)];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) keyboardWillShow:(NSNotification *) note {
    [self.view addGestureRecognizer:tapRecognizer];
}

-(void) keyboardWillHide:(NSNotification *) note
{
    [self.view removeGestureRecognizer:tapRecognizer];
}

-(void)didTapAnywhere: (UITapGestureRecognizer*) recognizer {
    [self.view endEditing:YES];
}

@end
