//
//  SignInVC.h
//  Concierge
//
//  Created by Bruno Versignassi on 2/5/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "KeyboardVC.h"

@interface SignInVC : KeyboardVC
@property (weak, nonatomic) IBOutlet UITextField *loginText;
@property (weak, nonatomic) IBOutlet UITextField *passText;

@end
