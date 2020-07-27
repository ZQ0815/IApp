//
//  SetNickNameViewController.m
//  IApp
//
//  Created by 张强 on 2020/7/27.
//  Copyright © 2020 codeam. All rights reserved.
//

#import "SetNickNameViewController.h"

@interface SetNickNameViewController ()

@property (nonatomic, strong) UITextField *inputInfomation;

@end

@implementation SetNickNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.inputInfomation];
}

- (UITextField *)inputInfomation {
    if (!_inputInfomation) {
        _inputInfomation = [[UITextField alloc] init];
        _inputInfomation.frame = CGRectMake(0, 88.0, self.view.frame.size.width, 30);
        _inputInfomation.backgroundColor = [UIColor grayColor];
        _inputInfomation.borderStyle = UITextBorderStyleRoundedRect;
        _inputInfomation.placeholder = @"请输入您的昵称";
        _inputInfomation.textAlignment = NSTextAlignmentCenter;
        _inputInfomation.clearsOnBeginEditing = YES;
        _inputInfomation.returnKeyType = UIReturnKeyDone;
        _inputInfomation.delegate = self;
    }
    return _inputInfomation;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (self.delegate) {
        [self.delegate changedController:self didInputed:self.inputInfomation.text];
        [self.navigationController popViewControllerAnimated:YES];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    return YES;
}

@end
