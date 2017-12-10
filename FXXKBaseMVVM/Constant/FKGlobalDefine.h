//
//  FKUtilsDefine.h
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/9.
//  Copyright © 2017年 madao. All rights reserved.
//

#ifndef FKUtilsDefine_h
#define FKUtilsDefine_h

#pragma mark - 基础颜色

#define FKTHEMECOLOR  HEX_RGB(0x0177D7)

#pragma mark - 设备信息

#define SCREEN_WIDTH                ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT               ([UIScreen mainScreen].bounds.size.height)

#define NAV_WIDTH                   SCREEN_WIDTH
#define NAV_HEIGHT                  (44)

#define TAB_BAR_WIDTH               SCREEN_WIDTH
#define TAB_BAR_HEIGHT              (48)

#define STATUS_BAR_HEIGHT           (20)


#pragma mark - 版本检查

// 版本检查
#define IOS11_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"11.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS10_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"10.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS9_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"9.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS8_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS7_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS6_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"6.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS5_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"5.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS4_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"4.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS3_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"3.0" options:NSNumericSearch] != NSOrderedAscending )

#endif /* FKUtilsDefine_h */
