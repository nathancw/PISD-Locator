//
//  LocationHandler.h
//  PISD Locator
//
//  Created by Cole Hecht on 10/20/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Campus.h"

@interface LocationHandler : NSObject <CLLocationManagerDelegate>

/*
 *	Returns weather or not the device is on a PISD campus
 */
@property (readonly, nonatomic) BOOL isOnPISDCampus;

/*
 *	Returns the campus the device is on.
 *	If device is not found to be on a PISD campus, nil is returned.
 */
@property (readonly, nonatomic) id<Campus> campus;



@end
