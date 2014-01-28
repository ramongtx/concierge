//
//  TableCreatorVC.m
//  Room Creator
//
//  Created by Ramon Carvalho Maciel on 1/28/14.
//  Copyright (c) 2014 Rock Bottom. All rights reserved.
//

#import "TableCreatorVC.h"
#import "TableButton.h"

@interface TableCreatorVC () <UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation TableCreatorVC

UIImageView* imageView;
NSMutableArray* buttonArray;


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
    
    buttonArray = [[NSMutableArray alloc] init];
    
    UIImage *map = [UIImage imageNamed:@"hotel_floor.jpg"];
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, map.size.width, map.size.height)];
    imageView.image = map;
    
    self.scrollView.contentSize = imageView.frame.size;
    [self.scrollView addSubview:imageView];
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = self.scrollView.frame.size.height/imageView.frame.size.height;
    self.scrollView.zoomScale = self.scrollView.minimumZoomScale;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    tap.cancelsTouchesInView = NO;
    tap.delegate = self;
    [self.scrollView addGestureRecognizer:tap];
}

#pragma mark - UIScrollView Delegate

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}

#pragma mark - UITapGestureRecognizer Selector

-(void)createTableButton:(CGPoint) location
{
    CGRect rect;
    rect.origin = location;
    rect.size = CGSizeMake(50, 50);
    TableButton* tb = [[TableButton alloc] initWithFrame:rect];
    [imageView addSubview:tb];
    tb.center = location;
    [buttonArray addObject:tb];
}

-(IBAction)tapGesture:(UITapGestureRecognizer *)recognizer
{
    
    CGPoint location = [recognizer locationInView:imageView];
    [self createTableButton:location];
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gesture
{
    CGPoint location = [gesture locationInView:imageView];
    for (TableButton *tb in buttonArray)
    {
        if(CGRectContainsPoint(tb.frame, location)) {
            NSLog(@"Not OK");
            return false;
        }
    }
    NSLog(@"OK");
    return true;
}


@end
