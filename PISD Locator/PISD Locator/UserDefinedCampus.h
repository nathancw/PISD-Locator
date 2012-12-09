//
//  UserDefinedCampus.h
//  PISD Locator
//
//  Created by Cole Hecht on 12/8/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Campus.h"

@interface UserDefinedCampus : NSObject

+ (Campus *)campus;
+ (void)setCampus:(Campus*)campus;

@end
