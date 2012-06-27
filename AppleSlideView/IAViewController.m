//
//  IAViewController.m
//  AppleSlideView
//
//  Created by Omar Abdelhafith on 6/23/12.
//  Copyright (c) 2012 Infusion Apps. All rights reserved.
//

#import "IAViewController.h"

@interface IAViewController ()

@end

@implementation IAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
