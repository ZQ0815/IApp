//
//  MineControllerViewController.m
//  IApp
//
//  Created by 张强 on 2020/7/25.
//  Copyright © 2020 codeam. All rights reserved.
//

#import "MineViewController.h"
#import "SetNickNameViewController.h"
#import "UserModel.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface MineViewController ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *showInfoLabel;
@property (nonatomic, strong) UIButton *finishedButton;
@property (nonatomic, strong) UserModel *userModel;

@end

@implementation MineViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"page@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"page_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubView];
}

- (void)configSubView {
    _contentView = [[UIView alloc] initWithFrame:self.view.frame];
    _contentView.backgroundColor = [UIColor whiteColor];
    self.view = _contentView;
    
    CGRect viewRect = CGRectMake(50, 200, 20, 20);
    UIView *testView = [[UIView alloc] initWithFrame:viewRect];
    testView.layer.backgroundColor = [UIColor blueColor].CGColor;
    
    _showInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height, self.view.frame.size.width, 30)];
    _showInfoLabel.numberOfLines = 0;
    _showInfoLabel.font = [UIFont systemFontOfSize:10];
    _showInfoLabel.backgroundColor = [UIColor grayColor];
    _showInfoLabel.text = @"你还有2次修改昵称的机会";
    [_contentView addSubview:_showInfoLabel];
    
    _finishedButton = [[UIButton alloc] initWithFrame:CGRectMake(0, _showInfoLabel.frame.origin.y + 100, 50, 25)];
    _finishedButton.backgroundColor = [UIColor yellowColor];
    [_finishedButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_finishedButton setTitle:@"完成" forState:UIControlStateNormal];
    [_finishedButton addTarget:self action:@selector(didFinishedButton) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview:_finishedButton];
    
    [_contentView addSubview:testView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeNickName:) name:@"changeNameByNotification" object:nil];
}

- (void)didFinishedButton{
    SetNickNameViewController *setNickNameVC = [[SetNickNameViewController alloc] init];
    setNickNameVC.delegate = self;
    __weak typeof(self) wself = self;
    setNickNameVC.myblock = ^(NSString * name) {
        __strong typeof(wself) strongSelf = wself;
        strongSelf.showInfoLabel.text = name;
    };
    [self.navigationController pushViewController:setNickNameVC animated:YES];
}

- (void)changedController:(SetNickNameViewController *)setNickNameVC didInputed: (NSString *) string {
    self.showInfoLabel.text = string;
}

- (void)changeNickName:(NSNotification *)text {
    self.showInfoLabel.text = text.userInfo[@"changedName"];
}

@end
