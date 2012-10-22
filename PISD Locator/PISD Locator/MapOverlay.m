//
//  MapOverlay.m
//  PISD Locator
//
//  Created by Cole Hecht on 9/30/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "MapOverlay.h"


@implementation MapOverlay

-(CLLocationCoordinate2D)coordinate {
    //Image center point
    return CLLocationCoordinate2DMake(33.259057, -96.798508);
}

- (MKMapRect)boundingMapRect
{
    //Latitue and longitude for each corner point
    MKMapPoint upperLeft   = MKMapPointForCoordinate(CLLocationCoordinate2DMake(33.260027, -96.800646));
    MKMapPoint upperRight  = MKMapPointForCoordinate(CLLocationCoordinate2DMake(33.260024, -96.796406));
    MKMapPoint bottomLeft  = MKMapPointForCoordinate(CLLocationCoordinate2DMake(33.258057, -96.800645));
    
    //Building a map rect that represents the image projection on the map
    MKMapRect bounds = MKMapRectMake(upperLeft.x, upperLeft.y, fabs(upperLeft.x - upperRight.x), fabs(upperLeft.y - bottomLeft.y));
	
    return bounds;
}

@end
