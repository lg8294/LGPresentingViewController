//
//  LGModalTransitionStyle.m
//  PresentingViewController
//
//  Created by lg on 2019/11/2.
//  Copyright © 2019 Arrcen-LG. All rights reserved.
//

#import "LGModalTransitionStyle.h"

@implementation LGModalTransitionStyle

- (instancetype)initWithStyle:(UIModalTransitionStyle)style {
    self = [super init];
    if (self) {
        _style = style;
    }
    return self;
}

- (NSString *)name {
    switch (self.style) {
        case UIModalTransitionStylePartialCurl:
            return @"UIModalTransitionStylePartialCurl";
            break;
        case UIModalTransitionStyleCoverVertical:
            return @"UIModalTransitionStyleCoverVertical";
            break;
        case UIModalTransitionStyleCrossDissolve:
            return @"UIModalTransitionStyleCrossDissolve";
            break;
        case UIModalTransitionStyleFlipHorizontal:
            return @"UIModalTransitionStyleFlipHorizontal";
            break;
        default:
            return @"Unknow";
            break;
    }
}

@end
