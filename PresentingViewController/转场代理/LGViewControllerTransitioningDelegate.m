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

@interface LGViewControllerTransitioningDelegate ()

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactiveController;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;

@end

@implementation LGViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    // 保存引用，以便后面使用
    self.interactiveController = [[UIPercentDrivenInteractiveTransition alloc] init];
    
    // 创建一个 pan 手势
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactiveController action:@selector(handleSwipeUpdate:)];
    self.panGesture.maximumNumberOfTouches = 1;
    
    // 添加手势到 container view.
    [presented.view addGestureRecognizer:self.panGesture];
    
    return [[LGPresentingAnimatedController alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [[LGDismissalAnimatedController alloc] init];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.interactiveController;
}

#pragma mark - handle
- (IBAction)handleSwipeUpdate:(UIPanGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        // 设置手势开始时的 translation
        [self.panGesture setTranslation:CGPointMake(0, 0) inView:self.panGesture.view];
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        // 获取当前的 translation
        CGPoint tanslation = [self.panGesture translationInView:self.panGesture.view];
        
        // 计算转换进度
        CGFloat percentage = fabs(tanslation.y / CGRectGetHeight(self.panGesture.view.bounds));
        
        // 使用计算的进度更新交互进度
        [self.interactiveController updateInteractiveTransition:percentage];
    } else if (sender.state >= UIGestureRecognizerStateEnded) {
        // 完成进度并且移除手势
        [self.interactiveController finishInteractiveTransition];
        [self.panGesture.view removeConstraint:self.panGesture];
    }
}
@end
