//
//  FKLoginRequest.m
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/11.
//  Copyright © 2017年 madao. All rights reserved.
//

#import "FKLoginRequest.h"

@implementation FKLoginRequest
{
    NSString *_usr;
    NSString *_pwd;
    
}

- (id)initWithUsr:(NSString *)usr pwd:(NSString *)pwd
{
    self = [super init];
    if (self) {
        _usr = usr;
        _pwd = pwd;
    }
    return self;
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodGET;
}

- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeHTTP;
}

- (BOOL)statusCodeValidator
{
    return YES;
}

- (NSString *)requestUrl {
    
    return @"";
}


- (id)requestArgument {
    
    return  @{
              @"username":_usr,
              @"password":_pwd,
              };
}

@end
