//
//  CampusInfoViewController.m
//  PISD Locator
//
//  Created by Cole Hecht on 11/18/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "CampusInfoViewController.h"
#import "LocationHandler.h"
#import "Campus.h"
#import "ReynoldsMiddleSchool.h"
#import "EmployeeDetailViewController.h"

@interface CampusInfoViewController ()

@property (strong, nonatomic) LocationHandler *locationHandler;

@end

@implementation CampusInfoViewController
@synthesize locationHandler = _locationHandler;

- (LocationHandler *)locationHandler {
	return [[LocationHandler alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	if (self.locationHandler.isOnPISDCampus)
		// Set navigation bar title to the campus name
		[self.navigationBarTitle setTitle:self.locationHandler.campus.name];
	else
		// Set the nav. bar title to the generic "Prosper ISD"
		[self.navigationBarTitle setTitle:@"Prosper ISD"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.locationHandler.campus.staffDirectory.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *cellIdentifier = @"MyCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if (!cell)
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
	
	cell.textLabel.text = [[self.locationHandler.campus.staffDirectory objectAtIndex:indexPath.row]
						   objectForKey:[NSNumber numberWithInt:CampusEmployeeName]];
	cell.detailTextLabel.text = [[self.locationHandler.campus.staffDirectory objectAtIndex:indexPath.row]
								 objectForKey:[NSNumber numberWithInt:CampusEmployeeRoomNumber]];
	cell.detailTextLabel.textColor = [UIColor colorWithRed:4/255.f green:84/255.f blue:19/255.f alpha:1];
	
	return cell;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	EmployeeDetailViewController *detailVC = [[EmployeeDetailViewController alloc] initWithEmployeeInfo:
											  [self.locationHandler.campus.staffDirectory objectAtIndex:indexPath.row]];
	[self presentModalViewController:detailVC animated:YES];
	
}


- (void)viewDidUnload {
	[self setNavigationBarTitle:nil];
	[super viewDidUnload];
}

@end
