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

@interface CampusInfoViewController ()

@property (strong, nonatomic) LocationHandler *locationHandler;

@end

@implementation CampusInfoViewController
@synthesize locationHandler;

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
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
	
	cell.textLabel.text = [locationHandler.campus.staffDirectory objectAtIndex:indexPath.row];
	
	return cell;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	int index = indexPath.row;
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selected" message:[NSString stringWithFormat:@"You selected row number %i", index] delegate:self cancelButtonTitle:@"alrighty" otherButtonTitles:nil, nil];
	[alert show];
	/*
	UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
	UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"CustomVC"];
	vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentViewController:vc animated:YES completion:NULL];
	 */
}


- (void)viewDidUnload {
	[self setNavigationBarTitle:nil];
	[super viewDidUnload];
}

@end
