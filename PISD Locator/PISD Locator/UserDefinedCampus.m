//
//  UserDefinedCampus.m
//  PISD Locator
//
//  Created by Cole Hecht on 12/8/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "UserDefinedCampus.h"

@implementation UserDefinedCampus
static Campus *_campus;

+ (Campus *)campus {
	return _campus;
}

+ (void)setCampus:(Campus*)campus {
	_campus = campus;
}

@end
