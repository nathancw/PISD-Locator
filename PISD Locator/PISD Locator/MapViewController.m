//
//  ViewController.m
//  PISD Locator
//
//  Created by Cole Hecht on 9/30/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "MapViewController.h"
#import "MapOverlay.h"
#import "MapOverlayView.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize navigationBar = _navigationBar;
@synthesize mapView = _mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //Centering map
    CLLocationCoordinate2D coord1 = {
		33.259043, -96.798508
	};
	
	MKCoordinateSpan span = {.latitudeDelta = 0.002, .longitudeDelta = 0.002};
	MKCoordinateRegion region = {coord1, span};
	[_mapView setRegion:region animated:YES];
    
    //Adding our overlay to the map
    MapOverlay * mapOverlay = [[MapOverlay alloc] init];
    [_mapView addOverlay:mapOverlay];
    
}

- (void)viewDidUnload
{
	[self setMapView:nil];
	[self setNavigationBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

//delegate fired bby mapview requesting a MKOverlayView for each MapOverlay added
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay {
	
    MapOverlay *mapOverlay = (MapOverlay *)overlay;
    MapOverlayView *mapOverlayView = [[MapOverlayView alloc] initWithOverlay:mapOverlay];
	
    return mapOverlayView;
}

@end
