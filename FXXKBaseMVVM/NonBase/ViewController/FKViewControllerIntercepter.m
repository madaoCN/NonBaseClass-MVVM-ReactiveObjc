//
//  FKViewControllerIntercepter.m
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/9.
//  Copyright © 2017年 madao. All rights reserved.
//

#import "FKViewControllerIntercepter.h"
#import "Aspects.h"

@implementation FKViewControllerIntercepter

+ (void)load
{
    [super load];
    
    [FKViewControllerIntercepter sharedInstance];
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static FKViewControllerIntercepter *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FKViewControllerIntercepter alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        /* 方法拦截 */
        
        // 拦截 viewDidLoad 方法
        [UIViewController aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo){
            
            
            [self _viewDidLoad:aspectInfo.instance];
        }  error:nil];
        
        // 拦截 viewWillAppear:
        [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated){
            
            [self _viewWillAppear:animated controller:aspectInfo.instance];
        } error:NULL];
    }
    return self;
}

#pragma mark - Hook Methods
- (void)_viewDidLoad:(UIViewController <FKViewControllerProtocol>*)controller
{
    
    if ([controller conformsToProtocol:@protocol(FKViewControllerProtocol)]) {
        // 只有遵守 FKViewControllerProtocol 的 viewController 才进行 配置
        controller.edgesForExtendedLayout = UIRectEdgeAll;
        controller.extendedLayoutIncludesOpaqueBars = NO;
        controller.automaticallyAdjustsScrollViewInsets = NO;
        
        // 背景色设置为白色
        controller.view.backgroundColor = [UIColor whiteColor];
        
        // 执行协议方法
        [controller fk_initialDefaultsForController];
        [controller fk_bindViewModelForController];
        [controller fk_configNavigationForController];
        [controller fk_createViewForConctroller];
    }
}

- (void)_viewWillAppear:(BOOL)animated controller:(UIViewController <FKViewControllerProtocol>*)controller
{
    
}


@end
