//
//  SignUpVC.h
//  Concierge
//
//  Created by Bruno Versignassi on 2/5/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "KeyboardVC.h"

@interface SignUpVC : KeyboardVC
@property (weak, nonatomic) IBOutlet UITextField *loginText;
@property (weak, nonatomic) IBOutlet UITextField *passText;
@property (weak, nonatomic) IBOutlet UITextField *phoneText;
@property (weak, nonatomic) IBOutlet UITextField *emailText;

@end
