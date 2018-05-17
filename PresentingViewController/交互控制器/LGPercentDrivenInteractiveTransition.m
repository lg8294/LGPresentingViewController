//
//  LGPercentDrivenInteractiveTransition.m
//  PresentingViewController
//
//  Created by Arrcen-LG on 2018/5/17.
//  Copyright © 2018年 Arrcen-LG. All rights reserved.
//

#import "LGPercentDrivenInteractiveTransition.h"

@interface LGPercentDrivenInteractiveTransition ()

@property (nonatomic, strong) id<UIViewControllerContextTransitioning> contextData;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;

@end

@implementation LGPercentDrivenInteractiveTransition

- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // Always call super first.
    [super startInteractiveTransition:transitionContext];
    
    // 保存引用，以便后面使用
    self.contextData = transitionContext;
    
    // 创建一个 pan 手势
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeUpdate:)];
    self.panGesture.maximumNumberOfTouches = 1;
    
    // 添加手势到 container view.
    UIView *container = [transitionContext containerView];
    [container addGestureRecognizer:self.panGesture];
}

#pragma mark - handle
- (IBAction)handleSwipeUpdate:(UIPanGestureRecognizer *)sender {
    
    UIView *container = [self.contextData containerView];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        // 设置手势开始时的 translation
        [self.panGesture setTranslation:CGPointMake(0, 0) inView:container];
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        // 获取当前的 translation
        CGPoint tanslation = [self.panGesture translationInView:container];
        
        // 计算转换进度
        CGFloat percentage = fabs(tanslation.y / CGRectGetHeight(container.bounds));
        
        // 使用计算的进度更新交互进度
        [self updateInteractiveTransition:percentage];
    } else if (sender.state >= UIGestureRecognizerStateEnded) {
        // 完成进度并且移除手势
        [self finishInteractiveTransition];
        [[self.contextData containerView] removeGestureRecognizer:self.panGesture];
    }
}
@end
