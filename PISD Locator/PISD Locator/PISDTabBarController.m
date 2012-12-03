//
//  PISDTabBarController.m
//  PISD Locator
//
//  Created by Cole Hecht on 12/1/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "PISDTabBarController.h"

@interface PISDTabBarController ()

@end

@implementation PISDTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	UIColor *bgColor = [UIColor colorWithRed:4/255.f green:84/255.f blue:19/255.f alpha:1];
	[self.tabBar setTintColor:bgColor]; // Set BG color
	
	
	// Title font
	[[UITabBarItem appearance] setTitleTextAttributes:@{ UITextAttributeFont : [UIFont fontWithName:@"Copperplate" size:14] }
											 forState:UIControlStateNormal];
	// Title color
	[[UITabBarItem appearance] setTitleTextAttributes:@{ UITextAttributeTextColor : [UIColor blackColor] }
											 forState:UIControlStateNormal];
	// Sets the color of the selected icon's image to black (ONLY THE SELECTED ONE!)
	[[UITabBar appearance] setSelectedImageTintColor:[UIColor blackColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
