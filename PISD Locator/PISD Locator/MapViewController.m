//
//  ViewController.m
//  PISD Locator
//
//  Created by Cole Hecht on 9/30/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "MapViewController.h"
#import "LocationHandler.h"
#import "CampusManager.h"
#import "MapOverlayView.h"
#import "ProsperHighSchool.h"

@interface MapViewController ()
@property (strong, nonatomic) LocationHandler *locationHandler;
@end

@implementation MapViewController
@synthesize navigationBar = _navigationBar;
@synthesize mapView = _mapView;
@synthesize locationHandler = _locationHandler;

- (LocationHandler *)locationHandler {
	if (!_locationHandler) {
		_locationHandler = [[LocationHandler alloc] init];
	}
	return _locationHandler;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// ADD OVERLAYS TO MAP
	[self.mapView addOverlays:[CampusManager arrayOfCampuses]];
	 
	// CENTER MAP BASED ON USER'S LOCATION
	if (self.locationHandler.isOnPISDCampus) { // Go to campus user is on
		CLLocationCoordinate2D center = self.locationHandler.campus.region.center;
		MKCoordinateSpan span = {.latitudeDelta = 0.002, .longitudeDelta = 0.002};
		MKCoordinateRegion region = { center, span };
		[_mapView setRegion:region animated:YES];
	}
	else { // Go to default location (Prosper High School)
		CLLocationCoordinate2D center = [[ProsperHighSchool alloc] init].region.center;
		MKCoordinateSpan span = {.latitudeDelta = 0.003, .longitudeDelta = 0.003};
		MKCoordinateRegion region = { center, span };
		[_mapView setRegion:region animated:YES];
	}
}

- (void)viewDidUnload {
	[self setMapView:nil];
	[self setNavigationBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

// delegate fired by mapview requesting a MKOverlayView for each MapOverlay added
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay {
    return [[MapOverlayView alloc] initWithOverlay:overlay];
}

@end




