//
//  UMMasterViewController.m
//  CustomSplitView
//
//  Created by UlhasM on 19/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UMMasterViewController.h"

@implementation UMMasterViewController

@synthesize viewControllers = _viewControllers;
@synthesize selectedViewController = _selectedViewController;
@synthesize delegate = _delegate;
@synthesize defaultSelectedIndex ;

- (void)selectViewControllerAtIndex:(NSInteger)index
{
    if(index < self.viewControllers.count){
        self.selectedViewController = [self.viewControllers objectAtIndex:index];
    }
}

-(id)init
{
    if (self = [super init]) {
        self.defaultSelectedIndex = 0;
    }
    
    return self;
}

- (void)dealloc
{
    [_selectedViewController release], _selectedViewController = nil;
    [_viewControllers release], _viewControllers = nil;
    [super dealloc];
}

#pragma mark - View lifecycle


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	if(interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        return YES;
    
	return NO;
}

@end
