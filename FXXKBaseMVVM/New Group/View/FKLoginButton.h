//
//  FKLoginButton.h
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/10.
//  Copyright © 2017年 madao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKLoginButton : UIButton <FKViewProtocol>

/**
 开始加载动画
 */
- (void)startLoadingAnimation;

/**
 结束加载动画
 */
- (void)stopLoadingAnimation;

@end
