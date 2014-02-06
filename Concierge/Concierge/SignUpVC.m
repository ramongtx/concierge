//
//  SignUpVC.m
//  Concierge
//
//  Created by Bruno Versignassi on 2/5/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "SignUpVC.h"
@interface SignUpVC ()

@end

@implementation SignUpVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.loginText.layer.borderWidth = 0.5f;
    self.loginText.layer.borderColor = [[UIColor grayColor] CGColor];
    self.passText.layer.borderWidth = 0.5f;
    self.passText.layer.borderColor = [[UIColor grayColor] CGColor];
    self.phoneText.layer.borderWidth = 0.5f;
    self.phoneText.layer.borderColor = [[UIColor grayColor] CGColor];
    self.emailText.layer.borderWidth = 0.5f;
    self.emailText.layer.borderColor = [[UIColor grayColor] CGColor];
    
    
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

- (IBAction)pushSignUp:(id)sender {
    [self newUser];
}

- (void) newUser
{
    //The system user is set up, and saved.
    MODEL.user = [[User alloc] init];
    MODEL.user.name = self.loginText.text;
    MODEL.user.password = self.passText.text;
    MODEL.user.phone = self.phoneText.text;
    MODEL.user.email = self.emailText.text;
    
    [MODEL addUser:MODEL.user];
    
    [self performSegueWithIdentifier:@"toMenuVC" sender:nil];
}
@end
