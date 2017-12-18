//
//  SVProgressHUD+Helper.m
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/9.
//  Copyright © 2017年 fkao. All rights reserved.
//

#import "SVProgressHUD+Helper.h"

static const NSTimeInterval kMaxShowTime = 5.0f;

@implementation SVProgressHUD (Helper)
+ (void)initialize
{
    [SVProgressHUD setMaximumDismissTimeInterval:kMaxShowTime];
}

/// 显示不带文字的overflow
+ (void)fk_displayOverFlowActivityView
{
    //最多显示5s
    [self fk_displayOverFlowActivityView:kMaxShowTime];
}

+ (void)fk_displayOverFlowActivityView:(NSTimeInterval)maxShowTime
{
    [SVProgressHUD setMinimumDismissTimeInterval:maxShowTime];
    [SVProgressHUD show];
    [SVProgressHUD dismissWithDelay:maxShowTime];
}

/// 显示成功状态
+ (void)fk_displaySuccessWithStatus:(NSString *)status
{
    NSTimeInterval showTime = [SVProgressHUD _showTimeWithStatus:status];
    [SVProgressHUD setMinimumDismissTimeInterval:showTime];
    [SVProgressHUD showSuccessWithStatus:status];
}

/// 显示失败状态
+ (void)fk_displayErrorWithStatus:(NSString *)status
{
    NSTimeInterval showTime = [SVProgressHUD _showTimeWithStatus:status];
    [SVProgressHUD setMinimumDismissTimeInterval:showTime];
    [SVProgressHUD showErrorWithStatus:status];
}

/// 显示提示信息
+ (void)fk_dispalyInfoWithStatus:(NSString *)status
{
    NSTimeInterval showTime = [SVProgressHUD _showTimeWithStatus:status];
    [SVProgressHUD setMinimumDismissTimeInterval:showTime];
    [SVProgressHUD showInfoWithStatus:status];
}

/// 显示纯文本
+ (void)fk_dispalyMsgWithStatus:(NSString *)status
{
    //每个字0.3s, 最低3秒
    NSTimeInterval showTime = [SVProgressHUD _showTimeWithStatus:status];
    [SVProgressHUD setMinimumDismissTimeInterval:showTime];
    [SVProgressHUD showImage:nil status:status];
}

/// 显示加载圈 加文本
+ (void)fk_dispalyLoadingMsgWithStatus:(NSString *)status
{
    //每个字0.3s, 最低3秒
    NSTimeInterval showTime = [SVProgressHUD _showTimeWithStatus:status];
    [SVProgressHUD setMinimumDismissTimeInterval:showTime];
    [SVProgressHUD showImage:nil status:status];
}

/// 显示进度，带文本
+ (void)fk_dispalyProgress:(CGFloat)progress status:(NSString *)status
{
    [SVProgressHUD setMinimumDismissTimeInterval:kMaxShowTime];
    [SVProgressHUD showProgress:progress status:status];
}

/// 显示进度，不带文本
+ (void)fk_dispalyProgress:(CGFloat)progress
{
    [SVProgressHUD setMinimumDismissTimeInterval:kMaxShowTime];
    [SVProgressHUD showProgress:progress];
}

#pragma mark - private
+ (NSTimeInterval)_showTimeWithStatus:(NSString *)status
{
    if (!status) {
        return kMaxShowTime;
    }
    // 每个字 0.3s 最低三秒, 最高 kMaxShowTime
    return MIN(MAX(status.length * 0.3, 3.0f), kMaxShowTime);
}

@end
