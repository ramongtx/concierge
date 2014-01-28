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
        self.image = [UIImage imageNamed:@"sphere.png"];
    }
    return self;
}
@end
