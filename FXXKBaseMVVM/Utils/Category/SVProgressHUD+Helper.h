//
//  SVProgressHUD+Helper.h
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/9.
//  Copyright © 2017年 fkao. All rights reserved.
//

#import <SVProgressHUD/SVProgressHUD.h>

@interface SVProgressHUD (Helper)

/// 显示不带文字的overflow
+ (void)fk_displayOverFlowActivityView;
+ (void)fk_displayOverFlowActivityView:(NSTimeInterval)maxShowTime;

/// 显示成功状态
+ (void)fk_displaySuccessWithStatus:(NSString *)status;

/// 显示失败状态
+ (void)fk_displayErrorWithStatus:(NSString *)status;

/// 显示提示信息
+ (void)fk_dispalyInfoWithStatus:(NSString *)status;

/// 显示提示信息
+ (void)fk_dispalyMsgWithStatus:(NSString *)status;

/// 显示加载圈 加文本
+ (void)fk_dispalyLoadingMsgWithStatus:(NSString *)status;

/// 显示进度，带文本
+ (void)fk_dispalyProgress:(CGFloat)progress status:(NSString *)status;

/// 显示进度，不带文本
+ (void)fk_dispalyProgress:(CGFloat)progress;


@end
