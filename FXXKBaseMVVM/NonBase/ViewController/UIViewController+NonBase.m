//
//  ViewController+NonBase.m
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/9.
//  Copyright © 2017年 madao. All rights reserved.
//

#import "UIViewController+NonBase.h"
#import <objc/runtime.h>

static const void *kParamsKey = &kParamsKey;
static const void *kViewModelKey = &kViewModelKey;

@implementation UIViewController (NonBase)

#pragma mark - Getter Setter
- (void)setParams:(NSDictionary *)params
{
    objc_setAssociatedObject(self, kParamsKey, params, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSDictionary *)params
{
    return objc_getAssociatedObject(self, kParamsKey);
}

- (void)setViewModel:(id<FKViewControllerProtocol>)viewModel
{
    objc_setAssociatedObject(self, kViewModelKey, viewModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id<FKViewControllerProtocol>)viewModel
{
    return objc_getAssociatedObject(self, kViewModelKey);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    // 点击隐藏键盘
    [self fk_hideKeyBoard];
}

#pragma mark - 通用类

- (CGRect)fk_visibleBoundsShowNav:(BOOL)hasNav showTabBar:(BOOL)hasTabBar
{
    CGRect frame = [[UIScreen mainScreen] bounds];
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        frame = CGRectMake(0, 0, frame.size.height, frame.size.width);
    }
    else if (UIInterfaceOrientationIsPortrait(orientation))
    {
        frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    }
    
    if (IOS7_OR_LATER)
    {
        //frame is full screen
        
        frame.size.height -= STATUS_BAR_HEIGHT;
        frame.origin.y += STATUS_BAR_HEIGHT;
        if (hasNav) {
            frame.size.height -= NAV_HEIGHT;
            frame.origin.y += NAV_HEIGHT;
        }
        if (hasTabBar) {
            frame.size.height -= TAB_BAR_HEIGHT;
        }
    }
    else
    {
        frame.size.height -= STATUS_BAR_HEIGHT;
        if (hasNav) {
            frame.size.height -= NAV_HEIGHT;
        }
        if (hasTabBar) {
            frame.size.height -= TAB_BAR_HEIGHT;
        }
    }
    
    return frame;
}

- (void)fk_hideKeyBoard
{
    // 遍历所有子视图
    [self _traverseAllSubviewsToResignFirstResponder:self.view];
}

//遍历父视图的所有子视图，包括嵌套的子视图
-(void)_traverseAllSubviewsToResignFirstResponder:(UIView *)view {
    for (UIView *subView in view.subviews) {
        if (subView.subviews.count) {
            [self _traverseAllSubviewsToResignFirstResponder:subView];
        }
        
        [subView resignFirstResponder];
    }
}


@end
