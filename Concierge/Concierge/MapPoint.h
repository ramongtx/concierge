//
//  MapPoint.h
//  GooglePlaces
//
//  Created by Fellipe Marcondes on 27/01/14.
//  Copyright (c) 2014 Fellipe Marcondes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#define kABPersonAddressStreetKey @"putAnythingInHere"

@interface MapPoint : NSObject <MKAnnotation>
{
    NSString *_name;
    NSString *_address;
    CLLocationCoordinate2D _coordinate;
}

@property (copy) NSString *name;
@property (copy) NSString *address;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;


- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate;
- (MKMapItem*)mapItem;

@end

