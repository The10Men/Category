//
//  UINavigationController+HideBackTitle.h
//  Resena
//
//  Created by Pratik on 10/08/17.
//
//

#import <UIKit/UIKit.h>

@interface UINavigationController (HideBackTitle)
extern void PJSwizzleMethod(Class cls, SEL originalSelector, SEL swizzledSelector);

@end
