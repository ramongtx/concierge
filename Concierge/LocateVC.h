//
//  LocateVC.h
//  Concierge
//
//  Created by Fellipe Marcondes on 04/02/14.
//  Copyright (c) 2014 Pathfinders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapPoint.h"

@interface LocateVC : UIViewController  <MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocationCoordinate2D currentCentre;
    int currenDist;
    BOOL firstLaunch;
    
    CGPoint latLong;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
