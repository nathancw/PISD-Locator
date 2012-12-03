//
//  Campus.m
//  PISD Locator
//
//  Created by Cole Hecht on 11/18/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "PISDCampus.h"
// Classes that subclss this one
#import "PISDAdminBuilding.h"
#import "PISDProsperHighSchool.h"
#import "PISDReynoldsMiddleSchool.h"


@implementation PISDCampus
@synthesize name;
@synthesize region;
@synthesize image;
@synthesize coordinate;
@synthesize boundingMapRect;

- (NSString *)name {
	@throw [NSException exceptionWithName:NSInternalInconsistencyException
								   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
								 userInfo:nil];
}

- (CLRegion *)region {
	@throw [NSException exceptionWithName:NSInternalInconsistencyException
								   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
								 userInfo:nil];
}

- (UIImage *)image {
	@throw [NSException exceptionWithName:NSInternalInconsistencyException
								   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
								 userInfo:nil];
}

- (NSArray *)staffDirectory {
	@throw [NSException exceptionWithName:NSInternalInconsistencyException
								   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
								 userInfo:nil];
}

+ (NSArray *)arrayOfCampuses {
	return [NSArray arrayWithObjects:	[[PISDAdminBuilding alloc] init],
										[[PISDProsperHighSchool alloc] init],
										[[PISDReynoldsMiddleSchool alloc] init],
										nil];
}

@end







