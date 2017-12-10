//
//  FKViewProtocol.h
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/10.
//  Copyright © 2017年 madao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FKViewProtocol <NSObject>

/**
 为视图绑定 viewModel
 
 @param viewModel 要绑定的ViewModel
 @param params 额外参数
 */
- (void)bindViewModel:(id <FKViewProtocol>)viewModel withParams:(NSDictionary *)params;

@required

/**
 初始化额外数据
 */
- (void)fk_initializeForView;

/**
 初始化视图
 */
- (void)fk_createViewForView;

@end
