//
//  TableCreatorVC.m
//  Room Creator
//
//  Created by Ramon Carvalho Maciel on 1/28/14.
//  Copyright (c) 2014 Rock Bottom. All rights reserved.
//

#import "TableCreatorVC.h"

#define MAP_IMAGE "hotel_floor.jpg"
#define ROOM_INDICATOR "sphere.png"
#define INDICATOR_SIZE 20
#define INDICATOR_RADIUS 40


@interface TableCreatorVC () <UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation TableCreatorVC

UIImageView* imageView;
NSMutableArray* tableIndicatorArray;
NSMutableArray* tableArray;

#pragma mark - Constructors

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    tap.cancelsTouchesInView = NO;
    tap.delegate = self;
    [self.scrollView addGestureRecognizer:tap];
    
    self.mapImage = [UIImage imageNamed:@MAP_IMAGE];
    self.roomIndicator = [UIImage imageNamed:@ROOM_INDICATOR];
    self.indicatorSize = INDICATOR_SIZE;
    self.indicatorRadius = INDICATOR_RADIUS;
    
    tableIndicatorArray = [[NSMutableArray alloc] init];
    
    [self reload];
    
}

- (void) reload
{
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.mapImage.size.width, self.mapImage.size.height)];
    imageView.image = self.mapImage;
    
    self.scrollView.contentSize = imageView.frame.size;
    self.scrollView.delegate = self;
    self.scrollView.zoomScale = self.scrollView.frame.size.height/imageView.frame.size.height;
    
    [self.scrollView addSubview:imageView];
}

#pragma mark - UIScrollView Delegate

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}

#pragma mark - UITapGestureRecognizer Selector

-(IBAction)tapGesture:(UITapGestureRecognizer *)recognizer
{
    CGPoint location = [recognizer locationInView:imageView];
    for (UIImageView *indicator in tableIndicatorArray)
    {
        if ([TableCreatorVC distanceBetween:location and:indicator.center] < self.indicatorRadius) {
            [self editTable:[tableIndicatorArray indexOfObject:indicator]];
            return;
        }
    }
    [self createTable:location];
    return;
}

-(void)createTable:(CGPoint) location
{
    CGRect rect;
    rect.origin = location;
    rect.size = CGSizeMake(self.indicatorSize, self.indicatorSize);
    
    UIImageView* indicator = [[UIImageView alloc] initWithFrame:rect];
    [imageView addSubview:indicator];
    [indicator setImage:self.roomIndicator];
    [indicator setCenter:location];
    [tableIndicatorArray addObject:indicator];
    
    [self editTable:[tableIndicatorArray indexOfObject:indicator]];
    
}

-(void)editTable:(int)id
{
    NSLog(@"Editing table #%d",id);

}

+(float)distanceBetween:(CGPoint)p1 and:(CGPoint)p2
{
    return sqrt(((p1.x-p2.x)*(p1.x-p2.x))+((p1.y-p2.y)*(p1.y-p2.y)));
}



@end
