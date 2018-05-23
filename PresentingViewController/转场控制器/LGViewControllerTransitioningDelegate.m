//
//  LGViewControllerTransitioningDelegate.m
//  PresentingViewController
//
//  Created by Arrcen-LG on 2018/5/17.
//  Copyright © 2018年 Arrcen-LG. All rights reserved.
//

#import "LGViewControllerTransitioningDelegate.h"
#import "LGPresentingAnimatedController.h"
#import "LGDismissalAnimatedController.h"

@interface LGViewControllerTransitioningDelegate () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIViewController *viewController;

@property (nonatomic, strong) UIPanGestureRecognizer *gestureRecognizer;

@property (nonatomic, strong) LGPresentingAnimatedController *presentAnimated;
@property (nonatomic, strong) LGDismissalAnimatedController *dismissalAnimated;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactiveController;
@property (nonatomic, assign) BOOL interactiveEnable;

@end

@implementation LGViewControllerTransitioningDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        _presentAnimated = [[LGPresentingAnimatedController alloc] init];
        _dismissalAnimated = [[LGDismissalAnimatedController alloc] init];
        _interactiveController = [[UIPercentDrivenInteractiveTransition alloc] init];
        _interactiveEnable = NO;
    }
    return self;
}

- (UIPanGestureRecognizer *)gestureRecognizer {
    if (!_gestureRecognizer) {
        _gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
        _gestureRecognizer.delegate = self;
    }
    return _gestureRecognizer;
}

#pragma mark - public

- (void)setupViewController:(UIViewController *)viewController {
    self.viewController = viewController;
    
    viewController.transitioningDelegate = self;
    [viewController.view addGestureRecognizer:self.gestureRecognizer];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return self.presentAnimated;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return self.dismissalAnimated;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    if (!self.interactiveEnable) {
        return nil;
    }
    
    if (self.gestureRecognizer.state == UIGestureRecognizerStatePossible) {
        return nil;
    }
    
    return self.interactiveController;
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewController.presentingViewController == nil) {
        return NO;
    }
    
    return YES;
}

#pragma mark - handle
- (IBAction)handleGesture:(UIPanGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        self.interactiveEnable = YES;
        [self.viewController dismissViewControllerAnimated:YES completion:nil];
        
        // 设置手势开始时的 translation
//        [sender setTranslation:CGPointMake(0, 0) inView:sender.view];
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        // 获取当前的 translation
        CGPoint tanslation = [sender translationInView:sender.view];
        NSLog(@"%@", NSStringFromCGPoint(tanslation));
        
        // 计算转换进度
        CGFloat percentage = fabs(tanslation.y / CGRectGetHeight(sender.view.bounds));
        NSLog(@"%f", CGRectGetHeight(sender.view.bounds));
        NSLog(@"%f", percentage);
        
        // 使用计算的进度更新交互进度
        [self.interactiveController updateInteractiveTransition:percentage];
        
    } else if (sender.state >= UIGestureRecognizerStateEnded) {
        
        // 完成进度并且移除手势
        if (self.interactiveController.percentComplete > 0.5) {
            [self.interactiveController finishInteractiveTransition];
        } else {
            [self.interactiveController cancelInteractiveTransition];
        }
        self.interactiveEnable = NO;
    }
}
@end
