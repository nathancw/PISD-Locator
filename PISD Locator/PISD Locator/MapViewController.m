//
//  ViewController.m
//  PISD Locator
//
//  Created by Cole Hecht on 9/30/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "MapViewController.h"
#import "LocationHandler.h"
#import "MapOverlayView.h"
#import "ProsperHighSchool.h" // Used to set up the default location

@interface MapViewController ()
@property (strong, nonatomic) LocationHandler *locationHandler;
@end

@implementation MapViewController
@synthesize mapView = _mapView;
@synthesize locationHandler = _locationHandler;
@synthesize navigationBarTitle = _navigationBarTitle;
@synthesize navigationBar = _navigationBar;

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
	[self.mapView addOverlays:[Campus arrayOfCampuses]];
	 
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

	// Customize Nav bar
	[[UINavigationBar appearance] setTitleTextAttributes:
 		[NSDictionary dictionaryWithObjectsAndKeys:
		//[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],
		[UIColor blackColor],
  		UITextAttributeTextColor,
		[NSValue valueWithUIOffset:UIOffsetMake(0, -1)],
		UITextAttributeTextShadowOffset,
  		[UIFont fontWithName:@"Copperplate" size:23.0],
  		UITextAttributeFont, nil]];
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
    return [[MapOverlayView alloc] initWithOverlay:overlay];
}

@end

