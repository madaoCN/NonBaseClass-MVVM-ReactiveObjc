//
//  ViewController.m
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/11.
//  Copyright © 2017年 madao. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "SVProgressHUD+Helper.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *logoutBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fk_initialDefaultsForController
{
    
}

- (void)fk_configNavigationForController
{
    
}

- (void)fk_createViewForConctroller
{
    [self.view addSubview:self.logoutBtn];
    
    [_logoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
    }];
}

-(void)fk_bindViewModelForController
{
    [[self.logoutBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        [[NSUserDefaults standardUserDefaults] setObject:@(NO) forKey:@"isLogin"];
        [SVProgressHUD fk_dispalyMsgWithStatus:@"2秒后将退出登录"];
        [SVProgressHUD dismissWithDelay:2.0f completion:^{
            [[NSNotificationCenter defaultCenter] postNotificationName:FKLoginStateChangedNotificationKey object:nil];
        }];
    }];
}

#pragma mark - Getter
- (UIButton *)logoutBtn
{
    if (!_logoutBtn) {
        _logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        _logoutBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_logoutBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _logoutBtn;
}

@end
