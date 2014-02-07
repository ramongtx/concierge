//
//  SearchViewController.m
//  Concierge
//
//  Created by Fellipe Marcondes on 03/02/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "SearchVC.h"
#import "RestaurantReviewVC.h"

@interface SearchVC ()

@property (weak, nonatomic) IBOutlet UITextField *restaurantTypeTextField;

@end

@implementation SearchVC

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
	// Do any additional setup after loading the view.
    
    [self.restaurantTypeTextField setDelegate:self];
    
    //Add gesture recognizer in order to dismiss keyboar when tap outside fields.
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    
    //Make this controller the delegate for the map view.
    self.mapView.delegate = self;
    
    // Ensure that you can view your own location in the map view.
    [self.mapView setShowsUserLocation:YES];
    
    //Instantiate a location object.
    locationManager = [[CLLocationManager alloc] init];
    
    //Make this controller the delegate for the location manager.
    [locationManager setDelegate:self];
    
    //Set some parameters for the location object.
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    [self performSelector:@selector(plotPositions:) withObject:LIST afterDelay:2.0];
}

//Take off the keyboard when lose the focus.
-(void)dismissKeyboard
{
    [self.restaurantTypeTextField resignFirstResponder];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [MODEL pullRestaurantsList];
    
    [self performSelector:@selector(plotPositions:) withObject:LIST afterDelay:2.0];
}


- (IBAction)goSearchRestaurantType:(id)sender
{
    [self dismissKeyboard];
    
    [MODEL pullRestaurantsList];
    NSMutableArray* restaurantTypes = [[NSMutableArray alloc] init];
    
    for(Restaurant* restaurant in LIST)
    {
        if([restaurant.type isEqual:self.restaurantTypeTextField.text])
        {
            [restaurantTypes addObject:restaurant];
        }
    }
    
    NSLog(@" Essa    %@",LIST);
    
    [self plotPositions:restaurantTypes];
//    
//    MKMapRect r = [self.mapView visibleMapRect];
//    MKMapPoint pt = MKMapPointForCoordinate(    [[self.mapView.annotations objectAtIndex:0] coordinate]);
//    r.origin.x = pt.x - r.size.width * 0.5;
//    r.origin.y = pt.y - r.size.height * 0.25;
//    [self.mapView setVisibleMapRect:r animated:YES];
    
    //other try
    
    
//    MKMapRect zoomRect = MKMapRectNull;
//    for (id <MKAnnotation> annotation in self.mapView.annotations) {
//        MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
//        MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0);
//        if (MKMapRectIsNull(zoomRect)) {
//            zoomRect = pointRect;
//        } else {
//            zoomRect = MKMapRectUnion(zoomRect, pointRect);
//        }
//    }
//    [self.mapView setVisibleMapRect:zoomRect animated:YES];
    
    
    //other try

    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([[self.mapView.annotations objectAtIndex:1] coordinate], 1000, 1000);
    [self.mapView setRegion:region animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)plotPositions:(NSMutableArray *)data
{
    // 1 - Remove any existing custom annotations but not the user location blue dot.
    for (id<MKAnnotation> annotation in self.mapView.annotations) {
        if ([annotation isKindOfClass:[MapPoint class]]) {
            [self.mapView removeAnnotation:annotation];
        }
    }
    // 2 - Loop through the array of places.
    for (Restaurant *rest in data)
    {
        NSString *name = rest.name;
        NSString *vicinity = rest.placeLocation;
        CLLocationCoordinate2D placeCoord;
        placeCoord.latitude = rest.coordinates.x;
        placeCoord.longitude = rest.coordinates.y;
        
        MapPoint *placeObject = [[MapPoint alloc] initWithName:name address:vicinity coordinate:placeCoord];
        [self.mapView addAnnotation:placeObject];
        
        [self.mapView selectAnnotation:placeObject animated:YES];//here we select the pins that are added to the map
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"search"])
    {
        [MODEL setSelectedRestaurant:sender];
    }
}


#pragma mark - MKMapViewDelegate methods.

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    if ([control tag] == 1) //control == view.leftCalloutAccessoryView
    {// Left Accessory Button Tapped
        
        MapPoint *location = (MapPoint*)view.annotation;
        
        NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
        
        [[location mapItem] openInMapsWithLaunchOptions:launchOptions];

        
    }

    
     if ([control tag] == 2)//control == view.rightCalloutAccessoryView
    {// "Right Accessory Button Tapped
        
        for (Restaurant* restaurant  in LIST)
        {
             if([restaurant.name isEqualToString: [[view annotation] title]])
            {
                  [self performSegueWithIdentifier:@"search" sender:restaurant];
                return;
            }
        }
    }
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    // Define your reuse identifier.
    static NSString *identifier = @"MapPoint";
    
    if ([annotation isKindOfClass:[MapPoint class]]) {
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.multipleTouchEnabled = NO;
        annotationView.animatesDrop = YES; //it doesn`t work when using a image instead of the default pins
        //annotationView.image=[UIImage imageNamed:@"Restaurant.png"];//here we use a nice image instead of the default pins
        
        
        // Add to mapView:viewForAnnotation: after setting the image on the annotation view
        
        //create UIImageView to use for the leftCalloutAccessoryView...
       
        UIImage *img = [UIImage imageNamed:@"rota.jpg"];

        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
        iv.image = img;
        
        annotationView.leftCalloutAccessoryView =iv;
        [annotationView.leftCalloutAccessoryView setTag:1];
       
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        annotationView.rightCalloutAccessoryView=rightButton;

        [annotationView.rightCalloutAccessoryView setTag:2];
        
        return annotationView;
    }
    return nil;
}


-(void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views {
    //Zoom back to the user location after adding a new set of annotations.
    //Get the center point of the visible map.
    CLLocationCoordinate2D centre = [mv centerCoordinate];
    MKCoordinateRegion region;
    //If this is the first launch of the app, then set the center point of the map to the user's location.
    if (!firstLaunch) {
        region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate,1000,1000);
        firstLaunch=NO;
    }else {
        //Set the center point to the visible region of the map and change the radius to match the search radius passed to the Google query string.
        region = MKCoordinateRegionMakeWithDistance(centre,currenDist,currenDist);
    }
    //Set the visible region of the map.
    [mv setRegion:region animated:YES];
}


- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
 //when a pin is selected
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    //Get the east and west points on the map so you can calculate the distance (zoom level) of the current map view.
//    MKMapRect mRect = self.mapView.visibleMapRect;
//    MKMapPoint eastMapPoint = MKMapPointMake(MKMapRectGetMinX(mRect), MKMapRectGetMidY(mRect));
//    MKMapPoint westMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), MKMapRectGetMidY(mRect));
//    
//    //Set your current distance instance variable.
//    currenDist = MKMetersBetweenMapPoints(eastMapPoint, westMapPoint);
//    
//    //Set your current center point on the map instance variable.
//    currentCentre = self.mapView.centerCoordinate;
}




@end
