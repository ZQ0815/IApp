//
//  UIViewAnimationControllerViewController.m
//  IApp
//
//  Created by 张强 on 2020/10/20.
//  Copyright © 2020 codeam. All rights reserved.
//

#import "UIViewAnimationController.h"
#import "Masonry.h"

@interface UIViewAnimationController ()

@property (nonatomic, strong) UIView *myView;
@property (nonatomic, strong) UITextField *userNameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation UIViewAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view. 50 10 50 10 50
    [self setupSubView];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.userNameTextField setCenter:CGPointMake(self.userNameTextField.center.x - self.view.bounds.size.width, self.userNameTextField.center.y)];
}

- (void)viewDidAppear:(BOOL)animated {
    [UIView animateWithDuration:2 animations:^{
            [self.userNameTextField setCenter:CGPointMake(self.userNameTextField.center.x + self.view.bounds.size.width, self.userNameTextField.center.y)];
        } completion:^(BOOL finished) {
            [self.userNameTextField setCenter:CGPointMake(self.userNameTextField.center.x - self.view.bounds.size.width, self.userNameTextField.center.y)];
    }];
}


- (void)setupSubView {
    _myView = [UIView new];
    _myView.frame = self.view.frame;
    _myView.backgroundColor = [UIColor grayColor];
    self.view = _myView;
    
    _userNameTextField = [UITextField new];
    _userNameTextField.backgroundColor = [UIColor whiteColor];
    [_myView addSubview: _userNameTextField];
    [_userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 50));
        make.centerY.mas_equalTo(_myView.mas_centerY).with.offset(-60);
        make.centerX.mas_equalTo(_myView.mas_centerX);
    }];
    
    _passwordTextField = [UITextField new];
    _passwordTextField.backgroundColor = [UIColor whiteColor];
    [_myView addSubview:_passwordTextField];
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 50));
        make.centerY.mas_equalTo(_myView.mas_centerY);
        make.centerX.mas_equalTo(_myView.mas_centerX);
    }];
    
    _loginButton = [UIButton new];
    _loginButton.backgroundColor = [UIColor greenColor];
    [_loginButton setTitle:@"Log In" forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_myView addSubview:_loginButton];
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 40));
        make.centerY.mas_equalTo(_myView.mas_centerY).with.offset(60);
        make.centerX.mas_equalTo(_myView.mas_centerX);
    }];
}

@end
