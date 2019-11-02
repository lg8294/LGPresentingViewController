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
#import "LGModalStyle.h"
#import "LGModalTransitionStyle.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) LGViewControllerTransitioningDelegate *vcTransitioningDelegate;

@property (nonatomic) NSArray<NSArray *> *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initDatas];
    
    self.view.backgroundColor = [UIColor brownColor];
    self.vcTransitioningDelegate = [[LGViewControllerTransitioningDelegate alloc] init];
}

#pragma mark -
- (void)initDatas {
    // 在 iPhone 上 UIModalPresentationOverFullScreen，，UIModalPresentationOverCurrentContext 三个效果相同，主要体现在模态视图显示之后，presenting view 不会从 Window 上移除
    // UIModalPresentationCustom 类型， presented view 可以不是全屏，presenting view 不会从 Window 上移除
    NSMutableArray<LGModalStyle *> *pStyles = [@[] mutableCopy];
    NSArray *styles = @[@(UIModalPresentationAutomatic),
                        @(UIModalPresentationOverCurrentContext),
                        @(UIModalPresentationOverFullScreen),
                        @(UIModalPresentationCurrentContext),
                        @(UIModalPresentationFullScreen),
                        @(UIModalPresentationPageSheet),
                        @(UIModalPresentationCustom),
                        @(UIModalPresentationFormSheet),
                        @(UIModalPresentationPopover),
                        @(UIModalPresentationNone),
    ];
    for (NSNumber *value in styles) {
        LGModalStyle *item = [[LGModalStyle alloc] initWithStyle:(UIModalPresentationStyle)value.integerValue];
        [pStyles addObject:item];
    }
    
    NSMutableArray<LGModalTransitionStyle *> *transitionStyles = [@[] mutableCopy];
    NSArray *tStyles = @[@(UIModalTransitionStyleCoverVertical),
                         @(UIModalTransitionStyleFlipHorizontal),
                         @(UIModalTransitionStyleCrossDissolve),
                         @(UIModalTransitionStylePartialCurl),
    ];
    for (NSNumber *value in tStyles) {
        LGModalTransitionStyle *item = [[LGModalTransitionStyle alloc] initWithStyle:(UIModalTransitionStyle)value.integerValue];
        [transitionStyles addObject:item];
    }
    self.datas = @[[pStyles copy],
                   [transitionStyles copy]
                   ];
}


#pragma mark - handle
#pragma mark TransitionStyle
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
    
    @try {
        [self presentViewController:vc animated:YES completion:nil];
    } @catch (NSException *exception) {
        
    } @finally {
    
    }
}

#pragma mark PresentationStyle
- (void)presentingVCWithModalStyle:(LGModalStyle *)modelStyle {
    LGViewController *vc = [[LGViewController alloc] init];
    vc.view.backgroundColor = [UIColor colorWithWhite:0 alpha:.4];
    
    [vc setModalPresentationStyle:modelStyle.style];
    [self.vcTransitioningDelegate setupViewController:vc];
    
    @try {
        [self presentViewController:vc animated:YES completion:nil];
    } @catch (NSException *exception) {
        
    } @finally {
    
    }
}

- (void)presentingVCWithModalTransitionStyle:(LGModalTransitionStyle *)modelTransitionStyle {
    LGViewController *vc = [[LGViewController alloc] init];
    vc.view.backgroundColor = [UIColor colorWithWhite:0 alpha:.4];
    
    vc.modalTransitionStyle = modelTransitionStyle.style;
//    [self.vcTransitioningDelegate setupViewController:vc];
    
    @try {
        [self presentViewController:vc animated:YES completion:nil];
    } @catch (NSException *exception) {
        
    } @finally {
    
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datas.count;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas[section].count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"LGModalStyle";
            break;
        case 1:
            return @"LGModalTransitionStyle";
            break;
            
        default:
            break;
    }
    return @"";
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    id model = self.datas[indexPath.section][indexPath.row];
    
    if ([model isKindOfClass:LGModalStyle.class]) {
        cell.textLabel.text = ((LGModalStyle *)model).name;
    } else if ([model isKindOfClass:LGModalTransitionStyle.class]) {
        cell.textLabel.text = ((LGModalTransitionStyle *)model).name;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = self.datas[indexPath.section][indexPath.row];
    
    if ([model isKindOfClass:LGModalStyle.class]) {
        [self presentingVCWithModalStyle:model];
    } else if ([model isKindOfClass:LGModalTransitionStyle.class]) {
        [self presentingVCWithModalTransitionStyle:model];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
