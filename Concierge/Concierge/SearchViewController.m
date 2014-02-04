//
//  SearchViewController.m
//  Concierge
//
//  Created by Fellipe Marcondes on 03/02/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import "SearchViewController.h"
#import "RestaurantInfoSearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

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
    for (int i=0; i<[data count]; i++)
    {
        
        // 3 - Get your name and address info for adding to a pin.
        NSString *name=[[data objectAtIndex:i] name];
        NSString *vicinity=[[data objectAtIndex:i] placeLocation];
        // Create a special variable to hold this coordinate info.
        CLLocationCoordinate2D placeCoord;
        // Set the lat and long.
        
        CGPoint latLong = [[data objectAtIndex:i] latLong];
        
        placeCoord.latitude=latLong.x;
        placeCoord.longitude=latLong.y;
        // 4 - Create a new annotation.
        MapPoint *placeObject = [[MapPoint alloc] initWithName:name address:vicinity coordinate:placeCoord];
        [self.mapView addAnnotation:placeObject];
        
        [self.mapView selectAnnotation:placeObject animated:YES];//here we select the pins that are added to the map
    }

/****************************************Begin Test Block****************************************/
    
    NSString *name=@"Name Test";
    NSString *vicinity=@"Address Test";
    CLLocationCoordinate2D placeCoord;
    placeCoord.latitude=37.78782460363909;
    placeCoord.longitude=-122.4078183090829;
    MapPoint *placeObject = [[MapPoint alloc] initWithName:name address:vicinity coordinate:placeCoord];
    [self.mapView addAnnotation:placeObject];
    [self.mapView selectAnnotation:placeObject animated:YES];//here we select the pins that are added to the map
    
/****************************************End Test Block****************************************/
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"search"])
    {
        [MODEL setSelectedRestaurant:sender];
        RestaurantInfoSearchViewController* picker  = segue.destinationViewController;
    }
}


#pragma mark - MKMapViewDelegate methods.

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {

    NSLog(@"Tittle = %@, Subtittle = %@", [view.annotation title],[view.annotation subtitle]);
    
    
    if ([control tag] == 1) //control == view.leftCalloutAccessoryView
    {// Left Accessory Button Tapped
        
        MapPoint *location = (MapPoint*)view.annotation;
        
        NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
        
        [[location mapItem] openInMapsWithLaunchOptions:launchOptions];

        
    }
    
    else if ([control tag] == 2)//control == view.rightCalloutAccessoryView
    {// "Right Accessory Button Tapped
        
        Restaurant* restaurant  = [[Restaurant alloc]init];
        
        restaurant.name =[view.annotation title];
        restaurant.placeLocation = [view.annotation subtitle];
        restaurant.latLong = CGPointMake( [[view annotation] coordinate].latitude,  [[view annotation] coordinate].longitude);
        
        [self performSegueWithIdentifier:@"search" sender:restaurant];
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
        [annotationView.leftCalloutAccessoryView setTag:1];
        UIImage *img = [UIImage imageNamed:@"rota.jpg"];

        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
        iv.image = img;
        
        annotationView.leftCalloutAccessoryView =iv;
        [annotationView.leftCalloutAccessoryView setTag:2];
       
        
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
    MKMapRect mRect = self.mapView.visibleMapRect;
    MKMapPoint eastMapPoint = MKMapPointMake(MKMapRectGetMinX(mRect), MKMapRectGetMidY(mRect));
    MKMapPoint westMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), MKMapRectGetMidY(mRect));
    
    //Set your current distance instance variable.
    currenDist = MKMetersBetweenMapPoints(eastMapPoint, westMapPoint);
    
    //Set your current center point on the map instance variable.
    currentCentre = self.mapView.centerCoordinate;
}




@end
