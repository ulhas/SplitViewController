/********************************************************************************************************************
 * Class            : UMMasterViewController
 * Abstract         : Master View Controller, the left view controller, for the split view controller.
 *********************************************************************************************************************/

#import <UIKit/UIKit.h>
#import "UMDetailNavigationController.h"

@class UMMasterViewController;

@protocol UMMasterViewControllerProtocol <NSObject>

@optional

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//@Method           : resetMasterViewController
//@Abstract         : Resets the Master view to the default settings.
//@Param            : NA
//@Returntype       : void
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)resetMasterViewController;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//@Method           : initialiseUI
//@Abstract         : Initializes UI for Master View
//@Param            : NA
//@Returntype       : void
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)initialiseUI;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//@Method           : resetDetailViewController
//@Abstract         : Resets the Detail view to the default settings.
//@Param            : NA
//@Returntype       : void
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)resetDetailViewController;

@end

@protocol UMMasterViewControllerDelegate <NSObject>

- (void)masterViewController:(UMMasterViewController *)masterViewController didSelectDetailViewController:(UMDetailViewController *)detailViewController;
- (void)masterViewControllerResetButtonClicked:(UMMasterViewController *)masterViewController;
- (void)masterViewControllerBackButtonClicked:(UMMasterViewController *)masterViewController;
- (void)masterViewController:(UMMasterViewController *)masterViewController pushViewController:(UIViewController *)viewController;

@end

@interface UMMasterViewController : UIViewController

@property (nonatomic, retain) NSMutableArray *viewControllers;
@property (nonatomic, retain) UMDetailViewController *selectedViewController;

@property (nonatomic, assign) id <UMMasterViewControllerDelegate, UMDetailNavigationControllerDelegate> delegate;
- (void)selectViewControllerAtIndex:(NSInteger)index;
@property (nonatomic, assign) int defaultSelectedIndex;

@end
