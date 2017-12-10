//
//  FKLoginInputFooterView.m
//  FXXKBaseMVVM
//
//  Created by 梁宪松 on 2017/12/10.
//  Copyright © 2017年 madao. All rights reserved.
//

#import "FKLoginInputFooterView.h"

@implementation FKLoginInputFooterView

- (void)fk_createViewForView
{
    [self addSubview:self.loginBtn];
    [self addSubview:self.queryBtn];
}

#pragma mark - Layout
- (void)updateConstraints
{
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(8);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(40);
    }];
    
    [self.queryBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.loginBtn);
        make.size.mas_equalTo(self.loginBtn);
        make.top.mas_equalTo(self.loginBtn.mas_bottom).offset(10);
    }];
    
    [super updateConstraints];
}

#pragma mark - Getter
- (FKLoginButton *)loginBtn
{
    if (!_loginBtn) {
        
        _loginBtn = [[FKLoginButton alloc] initWithFrame:CGRectZero];
        _loginBtn.enabled = NO;
    }
    return _loginBtn;
}

- (UIButton *)queryBtn
{
    if (!_queryBtn) {
        
        _queryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_queryBtn setTitle:@"登录遇到问题？" forState:UIControlStateNormal];
        [_queryBtn setTitleColor:FKTHEMECOLOR forState:UIControlStateNormal];
        _queryBtn.titleLabel.font =  [UIFont systemFontOfSize:17];
    }
    return _queryBtn;
}

@end
