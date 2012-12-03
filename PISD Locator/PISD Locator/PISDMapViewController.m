//
//  ViewController.m
//  PISD Locator
//
//  Created by Cole Hecht on 9/30/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "PISDMapViewController.h"
#import "PISDLocationHandler.h"
#import "PISDMapOverlayView.h"
#import "PISDProsperHighSchool.h" // Used to set up the default location

@interface PISDMapViewController ()
@property (strong, nonatomic) PISDLocationHandler *locationHandler;
@end

@implementation PISDMapViewController
@synthesize mapView = _mapView;
@synthesize locationHandler = _locationHandler;
@synthesize navigationBarTitle = _navigationBarTitle;

- (PISDLocationHandler *)locationHandler {
	if (!_locationHandler) {
		_locationHandler = [[PISDLocationHandler alloc] init];
	}
	return _locationHandler;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// ADD OVERLAYS TO MAP
	[self.mapView addOverlays:[PISDCampus arrayOfCampuses]];
	 
	// CENTER MAP BASED ON USER'S LOCATION
	if (self.locationHandler.isOnPISDCampus) { // Go to campus user is on
		CLLocationCoordinate2D center = self.locationHandler.campus.region.center;
		MKCoordinateSpan span = {.latitudeDelta = 0.002, .longitudeDelta = 0.002};
		MKCoordinateRegion region = { center, span };
		[_mapView setRegion:region animated:YES];
	}
	else { // Go to default location (Prosper High School)
		CLLocationCoordinate2D center = [[PISDProsperHighSchool alloc] init].region.center;
		MKCoordinateSpan span = {.latitudeDelta = 0.003, .longitudeDelta = 0.003};
		MKCoordinateRegion region = { center, span };
		[_mapView setRegion:region animated:YES];
	}
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	if (self.locationHandler.isOnPISDCampus)
		// Set navigation bar title to the campus name
		[self.navigationBarTitle setTitle:self.locationHandler.campus.name];
	else
		// Set the nav. bar title to the generic "Prosper ISD"
		[self.navigationBarTitle setTitle:@"Prosper ISD"];
}

- (void)viewDidUnload {
	[self setMapView:nil];
	[self setNavigationBarTitle:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

// delegate fired by mapview requesting a MKOverlayView for each MapOverlay added
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay {
    return [[PISDMapOverlayView alloc] initWithOverlay:overlay];
}

@end




