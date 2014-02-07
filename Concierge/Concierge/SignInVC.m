//
//  SignInVC.m
//  Concierge
//
//  Created by Bruno Versignassi on 2/5/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "SignInVC.h"

@interface SignInVC ()<UIAlertViewDelegate>


@property (nonatomic) UIAlertView * alert;
@property (weak, nonatomic) IBOutlet UIImageView *conciergeImgView;


@end

@implementation SignInVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.alert = [[UIAlertView alloc] initWithTitle:@"User/Password not found" message:@"Please enter your username and password again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
   
    
    [MODEL pullUsersList];
//    [MODEL pullRestaurantsList];
    
    self.loginText.layer.borderWidth = 0.5f;
    self.loginText.layer.borderColor = [[UIColor grayColor] CGColor];
    self.passText.layer.borderWidth = 0.5f;
    self.passText.layer.borderColor = [[UIColor grayColor] CGColor];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIImage* img = [UIImage imageNamed:@"concierge.jpg"];
    
    [self.conciergeImgView setImage:img];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pushSignIn:(id)sender {
    [self autenticate];
}
- (IBAction)pushSignUp:(id)sender {
    [self performSegueWithIdentifier:@"toSignUpVC" sender:nil];
}



#pragma mark - SignIn method
-(void) autenticate
{
    [MODEL pickUserWithName: self.loginText.text];
    if (USER  == Nil) {
        [self.alert show];
        [self.loginText setText:@""];
        [self.passText setText:@""];
        
    } else
        
        [self performSegueWithIdentifier:@"loginToMenuVC" sender:nil];
}

#pragma mark - Alert method
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        [self.alert dismissWithClickedButtonIndex:0 animated:1];
    }
}

@end
