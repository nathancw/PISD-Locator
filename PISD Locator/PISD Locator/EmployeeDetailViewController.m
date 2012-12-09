//
//  EmployeeDetailViewController.m
//  PISD Locator
//
//  Created by Cole Hecht on 12/8/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "EmployeeDetailViewController.h"
#import "Campus.h"
#import "LocationHandler.h"

@interface EmployeeDetailViewController ()

@property (strong, nonatomic) NSDictionary *info;

@property (strong, nonatomic) IBOutlet UINavigationItem *navigationBarTitle;
@property (strong, nonatomic) IBOutlet UILabel *campusText;
@property (strong, nonatomic) IBOutlet UILabel *positionText;
@property (strong, nonatomic) IBOutlet UILabel *phoneText;
@property (strong, nonatomic) IBOutlet UILabel *emailText;

@end

@implementation EmployeeDetailViewController
@synthesize info = _info;

- (id)initWithEmployeeInfo:(NSDictionary *)info
{
    self = [super initWithNibName:@"EmployeeDetailViewController" bundle:nil];
    if (self) {
		[self setInfo:info];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationBarTitle setTitle:[self.info objectForKey:[NSNumber numberWithInt:CampusEmployeeName]]];
	[self.campusText setText:[self.info objectForKey:[NSNumber numberWithInt:CampusEmployeeCampus]]];
	[self.positionText setText:[self.info objectForKey:[NSNumber numberWithInt:CampusEmployeePosition]]];
	[self.phoneText setText:[self.info objectForKey:[NSNumber numberWithInt:CampusEmployeePhoneExtension]]];
	[self.emailText setText:@"staff@prosper.edu"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
	[self setNavigationBarTitle:nil];
	[self setCampusText:nil];
	[self setPositionText:nil];
	[self setPhoneText:nil];
	[self setEmailText:nil];
	[super viewDidUnload];
}

- (IBAction)done:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}

@end






