//
//  ViewController.m
//  PresentingViewController
//
//  Created by Arrcen-LG on 2018/5/17.
//  Copyright © 2018年 Arrcen-LG. All rights reserved.
//

#import "ViewController.h"
#import "LGViewController.h"
#import "LGViewControllerTransitioningDelegate.h"

@interface ViewController ()

@property (nonatomic, strong) LGViewControllerTransitioningDelegate *vcTransitioningDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor brownColor];
    self.vcTransitioningDelegate = [[LGViewControllerTransitioningDelegate alloc] init];
}


#pragma mark - handle
- (IBAction)presenttingVC1:(id)sender {
    LGViewController *vc = [[LGViewController alloc] init];
    [vc setModalInPopover:YES];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)presenttingVC2:(id)sender {
    LGViewController *vc = [[LGViewController alloc] init];
    [vc setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)presenttingVC3:(id)sender {
    LGViewController *vc = [[LGViewController alloc] init];
    [vc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)presenttingVC4:(id)sender {
    LGViewController *vc = [[LGViewController alloc] init];
    [vc setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)presenttingVC5:(id)sender {
    LGViewController *vc = [[LGViewController alloc] init];
    vc.view.backgroundColor = [UIColor colorWithWhite:0 alpha:.4];
    [self.vcTransitioningDelegate setupViewController:vc];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)presenttingVC6:(id)sender {
    LGViewController *vc = [[LGViewController alloc] init];
    vc.view.backgroundColor = [UIColor colorWithWhite:0 alpha:.4];
    [vc setModalPresentationStyle:UIModalPresentationCustom];
    // UIModalPresentationCustom 类型下，最终的 presented view 可以不是全屏
    [self.vcTransitioningDelegate setupViewController:vc];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)presenttingVC7:(id)sender {
    LGViewController *vc = [[LGViewController alloc] init];
    vc.view.backgroundColor = [UIColor colorWithWhite:0 alpha:.4];
    [vc setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    [self.vcTransitioningDelegate setupViewController:vc];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)presenttingVC8:(id)sender {
    LGViewController *vc = [[LGViewController alloc] init];
    vc.view.backgroundColor = [UIColor colorWithWhite:0 alpha:.4];
    [vc setModalPresentationStyle:UIModalPresentationOverFullScreen];
    // 在 iPhone 上 UIModalPresentationOverFullScreen，，UIModalPresentationOverCurrentContext 三个效果相同，主要体现在模态视图显示之后，presenting view 不会从 Window 上移除
    [self.vcTransitioningDelegate setupViewController:vc];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)presenttingVC9:(id)sender {
    LGViewController *vc = [[LGViewController alloc] init];
    vc.view.backgroundColor = [UIColor colorWithWhite:0 alpha:.4];
    [vc setModalPresentationStyle:UIModalPresentationPopover];

    [self.vcTransitioningDelegate setupViewController:vc];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)presenttingVC10:(id)sender {
//    LGViewController *vc = [[LGViewController alloc] init];
//    vc.view.backgroundColor = [UIColor colorWithWhite:0 alpha:.4];
//    [vc setModalPresentationStyle:UIModalPresentationBlurOverFullScreen];
//
//    [self.vcTransitioningDelegate setupViewController:vc];
//    
//    [self presentViewController:vc animated:YES completion:nil];
}

@end
