//
//  LGDismissalAnimatedController.m
//  PresentingViewController
//
//  Created by Arrcen-LG on 2018/5/17.
//  Copyright © 2018年 Arrcen-LG. All rights reserved.
//

#import "LGDismissalAnimatedController.h"

@implementation LGDismissalAnimatedController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // PresentationCustom 模式下，toView 为 nil
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    if (fromVC.modalPresentationStyle == UIModalPresentationCustom) {
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            [fromView setTransform:CGAffineTransformMakeScale(0.1, 0.1)];
            fromView.alpha = 0;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        }];
    } else {
        [[transitionContext containerView] insertSubview:toView belowSubview:fromView];
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            [fromView setTransform:CGAffineTransformMakeScale(0.1, 0.1)];
            fromView.alpha = 0;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        }];
    }
    
}

@end
