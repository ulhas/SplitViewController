//
//  UMSplitViewController.m
//  CustomSplitView
//
//  Created by UlhasM on 19/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UMSplitViewController.h"
#import "UMDetailViewController.h"
#import "UINavigationController+Transition.h"

@interface UMSplitViewController ()

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//@Method           : setupMasterViewController
//@Abstract         : Sets up the master view controller (Left View Controller) for the split view controller
//@Param            : NA
//@Returntype       : void
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setupMasterViewController;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//@Method           : setupDetailViewController
//@Abstract         : Sets up the detail view controller (Right View Controller) for the split view controllerSet
//@Param            : NA
//@Returntype       : void
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setupDetailViewController;

@end

@implementation UMSplitViewController

@synthesize masterViewController = _masterViewController;
@synthesize detailViewController = _detailViewController;

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
    [_masterViewController release], _masterViewController = nil;
    [_detailViewController release], _detailViewController = nil;
    [super dealloc];
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

-(void)viewWillAppear:(BOOL)animated{

    if([self.masterViewController respondsToSelector:@selector(initialiseUI)]){
        [self.masterViewController initialiseUI];
    }
    
    [super viewWillAppear:animated]; 
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupMasterViewController];
    [self setupDetailViewController];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.masterViewController resetMasterViewController];
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

#pragma mark - Frames for Master and Detail View

- (void)setupMasterViewController
{
    self.masterViewController.view.frame = CGRectMake(self.view.frame.origin.x, self.masterViewController.view.frame.origin.y, self.masterViewController.view.frame.size.width, self.masterViewController.view.frame.size.height);
    
    [self.view addSubview:self.masterViewController.view];
}

- (void)setupDetailViewController
{
    self.detailViewController.view.frame = NAVIGATION_CONTROLLER_FRAME;
    
    [self.view addSubview:self.detailViewController.view];
}

#pragma mark - Master View Controller Delegate

- (void)masterViewControllerResetButtonClicked:(UMMasterViewController *)masterViewController
{
    //reset code goes here
}

- (void)masterViewControllerBackButtonClicked:(UMMasterViewController *)masterViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)masterViewController:(UMMasterViewController *)masterViewController didSelectDetailViewController:(UMDetailViewController *)detailViewController
{
    [self.detailViewController.view removeFromSuperview];
    
    self.detailViewController = detailViewController;
    [self setupDetailViewController];
}

- (void)masterViewController:(UMMasterViewController *)masterViewController pushViewController:(UIViewController *)viewController
{
    [self.navigationController transitToViewController:viewController animated:YES];
}

#pragma mark - Detail View Navigation Controller Delegate

- (void)detailViewController:(UMDetailViewController *)detailViewController presentModalViewController:(UIViewController *)viewController
{
    [self presentModalViewController:viewController animated:YES];
}

- (void)resetSplitViewControllerDetailNavigationViewController:(UMDetailNavigationController *)detailNavigationViewController
{
    [self.masterViewController resetMasterViewController];
}

@end
