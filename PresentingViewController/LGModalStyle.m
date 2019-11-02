//
//  LGModalStyle.m
//  PresentingViewController
//
//  Created by lg on 2019/10/27.
//  Copyright © 2019 Arrcen-LG. All rights reserved.
//

#import "LGModalStyle.h"

@implementation LGModalStyle

- (instancetype)initWithStyle:(UIModalPresentationStyle)style
{
    self = [super init];
    if (self) {
        _style = style;
    }
    return self;
}

- (NSString *)name {
    return stringWithStyle(self.style);
}

NSString * stringWithStyle(UIModalPresentationStyle style) {
    switch (style) {
        case UIModalPresentationNone:
            return @"UIModalPresentationNone";
            break;
        case UIModalPresentationPopover:
            return @"UIModalPresentationPopover";
            break;
        case UIModalPresentationFormSheet:
            return @"UIModalPresentationFormSheet";
            break;
        case UIModalPresentationCustom:
            return @"UIModalPresentationCustom";
            break;
        case UIModalPresentationAutomatic:
            return @"UIModalPresentationAutomatic";
            break;
        case UIModalPresentationPageSheet:
            return @"UIModalPresentationPageSheet";
            break;
        case UIModalPresentationFullScreen:
            return @"UIModalPresentationFullScreen";
            break;
        case UIModalPresentationCurrentContext:
            return @"UIModalPresentationCurrentContext";
            break;
        case UIModalPresentationOverFullScreen:
            return @"UIModalPresentationOverFullScreen";
            break;
        case UIModalPresentationOverCurrentContext:
            return @"UIModalPresentationOverCurrentContext";
            break;
        default:
            return @"Unknow";
            break;
    }
}
@end
