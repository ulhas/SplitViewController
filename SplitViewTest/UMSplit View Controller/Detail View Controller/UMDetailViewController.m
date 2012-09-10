//
//  UMDetailViewController.m
//  CustomSplitView
//
//  Created by UlhasM on 20/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UMDetailViewController.h"
#import "UMDetailNavigationController.h"
#import "UMSplitViewController.h"

@interface UMDetailViewController ()

@end

@implementation UMDetailViewController

@synthesize titleForMasterTableView = _titleForMasterTableView;
@synthesize imageForMasterTableView = _imageForMasterTableView;
@synthesize highlightedImageForMasterTableView = _highlightedImageForMasterTableView;

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

- (void)dealloc
{
    [_titleForMasterTableView release], _titleForMasterTableView = nil;
    [_imageForMasterTableView release], _imageForMasterTableView = nil;
    [_highlightedImageForMasterTableView release], _highlightedImageForMasterTableView = nil;
    [super dealloc];
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.topItem.hidesBackButton = YES;
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.view.frame = NAVIGATION_CONTROLLER_FRAME;
}
@end
