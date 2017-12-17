//
//  FKLoginRequest.h
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/11.
//  Copyright © 2017年 madao. All rights reserved.
//

#import "FKBaseRequest.h"

/* 大多时候Api只需要一种解析格式，所以此处跟着request走，其他情况下常量字符串建议跟着reformer走， */
// 登录token key
FOUNDATION_EXTERN NSString *FKLoginAccessTokenKey;
// 也可以写成 局部常量形式
static const NSString *FKLoginAccessTokenKey2 = @"accessToken";

@interface FKLoginRequest : FKBaseRequest

- (id)initWithUsr:(NSString *)usr pwd:(NSString *)pwd;

@end
