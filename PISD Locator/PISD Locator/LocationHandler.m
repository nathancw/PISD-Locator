//
//  LocationHandler.m
//  PISD Locator
//
//  Created by Cole Hecht on 10/20/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "LocationHandler.h"
#import "CampusManager.h"

@interface LocationHandler ()
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation LocationHandler
@synthesize locationManager = _locationManager;
@synthesize isOnPISDCampus = _isOnPISDCampus;
@synthesize campus = _campus;

- (CLLocationManager *)locationManager {
	if (!_locationManager) {
		_locationManager = [[CLLocationManager alloc] init];
		[_locationManager setDelegate:self];
		[_locationManager setDesiredAccuracy:kCLLocationAccuracyBestForNavigation]; // Use "kCLLocationAccuracyBestForNavigation" as a more constvative and efficient alternative
		[_locationManager setDistanceFilter:kCLDistanceFilterNone];
	}
	return _locationManager;
}

- (id)init {
	_isOnPISDCampus = NO;
	_campus = [self getInitialCampus];
	NSLog(@"initial campus is %@", [self.campus name]);
	[self initializeRegionMonitoring:[CampusManager arrayOfCampuses]];
	NSLog(@"Location manager initialized. Device latitude: %f Device longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude);
	
	return self;
}

- (id<Campus>)getInitialCampus {
	id<Campus> cmp = nil;
	
	for (id<Campus> campus in [CampusManager arrayOfCampuses])
		if ([campus.region containsCoordinate:self.locationManager.location.coordinate]) {
			cmp = campus;
			_isOnPISDCampus = YES;
		}
			
	
	return cmp;
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
	NSLog(@"Device did enter region: %@", region.description);
    for (id<Campus> campus in [CampusManager arrayOfCampuses])
		if ([region.identifier isEqualToString:campus.name]) {
			_campus = campus;
			_isOnPISDCampus = YES;
			return;
		}
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    _campus = nil;
	_isOnPISDCampus = NO;
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    NSLog(@"Started monitoring \"%@\" region", region.identifier);
}

- (void)initializeRegionMonitoring:(NSArray *)campuses {
	for (id<Campus> campus in campuses)
		[self.locationManager startMonitoringForRegion:campus.region];
}

@end