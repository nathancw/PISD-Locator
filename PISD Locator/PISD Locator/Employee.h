//
//  Employee.h
//  PISD Locator
//
//  Created by Cole Hecht on 11/18/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Campus.h"

@interface Employee : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *position;
@property (strong, nonatomic) id<Campus> campus;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *phoneNumberOrExtension;

@end
