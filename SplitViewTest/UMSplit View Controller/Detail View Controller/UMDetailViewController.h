/********************************************************************************************************************
 * Class            : UMDetailViewController
 * Abstract         : Detail View Controller, the right view controller, for the split view controller.
 *********************************************************************************************************************/

#import <UIKit/UIKit.h>

#define NAVIGATION_CONTROLLER_FRAME CGRectMake(284, 0, 740, 768)

@interface UMDetailViewController : UIViewController

@property (nonatomic, retain) NSString *titleForMasterTableView;
@property (nonatomic, retain) NSString *imageForMasterTableView;
@property (nonatomic, retain) NSString *highlightedImageForMasterTableView;

@end
