//
//  CampusInfoViewController.m
//  PISD Locator
//
//  Created by Cole Hecht on 11/18/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "PISDCampusInfoViewController.h"
#import "PISDLocationHandler.h"
#import "PISDCampus.h"

@interface PISDCampusInfoViewController ()

@property (strong, nonatomic) PISDLocationHandler *locationHandler;

@end

@implementation PISDCampusInfoViewController
@synthesize locationHandler;

- (PISDLocationHandler *)locationHandler {
	return [[PISDLocationHandler alloc] init];
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
	return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *cellIdentifier = @"MyCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
	}
	
	cell.textLabel.text = [NSString stringWithFormat:@"Cell #%i", indexPath.row];
	
	return cell;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	int index = indexPath.row;
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selected" message:[NSString stringWithFormat:@"You selected row number %i", index] delegate:self cancelButtonTitle:@"alrighty" otherButtonTitles:nil, nil];
	[alert show];
	
	UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
	UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"CustomVC"];
	vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentViewController:vc animated:YES completion:NULL];
}


- (void)viewDidUnload {
	[self setNavigationBarTitle:nil];
	[super viewDidUnload];
}
@end
