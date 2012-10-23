//
//  Campuses.m
//  PISD Locator
//
//  Created by Cole Hecht on 10/21/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "CampusManager.h"

#import "ProsperHighSchool.h"
#import "AdminBuilding.h"
#import "ReynoldsMiddleSchool.h"

@implementation CampusManager

/*
 *	ALL PISD CAMPUSES MUST BE REGISTERED IN THIS ARRAY!
 *
 */
+ (NSArray *)arrayOfCampuses {
	NSMutableArray *campuses = [NSMutableArray arrayWithObjects:
								[[ProsperHighSchool alloc] init],
								[[AdminBuilding alloc] init],
								[[ReynoldsMiddleSchool alloc] init],
								nil];
	return campuses;
}

+ (NSUInteger)numberOfCampuses {
	return [CampusManager arrayOfCampuses].count;
}

@end

