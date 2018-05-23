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
    [self.vcTransitioningDelegate setupViewController:vc];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)presenttingVC6:(id)sender {
    LGViewController *vc = [[LGViewController alloc] init];
    [vc setModalPresentationStyle:UIModalPresentationCustom];
//    [vc setTransitioningDelegate:self.vcTransitioningDelegate];
    [self.vcTransitioningDelegate setupViewController:vc];
    
    [self presentViewController:vc animated:YES completion:nil];
}

@end
