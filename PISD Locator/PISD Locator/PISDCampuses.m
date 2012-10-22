//
//  Campuses.m
//  PISD Locator
//
//  Created by Cole Hecht on 10/21/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "PISDCampuses.h"

@implementation PISDCampuses

+ (NSArray *)getArrayOfCampuses {
	
	/*
	 *	ALL CAMPUSES MUST BE INCLUDED IN THIS ARRAY!         |
	 *	                                                                                      \/
	 */
	
	return [NSArray arrayWithObjects:	[PISDCampuses administrativeBuilding],
										[PISDCampuses bakerElementary],
										[PISDCampuses cockrellElementary],
										[PISDCampuses folsomElementary],
										[PISDCampuses ruckerElementary],
										[PISDCampuses reynoldsMiddleSchool],
										[PISDCampuses rogersMiddleSchool],
										[PISDCampuses prosperHighSchool],
										nil];
}

+ (Campus *)administrativeBuilding {
	Campus *campus = [[Campus alloc] init];
	[campus setFormalName:@"Administration Building"];
	CLLocationCoordinate2D center = { 3, 3 };
	CLLocationDistance dist = 600.0;
	CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:center radius:dist identifier:campus.formalName];
	[campus setRegion:region];
	[campus setImage:nil];
	return campus;
}

+ (Campus *)bakerElementary {
	Campus *campus = [[Campus alloc] init];
	[campus setFormalName:nil];
	CLLocationCoordinate2D center = { 3, 3 };
	CLLocationDistance dist = 600.0;
	CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:center radius:dist identifier:campus.formalName];
	[campus setRegion:region];
	[campus setImage:nil];
	return campus;
}

+ (Campus *)cockrellElementary {
	Campus *campus = [[Campus alloc] init];
	[campus setFormalName:nil];
	CLLocationCoordinate2D center = { 3, 3 };
	CLLocationDistance dist = 600.0;
	CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:center radius:dist identifier:campus.formalName];
	[campus setRegion:region];
	[campus setImage:nil];
	return campus;
}

+ (Campus *)folsomElementary {
	Campus *campus = [[Campus alloc] init];
	[campus setFormalName:nil];
	CLLocationCoordinate2D center = { 3, 3 };
	CLLocationDistance dist = 600.0;
	CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:center radius:dist identifier:campus.formalName];
	[campus setRegion:region];
	[campus setImage:nil];
	return campus;
}

+ (Campus *)ruckerElementary {
	Campus *campus = [[Campus alloc] init];
	[campus setFormalName:nil];
	CLLocationCoordinate2D center = { 3, 3 };
	CLLocationDistance dist = 600.0;
	CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:center radius:dist identifier:campus.formalName];
	[campus setRegion:region];
	[campus setImage:nil];
	return campus;
}

+ (Campus *)reynoldsMiddleSchool {
	Campus *campus = [[Campus alloc] init];
	[campus setFormalName:nil];
	CLLocationCoordinate2D center = { 3, 3 };
	CLLocationDistance dist = 600.0;
	CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:center radius:dist identifier:campus.formalName];
	[campus setRegion:region];
	[campus setImage:nil];
	return campus;
}

+ (Campus *)rogersMiddleSchool {
	Campus *campus = [[Campus alloc] init];
	[campus setFormalName:nil];
	CLLocationCoordinate2D center = { 3, 3 };
	CLLocationDistance dist = 600.0;
	CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:center radius:dist identifier:campus.formalName];
	[campus setRegion:region];
	[campus setImage:nil];
	return campus;
}

+ (Campus *)prosperHighSchool {
	Campus *campus = [[Campus alloc] init];
	[campus setFormalName:@"Prosper High School"];
	CLLocationCoordinate2D center = { 33.259042, -96.798508 };
	CLLocationDistance dist = 600.0;
	CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:center radius:dist identifier:campus.formalName];
	[campus setRegion:region];
	[campus setImage:nil];
	return campus;
}

@end

