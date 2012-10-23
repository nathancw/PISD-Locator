//
//  Campus.h
//  PISD Locator
//
//  Created by Cole Hecht on 10/21/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@protocol Campus <MKOverlay>

@required
///////////////////////////////////////////////
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) CLRegion *region;
@property (strong, nonatomic) UIImage *image;

@end
