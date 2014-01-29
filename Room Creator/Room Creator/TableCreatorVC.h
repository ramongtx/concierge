//
//  TableCreatorVC.h
//  Room Creator
//
//  Created by Ramon Carvalho Maciel on 1/28/14.
//  Copyright (c) 2014 Rock Bottom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Table.h"

@interface TableCreatorVC : UIViewController

@property (strong) UIImage* roomIndicator;
@property (strong) UIImage* mapImage;
@property NSInteger indicatorSize;
@property NSInteger indicatorRadius;

-(void)reload;
+(float)distanceBetween:(CGPoint)p1 and:(CGPoint)p2;
@end
