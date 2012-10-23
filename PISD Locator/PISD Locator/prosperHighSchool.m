//
//  ProsperHighSchool.m
//  PISD Locator
//
//  Created by Cole Hecht on 10/22/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "ProsperHighSchool.h"

@implementation ProsperHighSchool
//
@synthesize boundingMapRect = _boundingMapRect;
@synthesize coordinate = _coordinate;
@synthesize image = _image;
@synthesize name = _name;
@synthesize region = _region;
//

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

- (CLLocationCoordinate2D)coordinate {
    //Image center point
    return CLLocationCoordinate2DMake(33.259057, -96.798508);
}

- (UIImage *)image {
	UIImage *image = [UIImage imageNamed:@"PHS_1st_floor_edited.png"];
	return image;
}

- (NSString *)name {
	return @"Prosper High School";
}

- (CLRegion *)region {
	CLLocationCoordinate2D center = self.coordinate;
	CLLocationDistance dist = 600.0;
	CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:center radius:dist identifier:self.name];
	return region;
}

@end
