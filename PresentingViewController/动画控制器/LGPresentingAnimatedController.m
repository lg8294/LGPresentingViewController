//
//  LGPresentingAnimatedController.m
//  PresentingViewController
//
//  Created by Arrcen-LG on 2018/5/17.
//  Copyright © 2018年 Arrcen-LG. All rights reserved.
//

#import "LGPresentingAnimatedController.h"

@implementation LGPresentingAnimatedController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    if (toVC.modalPresentationStyle == UIModalPresentationCustom) {
        
        [[transitionContext containerView] addSubview:toView];
        [toView setTransform:CGAffineTransformMakeScale(0.1, 0.1)];
        toView.alpha = 0;
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            [toView setTransform:CGAffineTransformMakeScale(0.8, 0.8)];
            toView.alpha = 1;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        }];
        
    } else { // UIModalPresentationFullScreen
        // PresentationCustom 模式下，fromView 为 nil
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        
        [[transitionContext containerView] addSubview:toView];
        
        [toView setTransform:CGAffineTransformMakeScale(0.1, 0.1)];
        toView.alpha = 0;

        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            [toView setTransform:CGAffineTransformIdentity];
            toView.alpha = 1;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        }];
        

    }
    
}
@end

// 方式二
//        [UIView transitionFromView:fromView toView:toView duration:[self transitionDuration:transitionContext] options:UIViewAnimationOptionTransitionCurlUp completion:^(BOOL finished) {
//            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
//        }];
