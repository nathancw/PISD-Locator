//
//  CampusInfoViewController.m
//  PISD Locator
//
//  Created by Cole Hecht on 11/18/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "CampusInfoViewController.h"

@interface CampusInfoViewController ()

@end

@implementation CampusInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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


@end
