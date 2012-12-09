//
//  LocationHandler.m
//  PISD Locator
//
//  Created by Cole Hecht on 10/20/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "LocationHandler.h"
#import "Campus.h"

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
	[self initializeRegionMonitoring:[Campus arrayOfCampuses]];
	
	return self;
}

- (Campus *)getInitialCampus {
	Campus *cmp = nil;
	
	for (Campus *campus in [Campus arrayOfCampuses])
		if ([campus.region containsCoordinate:self.locationManager.location.coordinate]) {
			cmp = campus;
			_isOnPISDCampus = YES;
		}
			
	
	return cmp;
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    for (Campus *campus in [Campus arrayOfCampuses])
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
    // Started monitoring		CLRegion : region
}

- (void)initializeRegionMonitoring:(NSArray *)campuses {
	for (Campus *campus in campuses)
		[self.locationManager startMonitoringForRegion:campus.region];
}

@end
