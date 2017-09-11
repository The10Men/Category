//
//  UINavigationController+HideBackTitle.m
//
//  Created by Pratik on 10/08/17.
//
//

#import "UINavigationController+HideBackTitle.h"
#import <objc/runtime.h>


@implementation UINavigationController (HideBackTitle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        PJSwizzleMethod([self class],
                        @selector(pushViewController:animated:),
                        @selector(pj_pushViewController:animated:));
    });
}

- (void)pj_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIViewController *disappearingViewController = self.viewControllers.lastObject;
    if (disappearingViewController) {
        disappearingViewController.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    }
    if (!disappearingViewController) {
        return [self pj_pushViewController:viewController animated:animated];
    }
    return [self pj_pushViewController:viewController animated:animated];
}



@end

void PJSwizzleMethod(Class cls, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(cls,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(cls,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
