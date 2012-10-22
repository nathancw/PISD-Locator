//
//  Campuses.h
//  PISD Locator
//
//  Created by Cole Hecht on 10/21/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Campus.h"

@interface PISDCampuses : NSObject

/*
 *	ALL PISD CAMPUSES MUST BE INCLUDED IN THIS HEADER
 *
 */

// Administrative Building
+ (Campus *)administrativeBuilding;

// Elementary Schools
+ (Campus *)bakerElementary;
+ (Campus *)cockrellElementary;
+ (Campus *)folsomElementary;
+ (Campus *)ruckerElementary;

// Middle Schools
+ (Campus *)reynoldsMiddleSchool;
+ (Campus *)rogersMiddleSchool;

// High Schools
+ (Campus *)prosperHighSchool;

/*
 *	RETURNS AN ARRAY FILLED WITH ALL PISD CAMPUSES
 *
 */
+ (NSArray *)getArrayOfCampuses;

@end
