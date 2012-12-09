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

@interface Campus : NSObject <MKOverlay>

/*
 *	The Formal Name of the campus.
 */
@property (readonly, nonatomic) NSString *name;

/*
 *	The region that constitutes the campus. Used in geofencing.
 */
@property (readonly, nonatomic) CLRegion *region;

/*
 *	The campus  map's image to be overlayed onto map.
 */
@property (readonly, nonatomic) UIImage *image;

/*
 *	As the name implies, a diriecoty of all the employees on the givin campus.
 *	The property is an NSArray of  NSDictionarys, each with the values for the 
 *		employee. These valuse include name phone extention and postion.
 *	NSDictionary keys are defined below.
 */
@property (readonly, nonatomic) NSArray *staffDirectory;

typedef enum {
	CampusEmployeeCampus,
	CampusEmployeeName,
	CampusEmployeePhoneExtension,
	CampusEmployeeRoomNumber,
	CampusEmployeePosition
} CampusEmployee;

+ (NSArray *)arrayOfCampuses;


@end
