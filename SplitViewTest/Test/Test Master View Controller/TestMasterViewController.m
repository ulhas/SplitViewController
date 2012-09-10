//
//  TestMasterViewController.m
//  SplitViewTest
//
//  Created by UlhasM on 10/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TestMasterViewController.h"
#import "UMDetailViewController.h"
#import "UMDetailNavigationController.h"

typedef enum {
    kFirst,
    kSecond,
    kThird,
    kInitial
} kDetailViewControllers;

#define NO_OF_SECTIONS 1
#define NO_OF_ROWS 3
#define DEFAULT_ROW 0
#define DEFAULT_SECTION 0

@interface TestMasterViewController ()

- (void)setupViewControllers:(kDetailViewControllers)kController;
- (void)setupDetailViewcontrollerForIndex:(kDetailViewControllers)index;

@end

@implementation TestMasterViewController

@synthesize tableView = _tableView;

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
    [_tableView release], _tableView = nil;
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViewControllers:kInitial];
    [self setupInitialSelectedController];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    self.tableView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - Table View Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return NO_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return NO_OF_ROWS;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"MasterCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    
    UMDetailNavigationController *_detailNavigationController = [self.viewControllers objectAtIndex:indexPath.row];

    cell.textLabel.text = _detailNavigationController.detailRootController.titleForMasterTableView;

    return cell;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.selectedViewController isEqual:[self.viewControllers objectAtIndex:indexPath.row]])
        return;
    
    [self resetDetailViewController];
    self.selectedViewController = [self.viewControllers objectAtIndex:indexPath.row];
    [self.delegate masterViewController:self didSelectDetailViewController:self.selectedViewController];
}

#pragma mark - Master View Controller Methods

- (void)setupInitialSelectedController
{
    NSIndexPath *_indexPath = [NSIndexPath indexPathForRow:DEFAULT_ROW inSection:DEFAULT_SECTION];
    
    [self.tableView selectRowAtIndexPath:_indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    self.selectedViewController = [self.viewControllers objectAtIndex:DEFAULT_ROW];
    
    [self.delegate masterViewController:self didSelectDetailViewController:self.selectedViewController];
}

- (void)setupViewControllers:(kDetailViewControllers)kController
{
    NSInteger _minimumLimit;
    NSInteger _maxmimumLimit;
    
    if (kInitial == kController) {
        _minimumLimit = kFirst;
        _maxmimumLimit = kThird;
    } else
        _minimumLimit = _maxmimumLimit = kController;
    
    for (int index = _minimumLimit; index <= _maxmimumLimit; index++) {
        [self setupDetailViewcontrollerForIndex:index];
    }
}

- (void)setupDetailViewcontrollerForIndex:(kDetailViewControllers)index
{
    UMDetailViewController *_detailViewController = [[UMDetailViewController alloc] init];
    _detailViewController.titleForMasterTableView = [NSString stringWithFormat:@"Detail View Controller %d", index];
    _detailViewController.imageForMasterTableView = nil;
    _detailViewController.highlightedImageForMasterTableView = nil;
    _detailViewController.title = [NSString stringWithFormat:@"Detail View Controller %d", index];
    
    UMDetailNavigationController *_navigationController = [[UMDetailNavigationController alloc] initWithRootViewController:_detailViewController];
    _navigationController.navigationBar.barStyle = UIBarStyleBlack;
    _navigationController.detailViewControllerDelegate = self.delegate;
    [_detailViewController release], _detailViewController = nil;
    
    [self.viewControllers insertObject:_navigationController atIndex:index];
    [_navigationController release], _navigationController = nil;
}

- (void)resetMasterViewController
{
    [self resetDetailViewController];
    [self setupInitialSelectedController];
}

- (void)resetDetailViewController
{
    NSInteger _indexOfObject = [self.viewControllers indexOfObject:self.selectedViewController];
    
    [self.viewControllers removeObjectAtIndex:_indexOfObject];
    [self setupViewControllers:(kDetailViewControllers)_indexOfObject];
}

@end
