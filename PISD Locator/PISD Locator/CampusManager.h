//
//  Campuses.h
//  PISD Locator
//
//  Created by Cole Hecht on 10/21/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface CampusManager : NSObject

+ (NSArray *)arrayOfCampuses;
+ (NSUInteger)numberOfCampuses;

@end
