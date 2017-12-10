//
//  FKViewModelIntercepter.m
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/10.
//  Copyright © 2017年 madao. All rights reserved.
//

#import "FKViewModelIntercepter.h"
#import "NSObject+NonBase.h"
#import "FKViewModelProtocol.h"
#import "Aspects.h"

@implementation FKViewModelIntercepter

+ (void)load
{
    [super load];
    [FKViewModelIntercepter sharedInstance];
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static FKViewModelIntercepter *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FKViewModelIntercepter alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        /* 方法拦截 */
        
        [NSObject aspect_hookSelector:@selector(initWithParams:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo, NSDictionary *param){
            
            [self _initWithInstance:aspectInfo.instance params:param];
        } error:nil];
    }
    return self;
}

#pragma mark - Hook Methods
- (void)_initWithInstance:(NSObject <FKViewModelProtocol> *)viewModel
{
    if ([viewModel respondsToSelector:@selector(fk_initializeForViewModel)]) {
        [viewModel fk_initializeForViewModel];
    }
}

- (void)_initWithInstance:(NSObject <FKViewModelProtocol> *)viewModel params:(NSDictionary *)param
{
    if ([viewModel respondsToSelector:@selector(fk_initializeForViewModel)]) {
        [viewModel fk_initializeForViewModel];
    }
}

@end
