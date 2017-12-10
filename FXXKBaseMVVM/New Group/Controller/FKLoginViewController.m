//
//  FKLoginViewController.m
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/10.
//  Copyright © 2017年 madao. All rights reserved.
//

#import "FKLoginViewController.h"
#import "FKLoginInputFooterView.h"

typedef NS_ENUM(NSInteger, kLoginInputType) {
    kLoginInputType_account = 0,//账户
    kLoginInputType_password = 1 //密码
};

@interface FKLoginViewController ()<UITableViewDelegate, UITableViewDataSource>

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
    
}

- (void)fk_configNavigationForController
{
    
}

- (void)fk_createViewForConctroller
{
    // config tableView
//    _loginInputTableView.delegate = self;
//    _loginInputTableView.dataSource = self;
    [_loginInputTableView setScrollEnabled:YES];
    
    // 注册cell
//    [_loginInputTableView registerNib:[UINib nibWithNibName:NSStringFromClass([XZWLoginAccountInputTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([XZWLoginAccountInputTableViewCell class])];
//    [_loginInputTableView registerNib:[UINib nibWithNibName:NSStringFromClass([XZWLoginPwdInputTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([XZWLoginPwdInputTableViewCell class])];
    
    // tableHeaderView
    _loginInputTableView.tableHeaderView = self.tableHeaderView;
    self.tableHeaderView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3);
    
    // tableFooterView
    _loginInputTableView.tableFooterView = self.tableFooterView;
}

-(void)fk_bindViewModelForController
{
    
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
