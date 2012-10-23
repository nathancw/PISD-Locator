//
//  MapOverlayView.h
//  PISD Locator
//
//  Created by Cole Hecht on 9/30/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapOverlayView : MKOverlayView

@property (strong, nonatomic) UIImage *imageToBeDrawn;

@end
