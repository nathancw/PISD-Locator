//
//  AdminBuilding.m
//  PISD Locator
//
//  Created by Cole Hecht on 10/22/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "AdminBuilding.h"

@implementation AdminBuilding
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
    MKMapPoint upperLeft   = MKMapPointForCoordinate(CLLocationCoordinate2DMake(33.239945, -96.795308));
    MKMapPoint upperRight  = MKMapPointForCoordinate(CLLocationCoordinate2DMake(33.239942, -96.793720));
    MKMapPoint bottomLeft  = MKMapPointForCoordinate(CLLocationCoordinate2DMake(33.238173, -96.795301));
    
    //Building a map rect that represents the image projection on the map
    MKMapRect bounds = MKMapRectMake(upperLeft.x, upperLeft.y, fabs(upperLeft.x - upperRight.x), fabs(upperLeft.y - bottomLeft.y));
	
    return bounds;
}

- (CLLocationCoordinate2D)coordinate {
    //Image center point
    return CLLocationCoordinate2DMake(33.239054, -96.794514);
}

- (UIImage *)image {
	UIImage *image = [UIImage imageNamed:@"Admin Room #s.jpg"];
	return image;
}

- (NSString *)name {
	return @"Administration Building";
}

- (CLRegion *)region {
	CLLocationCoordinate2D center = self.coordinate;
	CLLocationDistance dist = 150.0;
	CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:center radius:dist identifier:self.name];
	return region;
}

@end
