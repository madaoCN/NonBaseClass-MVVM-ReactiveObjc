//
//  FKLoginInputFooterView.h
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/10.
//  Copyright © 2017年 madao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FKLoginButton.h"

@interface FKLoginInputFooterView : UITableViewHeaderFooterView<FKViewProtocol>

/**
 登录按钮
 */
@property (nonatomic, strong) FKLoginButton *loginBtn;

/**
 查询按钮
 */
@property (nonatomic, strong) UIButton *queryBtn;

@end
