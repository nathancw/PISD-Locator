//
//  ReynoldsMiddleSchool.m
//  PISD Locator
//
//  Created by Cole Hecht on 10/23/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "ReynoldsMiddleSchool.h"
#import "UserDefinedCampus.h"

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
	NSString *path = [[NSBundle mainBundle] pathForResource:@"AdminInfo" ofType:@"csv"];
	
	NSString *fileContent = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
	
	NSArray *arrayOfLines = [fileContent componentsSeparatedByString:@"|"];
	
	NSMutableArray *arrayOfData = [NSMutableArray array];
	
	for (NSString *line in arrayOfLines) {
		
		NSArray *array = [line componentsSeparatedByString:@","];
		NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
		
		@try {
			[dictionary setObject:[array objectAtIndex:0] forKey:[NSNumber numberWithInt:CampusEmployeePosition]];
			[dictionary setObject:[array objectAtIndex:1] forKey:[NSNumber numberWithInt:CampusEmployeePhoneExtension]];
			[dictionary setObject:[array objectAtIndex:2] forKey:[NSNumber numberWithInt:CampusEmployeeRoomNumber]];
			[dictionary setObject:[NSString stringWithFormat:@"%@ %@", [array objectAtIndex:3], [array objectAtIndex:4]] forKey:[NSNumber numberWithInt:CampusEmployeeName]];
			[dictionary setObject:@"Administration" forKey:[NSNumber numberWithInt:CampusEmployeeCampus]];
		}
		@catch (NSException *exception) {
			continue;
		}
		
		[arrayOfData addObject:dictionary];
	}

	return arrayOfData;
	
}

@end






