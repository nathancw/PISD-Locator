//
//  Campus.m
//  PISD Locator
//
//  Created by Cole Hecht on 11/18/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "Campus.h"
// Classes that subclss this one
#import "AdminBuilding.h"
#import "ProsperHighSchool.h"
#import "ReynoldsMiddleSchool.h"


@implementation Campus
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
	return [NSArray arrayWithObjects:	[[AdminBuilding alloc] init],
										[[ProsperHighSchool alloc] init],
										[[ReynoldsMiddleSchool alloc] init],
										nil];
}

@end







