//
//  SearchViewController.h
//  Concierge
//
//  Created by Fellipe Marcondes on 03/02/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapPoint.h"
#import "Model.h"


@interface SearchViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
   CLLocationManager *locationManager;
   CLLocationCoordinate2D currentCentre;
   int currenDist;
   BOOL firstLaunch;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
