//
//  UINavigationController+Transition.m
//  POS 2
//
//  Created by UlhasM on 09/01/12.
//  Copyright (c) 2012 hkh. All rights reserved.
//

#import "UINavigationController+Transition.h"

@implementation UINavigationController (Transition)

- (void)transitToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSPredicate *_predicate = [NSPredicate predicateWithFormat:@"class == %@", [viewController class]];
    NSArray *_filteredViewControllers = [self.viewControllers filteredArrayUsingPredicate:_predicate];
    
    UIViewController *_viewController = nil;
    
    if (_filteredViewControllers.count > 0)
        _viewController = [_filteredViewControllers objectAtIndex:0];
    
    if (!_viewController)
        [self pushViewController:viewController animated:animated];
    else
        [self popToViewController:_viewController animated:animated];
}

@end
