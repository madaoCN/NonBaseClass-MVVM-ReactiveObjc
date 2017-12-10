//
//  FKRouterConstant.h
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/9.
//  Copyright © 2017年 FKao. All rights reserved.
//

#import <Foundation/Foundation.h>

// 路由默认控制器参数名
FOUNDATION_EXTERN NSString *const FKControllerNameRouteParam;

#pragma mark - 路由模式 Schema
/**
 模式 Native：AppSchema://url/:param
 */

// 默认路由
FOUNDATION_EXTERN NSString *const FKDefaultRouteSchema;
// 网络跳转路由模式
FOUNDATION_EXTERN NSString *const FKHTTPRouteSchema;
FOUNDATION_EXTERN NSString *const FKHTTPsRouteSchema;
// WEB交互路由跳转模式
FOUNDATION_EXTERN NSString *const FKWebHandlerRouteSchema;
// 回调通信
FOUNDATION_EXTERN NSString *const FKComponentsCallBackHandlerRouteSchema;
// 未知路由
FOUNDATION_EXTERN NSString *const FKUnknownHandlerRouteSchema;


#pragma mark - 路由表

// 导航栏 Push
FOUNDATION_EXTERN NSString *const FKNavPushRoute;

// 导航栏 Present
FOUNDATION_EXTERN NSString *const FKNavPresentRoute;

// StoryBoard Push
FOUNDATION_EXTERN NSString *const FKNavStoryBoardPushRoute;

// 组件通信回调
FOUNDATION_EXTERN NSString *const FKComponentsCallBackRoute;
