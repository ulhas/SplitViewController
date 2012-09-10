//
//  TestMasterViewController.h
//  SplitViewTest
//
//  Created by UlhasM on 10/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UMMasterViewController.h"

@interface TestMasterViewController : UMMasterViewController <UMMasterViewControllerProtocol, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
