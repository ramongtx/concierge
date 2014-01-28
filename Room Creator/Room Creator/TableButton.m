//
//  TableButton.m
//  Room Creator
//
//  Created by Ramon Carvalho Maciel on 1/28/14.
//  Copyright (c) 2014 Rock Bottom. All rights reserved.
//

#import "TableButton.h"

@implementation TableButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setAlpha:0.8];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapButton:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}


- (IBAction)tapButton:(UITapGestureRecognizer *)sender
{
    NSLog(@"Button");
}

@end
