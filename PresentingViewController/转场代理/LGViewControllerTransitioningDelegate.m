//
//  LGViewControllerTransitioningDelegate.m
//  PresentingViewController
//
//  Created by Arrcen-LG on 2018/5/17.
//  Copyright © 2018年 Arrcen-LG. All rights reserved.
//

#import "LGViewControllerTransitioningDelegate.h"
#import "LGPercentDrivenInteractiveTransition.h"
#import "LGPresentingAnimatedController.h"
#import "LGDismissalAnimatedController.h"

@implementation LGViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
//    return [[LGPushAnimatedTransitioning alloc] init];
    return [[LGPresentingAnimatedController alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[LGDismissalAnimatedController alloc] init];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator {
    return [[LGPercentDrivenInteractiveTransition alloc] init];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return [[LGPercentDrivenInteractiveTransition alloc] init];
}

@end
