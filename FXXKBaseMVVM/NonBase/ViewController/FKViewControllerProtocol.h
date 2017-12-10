//
//  FKViewControllerProtocol.h
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/9.
//  Copyright © 2017年 madao. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 为 ViewController 绑定方法协议
 */
@protocol FKViewControllerProtocol <NSObject>

#pragma mark - 方法绑定
@required
/// 初始化数据
- (void)fk_initialDefaultsForController;

/// 绑定 vm
- (void)fk_bindViewModelForController;

/// 创建视图
- (void)fk_createViewForConctroller;

/// 配置导航栏
- (void)fk_configNavigationForController;

@end
