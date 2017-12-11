//
//  FKLoginViewController.m
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/10.
//  Copyright © 2017年 madao. All rights reserved.
//

#import "FKLoginViewController.h"
#import "AppDelegate.h"
#import "FKLoginViewModel.h"
#import "FKLoginInputFooterView.h"
#import "FKLoginAccountInputTableViewCell.h"
#import "FKLoginPwdInputTableViewCell.h"

typedef NS_ENUM(NSInteger, kLoginInputType) {
    kLoginInputType_account = 0,//账户
    kLoginInputType_password = 1 //密码
};

@interface FKLoginViewController ()<UITableViewDelegate, UITableViewDataSource>

/**
 viewModel
 */
@property (nonatomic, strong) FKLoginViewModel *viewModel;

/**
 用户头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *userHeadImageView;

/**
 用户输入tableview
 */
@property (weak, nonatomic) IBOutlet UITableView *loginInputTableView;

/**
 tableheader
 */
@property (strong, nonatomic) IBOutlet UIView *tableHeaderView;

/**
 tableFooter
 */
@property (nonatomic, strong) FKLoginInputFooterView *tableFooterView;

@end

@implementation FKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fk_initialDefaultsForController
{
    [self setViewModel:[[FKLoginViewModel alloc] initWithParams:self.params]];

}

- (void)fk_configNavigationForController
{
    
}

- (void)fk_createViewForConctroller
{
    // config tableView
    _loginInputTableView.delegate = self;
    _loginInputTableView.dataSource = self;
    [_loginInputTableView setScrollEnabled:YES];
    
    // 注册cell
    [_loginInputTableView registerNib:[UINib nibWithNibName:NSStringFromClass(FKLoginAccountInputTableViewCell.class) bundle:nil] forCellReuseIdentifier:NSStringFromClass(FKLoginAccountInputTableViewCell.class)];
    [_loginInputTableView registerNib:[UINib nibWithNibName:NSStringFromClass(FKLoginPwdInputTableViewCell.class) bundle:nil] forCellReuseIdentifier:NSStringFromClass(FKLoginPwdInputTableViewCell.class)];
    
    // tableHeaderView
    _loginInputTableView.tableHeaderView = self.tableHeaderView;
    self.tableHeaderView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3);
    
    // tableFooterView
    _loginInputTableView.tableFooterView = self.tableFooterView;
}

-(void)fk_bindViewModelForController
{
    @weakify(self);

    // 是否可以登录
    RAC(self.tableFooterView.loginBtn, enabled) = RACObserve(self.viewModel, isLoginEnable);
    
    // 点击登录信号
    [[[self.tableFooterView.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] throttle:1.0f] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        
        [self.viewModel.loginCommand execute:nil];
        [self fk_hideKeyBoard];
    }];
    
    // 监听登录信号是否在执行
    [[self.viewModel.loginCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        @strongify(self);
        
        if (x.boolValue) {
            [self.tableFooterView.loginBtn startLoadingAnimation];
        }else
        {
            // 2秒后移除提示框
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.tableFooterView.loginBtn stopLoadingAnimation];
            });
        }
    }];
    
    // 登录命令监听
    [self.viewModel.loginCommand.executionSignals subscribeNext:^(RACSignal* signal) {
        
        [[signal dematerialize] subscribeNext:^(id  _Nullable x) {
            
            BOOL isLogin = [[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"];
            if(isLogin){
                [SVProgressHUD fk_displaySuccessWithStatus:@"登录成功"];
                
                // 2s后进入首页
                [SVProgressHUD dismissWithDelay:2.0f completion:^{
                    [[NSNotificationCenter defaultCenter] postNotificationName:FKLoginStateChangedNotificationKey object:nil];
                }];
            }else
            {
                [SVProgressHUD fk_displaySuccessWithStatus:@"登录失败"];
            }
        } error:^(NSError * _Nullable error) {
            
            [SVProgressHUD fk_displayErrorWithStatus:error.localizedDescription];
        }];
    }];
}

#pragma mark - Getter
- (FKLoginInputFooterView *)tableFooterView
{
    if (!_tableFooterView){
        _tableFooterView = [[FKLoginInputFooterView alloc] init];
        _tableFooterView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 110);
    }
    return _tableFooterView;
}

@end


#pragma mark - UITableViewDelegate
@implementation FKLoginViewController(UITableViewDelegate)

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.cellTitleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case kLoginInputType_account:
        {
            // 账户
            FKLoginAccountInputTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(FKLoginAccountInputTableViewCell.class)];
            
            [cell bindViewModel:self.viewModel withParams:nil];
            
            return cell;
        }
            break;
        case kLoginInputType_password:
        {
            // 密码
            FKLoginPwdInputTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(FKLoginPwdInputTableViewCell.class)];
            
            [cell bindViewModel:self.viewModel withParams:nil];
            
            return cell;
        }
            break;
        default:
            break;
    }
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"blankCell"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 65;
}

@end
