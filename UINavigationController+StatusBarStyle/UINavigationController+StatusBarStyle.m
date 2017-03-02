//
//  UINavigationController+StatusBarStyle.m
//  The10Men
//
//  Created by Pratik on 03/03/17.
//  Copyright © 2017 The10Men. All rights reserved.
//

#import "UINavigationController+StatusBarStyle.h"

@implementation UINavigationController (StatusBarStyle)
BOOL isLight;

- (void)setDefaultStatusBar{
    isLight=NO;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)setLightStatusBar{
    isLight=YES;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    if (isLight) {
        return UIStatusBarStyleLightContent;
    }
    else{
        return UIStatusBarStyleDefault;
    }
}

@end
