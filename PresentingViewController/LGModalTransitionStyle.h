//
//  LGModalTransitionStyle.h
//  PresentingViewController
//
//  Created by lg on 2019/11/2.
//  Copyright © 2019 Arrcen-LG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGModalTransitionStyle : NSObject

@property(nonatomic,readonly) NSString *name;
@property(nonatomic,readonly) UIModalTransitionStyle style;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithStyle:(UIModalTransitionStyle)style NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
