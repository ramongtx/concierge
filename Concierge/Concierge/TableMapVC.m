//
//  TableMapVC.m
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/31/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "TableMapVC.h"

@interface TableMapVC () <UIGestureRecognizerDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation TableMapVC


UIImageView* imageView;
NSMutableArray* tableIndicatorArray;


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
    
    [tableIndicatorArray removeAllObjects];
    
    NSLog(@"%@ %ld",[RESTAURANT name],[[RESTAURANT tableArray] count]);
    for (Table* tb in [RESTAURANT tableArray]) {
        [self markTable:tb.location];
    }
}

#pragma mark - UITapGestureRecognizer Selector

-(IBAction)tapGesture:(UITapGestureRecognizer *)recognizer
{
    
    CGPoint location = [recognizer locationInView:imageView];
    for (UIImageView *indicator in tableIndicatorArray)
    {
        if ([Model distanceBetween:location and:indicator.center] < self.indicatorRadius) {
            [self reserveTable:[RESTAURANT tableWithLocation:indicator.center]];
            return;
        }
    }
    return;
}

-(void)reserveTable:(Table*) tb
{
    [MODEL setSelectedTable:tb];
    [RESERVATION setTable:tb];
    [RESERVATION setRestaurant:RESTAURANT];
    [RESERVATION setClient:USER];
    
    [self performSegueWithIdentifier:@"toTableReview" sender:self];
    
}

-(void) markTable:(CGPoint)location
{
    CGRect rect;
    rect.origin = location;
    rect.size = CGSizeMake(self.indicatorSize, self.indicatorSize);
    
    UIImageView* indicator = [[UIImageView alloc] initWithFrame:rect];
    [imageView addSubview:indicator];
    [indicator setImage:self.roomIndicator];
    [indicator setCenter:location];
    [tableIndicatorArray addObject:indicator];
}

@end
