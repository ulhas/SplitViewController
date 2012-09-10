//
//  UMDetailNavigationController.m
//  POS 2
//
//  Created by UlhasM on 25/12/11.
//  Copyright (c) 2011 hkh. All rights reserved.
//

#import "UMDetailNavigationController.h"
#import "UMDetailViewController.h"

#define ROOT_VIEW_CONTROLLER_INDEX 0

@interface UMDetailNavigationController ()

@end

@implementation UMDetailNavigationController

@synthesize detailViewControllerDelegate = _detailViewControllerDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	if(interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        return YES;
    
	return NO;
}

- (UMDetailViewController *)detailRootController
{
    @try {
        return (UMDetailViewController *)[self.viewControllers objectAtIndex:ROOT_VIEW_CONTROLLER_INDEX];
    }
    @catch (NSException *exception) {
        NSLog(@"No Root View Controller");
    }
    return nil;
}

@end
