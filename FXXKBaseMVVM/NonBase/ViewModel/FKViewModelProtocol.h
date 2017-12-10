//
//  FKViewModelProtocol.h
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/10.
//  Copyright © 2017年 madao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FKViewModelProtocol <NSObject>

@required

/**
 viewModel 初始化属性
 */
- (void)fk_initializeForViewModel;

@end
