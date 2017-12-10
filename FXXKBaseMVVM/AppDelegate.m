//
//  AppDelegate.m
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/8.
//  Copyright © 2017年 madao. All rights reserved.
//

#import "AppDelegate.h"
#import <WebKit/WebKit.h>
#import <YTKNetwork.h>
#import "FKLoginViewController.h"

NSString *const FKLoginStateChangedNotificationKey = @"FKLoginStateChangedNotificationKey";


@interface AppDelegate ()

- (void)configSVProgressHUD;
- (void)configScrollViewAdapt4IOS11;
- (void)configNetworkApiEnv;
- (void)registerNavgationRouter;
- (void)registerSchemaRouter;

/**
 tabbar控制器
 */
@property (nonatomic, strong) UITabBarController *tabbarController;


/**
 登录控制器
 */
@property (nonatomic, strong) FKLoginViewController *loginController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 普通注册
    [self configSVProgressHUD];
    [self configScrollViewAdapt4IOS11];
    [self configNetworkApiEnv];
    
    // 路由注册
    [self registerNavgationRouter];
    [self registerSchemaRouter];

    // 配置根视图控制器
    [self setupRootController];
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    
    // 默认的路由 跳转等等
    if ([[url scheme] isEqualToString:FKDefaultRouteSchema]) {
        
        return [[JLRoutes globalRoutes] routeURL:url];
    }
    // http
    else if ([[url scheme] isEqualToString:FKHTTPRouteSchema])
    {
        return [[JLRoutes routesForScheme:FKHTTPRouteSchema] routeURL:url];
    }
    // https
    else if ([[url scheme] isEqualToString:FKHTTPsRouteSchema])
    {
        return [[JLRoutes routesForScheme:FKHTTPsRouteSchema] routeURL:url];
    }
    // Web交互请求
    else if ([[url scheme] isEqualToString:FKWebHandlerRouteSchema])
    {
        return [[JLRoutes routesForScheme:FKWebHandlerRouteSchema] routeURL:url];
    }
    // 请求回调
    else if ([[url scheme] isEqualToString:FKComponentsCallBackHandlerRouteSchema])
    {
        return [[JLRoutes routesForScheme:FKComponentsCallBackHandlerRouteSchema] routeURL:url];
    }
    // 未知请求
    else if ([[url scheme] isEqualToString:FKUnknownHandlerRouteSchema])
    {
        return [[JLRoutes routesForScheme:FKUnknownHandlerRouteSchema] routeURL:url];
    }
    return NO;
}

#pragma mark - Engine
/// 初始化根页面
- (void)setupRootController
{
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    //注册通知
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:FKLoginStateChangedNotificationKey object:nil] subscribeNext:^(NSNotification * _Nullable noti) {
        
        BOOL isLogin = [[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"];
        if (isLogin) {//已登录

            [self.window setRootViewController:self.tabbarController];
        }else//未登录
        {
            [self.window setRootViewController:self.loginController];
        }
    }];
    
    // 发送一次通知
    [[NSNotificationCenter defaultCenter] postNotificationName:FKLoginStateChangedNotificationKey object:nil];
    
    [self.window makeKeyAndVisible];
}

#pragma mark - Getter
- (UITabBarController *)tabbarController
{
    if (!_tabbarController) {
        
        _tabbarController = [[UITabBarController alloc] init];
        
    }
    return _tabbarController;
}

- (FKLoginViewController *)loginController
{
    if (!_loginController) {
        _loginController = [[FKLoginViewController alloc] init];
    }
    return _loginController;
}
@end

#pragma mark - 初始化 SVProgressHUD 配置
@implementation AppDelegate(SVProgressHUD)

- (void)configSVProgressHUD
{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5f]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setRingThickness:4];
    [SVProgressHUD setMinimumSize:CGSizeMake(80, 80)];
}

@end

#pragma mark - IOS11适配
@implementation AppDelegate(Adapt4IOS11)

- (void)configScrollViewAdapt4IOS11
{
    if (IOS11_OR_LATER) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        [UITableView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        [UIWebView appearance].scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        [WKWebView appearance].scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
        [UITableView appearance].estimatedRowHeight = 0;
        [UITableView appearance].estimatedSectionHeaderHeight = 0;
        [UITableView appearance].estimatedSectionFooterHeight = 0;
    }
}
@end

#pragma mark - YTKNetworking 接口地址配置
@implementation AppDelegate(NetworkApiEnv)

- (void)configNetworkApiEnv
{
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    if (DEBUG) {
        config.debugLogEnabled = YES;
    }else
    {
        config.debugLogEnabled = NO;
    }
    config.baseUrl = @"";
    config.cdnUrl = @"";
    
}
@end

#pragma mark - 路由注册
@implementation AppDelegate(RouterRegister)

#pragma mark - 普通的跳转路由注册
- (void)registerNavgationRouter
{
    // push
    // 路由 /com_madao_navPush/:viewController
    [[JLRoutes globalRoutes] addRoute:FKNavPushRoute handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self _handlerSceneWithPresent:NO parameters:parameters];
            
        });
        return YES;
    }];
    
    // present
    // 路由 /com_madao_navPresent/:viewController
    [[JLRoutes globalRoutes] addRoute:FKNavPresentRoute handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self _handlerSceneWithPresent:YES parameters:parameters];
            
        });
        return YES;
    }];
    
    // sb push
    // 路由 /com_madao_navStoryboardPush/:viewController
    [[JLRoutes globalRoutes] addRoute:FKNavStoryBoardPushRoute handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        return YES;
    }];
    
}

#pragma mark - Schema 匹配
- (void)registerSchemaRouter
{
    // HTTP注册
    [[JLRoutes routesForScheme:FKHTTPRouteSchema] addRoute:@"/somethingHTTP" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        return NO;
    }];
    
    // HTTPS注册
    [[JLRoutes routesForScheme:FKHTTPsRouteSchema] addRoute:@"/somethingHTTPs" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return NO;
        
    }];
    
    // 自定义 Schema注册
    [[JLRoutes routesForScheme:FKWebHandlerRouteSchema] addRoute:@"/somethingCustom" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return NO;
        
    }];
}

#pragma mark - Private
/// 处理跳转事件
- (void)_handlerSceneWithPresent:(BOOL)isPresent parameters:(NSDictionary *)parameters
{
    // 当前控制器
    NSString *controllerName = [parameters objectForKey:FKControllerNameRouteParam];
    UIViewController *currentVC = [self _currentViewController];
    UIViewController *toVC = [[NSClassFromString(controllerName) alloc] init];
    toVC.params = parameters;
    if (currentVC && currentVC.navigationController) {
        if (isPresent) {
            [currentVC.navigationController presentViewController:toVC animated:YES completion:nil];
        }else
        {
            [currentVC.navigationController pushViewController:toVC animated:YES];
        }
    }
}

/// 获取当前控制器
- (UIViewController *)_currentViewController{
    
    UIViewController * currVC = nil;
    UIViewController * Rootvc = self.window.rootViewController ;
    do {
        if ([Rootvc isKindOfClass:[UINavigationController class]]) {
            UINavigationController * nav = (UINavigationController *)Rootvc;
            UIViewController * v = [nav.viewControllers lastObject];
            currVC = v;
            Rootvc = v.presentedViewController;
            continue;
        }else if([Rootvc isKindOfClass:[UITabBarController class]]){
            UITabBarController * tabVC = (UITabBarController *)Rootvc;
            currVC = tabVC;
            Rootvc = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
            continue;
        }
    } while (Rootvc!=nil);
    
    return currVC;
}

@end
