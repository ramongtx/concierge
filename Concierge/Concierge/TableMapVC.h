//
//  TableMapVC.h
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/31/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

#define MAP_IMAGE "restaurant_plan.jpg"
#define ROOM_INDICATOR "sphere.png"
#define INDICATOR_SIZE 20
#define INDICATOR_RADIUS 50

@interface TableMapVC : UIViewController

@property (strong) UIImage* roomIndicator;
@property (strong) UIImage* mapImage;
@property NSInteger indicatorSize;
@property NSInteger indicatorRadius;

-(void)reload;

@end
