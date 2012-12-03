//
//  Campus.h
//  PISD Locator
//
//  Created by Cole Hecht on 11/18/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface PISDCampus : NSObject <MKOverlay>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) CLRegion *region;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSArray *staffDirectory;

+ (NSArray *)arrayOfCampuses;

@end
