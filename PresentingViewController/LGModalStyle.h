//
//  LGModalStyle.h
//  PresentingViewController
//
//  Created by lg on 2019/10/27.
//  Copyright © 2019 Arrcen-LG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGModalStyle : NSObject

@property(nonatomic,readonly) NSString *name;
@property(nonatomic,readonly) UIModalPresentationStyle style;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithStyle:(UIModalPresentationStyle)style NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
