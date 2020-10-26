//
//  MineControllerViewController.m
//  IApp
//
//  Created by 张强 on 2020/7/25.
//  Copyright © 2020 codeam. All rights reserved.
//

#import "MineViewController.h"
#import "UserInfoViewCell.h"
#import "FrequentUserController.h"
#import "UserModel.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface MineViewController ()

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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.topItem.title = @"个人信息界面";
}

- (void)configSubView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
}

# pragma mark - dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserInfoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userinfocell"];
    if (! cell) {
        cell = [[UserInfoViewCell alloc] init];
        cell.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

# pragma mark - delegate
//@Option UITableViewDelegate中可选的常用方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FrequentUserController *frequentUserController = [FrequentUserController new];
    [self.navigationController pushViewController:frequentUserController animated:YES];
}

@end
