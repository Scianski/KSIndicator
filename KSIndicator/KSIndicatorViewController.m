//
//  KSIndicatorViewController.m
//  KSIndicator
//
//  Created by Chris Smith on 17.03.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KSIndicatorViewController.h"

@interface KSIndicatorViewController ()

@end

@implementation KSIndicatorViewController

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
