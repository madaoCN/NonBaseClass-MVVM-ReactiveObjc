//
//  FKLoginPwdInputTableViewCell.h
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/10.
//  Copyright © 2017年 madao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKLoginPwdInputTableViewCell : UITableViewCell <FKViewProtocol>

/**
 标题
 */
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

/**
 输入框
 */
@property (weak, nonatomic) IBOutlet UITextField *inputTextFiled;

/**
 操作按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *accessoryButton;

@end
