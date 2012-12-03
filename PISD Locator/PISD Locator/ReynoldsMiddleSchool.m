//
//  ReynoldsMiddleSchool.m
//  PISD Locator
//
//  Created by Cole Hecht on 10/23/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "ReynoldsMiddleSchool.h"

@implementation ReynoldsMiddleSchool
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
    MKMapPoint upperLeft   = MKMapPointForCoordinate(CLLocationCoordinate2DMake(33.243316, -96.801034));
    MKMapPoint upperRight  = MKMapPointForCoordinate(CLLocationCoordinate2DMake(33.243309, -96.798728));
    MKMapPoint bottomLeft  = MKMapPointForCoordinate(CLLocationCoordinate2DMake(33.241639, -96.801048));
    
    //Building a map rect that represents the image projection on the map
    MKMapRect bounds = MKMapRectMake(upperLeft.x, upperLeft.y, fabs(upperLeft.x - upperRight.x), fabs(upperLeft.y - bottomLeft.y));
	
    return bounds;
}

- (CLLocationCoordinate2D)coordinate {
    //Image center point
    return CLLocationCoordinate2DMake(33.242481, -96.799882);
}

- (UIImage *)image {
	UIImage *image = [UIImage imageNamed:@"Reynolds Room #s Only.jpg"];
	return image;
}

- (NSString *)name {
	return @"Reynolds Middle School";
}

- (CLRegion *)region {
	CLLocationCoordinate2D center = self.coordinate;
	CLLocationDistance dist = 400.0;
	CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:center radius:dist identifier:self.name];
	return region;
}

- (NSArray *)staffDirectory {
	
#warning Campus does not use its own info.
	NSString *path = [[NSBundle mainBundle] pathForResource:@"AdminInfo" ofType:@"txt"];
	
	NSString *fileContent = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:NULL];
	
	NSArray *arrayOfLines = [fileContent componentsSeparatedByString:[NSString stringWithFormat:@"%u", (char)10]];
	
	return arrayOfLines;
	
}

@end
