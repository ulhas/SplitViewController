/********************************************************************************************************************
 * Class            : UMSplitViewController
 * Abstract         : Sets up the Split View Controller. Also sets up the dimension for masterViewController and detailViewController
 *********************************************************************************************************************/

#import <UIKit/UIKit.h>
#import "UMMasterViewController.h"
#import "UMDetailNavigationController.h"

@interface UMSplitViewController : UIViewController <UMMasterViewControllerDelegate, UMDetailNavigationControllerDelegate>

@property (nonatomic, retain) UMMasterViewController <UMMasterViewControllerProtocol> *masterViewController;
@property (nonatomic, retain) UMDetailViewController *detailViewController;

@end
