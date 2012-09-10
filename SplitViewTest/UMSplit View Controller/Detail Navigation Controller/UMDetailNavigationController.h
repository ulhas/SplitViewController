/********************************************************************************************************************
 * Class            : UMDetailNavigationController
 * Abstract         : Navigation Controller for the Detail View Controller. Also, couple of delegate functions for the detail navigation controller.
 *********************************************************************************************************************/

#import <UIKit/UIKit.h>

@class UMDetailViewController, UMDetailNavigationController;

@protocol UMDetailNavigationControllerDelegate <NSObject>

- (void)detailViewController:(UMDetailViewController *)detailViewController presentModalViewController:(UIViewController *)viewController;
- (void)resetSplitViewControllerDetailNavigationViewController:(UMDetailNavigationController *)detailNavigationViewController;

@end

@interface UMDetailNavigationController : UINavigationController

@property (nonatomic, assign) id <UMDetailNavigationControllerDelegate> detailViewControllerDelegate;

@end
