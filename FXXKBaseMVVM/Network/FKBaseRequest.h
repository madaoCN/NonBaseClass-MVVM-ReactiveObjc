//
//  FKBaseRequest.h
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/9.
//  Copyright © 2017年 madao. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

// 获取服务器响应状态码 key
FOUNDATION_EXTERN NSString *const FK_BaseRequest_StatusCodeKey;
// 服务器响应数据成功状态码 value
FOUNDATION_EXTERN NSString *const FK_BaseRequest_DataValueKey;
// 获取服务器响应状态信息 key
FOUNDATION_EXTERN NSString *const FK_BaseRequest_StatusMsgKey;
// 获取服务器响应数据 key
FOUNDATION_EXTERN NSString *const FK_BaseRequest_DataKey;


@class FKBaseRequest;
@protocol FKBaseRequestFeformDelegate <NSObject>

/**
 自定义解析器解析响应参数

 @param request 当前请求
 @param jsonResponse 响应数据
 @return 自定reformat数据
 */
- (id)request:(FKBaseRequest *)request reformJSONResponse:(id)jsonResponse;

@end

@interface FKBaseRequest : YTKRequest

/**
 数据重塑代理
 */
@property (nonatomic, weak) id <FKBaseRequestFeformDelegate> reformDelegate;

#pragma mark - Override

/**
 自定义解析器解析响应参数
 
 @param jsonResponse json响应
 @return 解析后的json
 */
- (id)reformJSONResponse:(id)jsonResponse;

#pragma mark - Subclass Ovrride

/**
 添加额外的参数

 @return 额外参数
 */
- (id)extraRequestArgument;
@end
