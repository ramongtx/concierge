//
//  EditMapVC.m
//  Concierge
//
//  Created by Ramon Carvalho Maciel on 1/31/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "EditMapVC.h"

@interface EditMapVC () <UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation EditMapVC

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
        if ([Model distanceBetween:location and:indicator.center] < self.indicatorRadius) {
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

    Table* table = [[Table alloc] init];
    [table setDetails:@"Table created sucesfully."];
    [tableArray addObject:table];
    
    [self editTable:[tableIndicatorArray indexOfObject:indicator]];
    
}

-(void)editTable:(NSInteger)id
{
    NSLog(@"Editing table #%ld",(long)id);
    [self performSegueWithIdentifier:@"editTableInfoSegue" sender:self];
    
}



@end
