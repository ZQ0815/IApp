//
//  FrequentUserController.m
//  IApp
//
//  Created by 张强 on 2020/10/26.
//  Copyright © 2020 codeam. All rights reserved.
//

#import "FrequentUserController.h"
#import "FrequentUserViewCell.h"

@interface FrequentUserController ()

@end

@implementation FrequentUserController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FrequentUserViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"frequentcell"];
    if (! cell) {
        cell = [[FrequentUserViewCell alloc] init];
        cell.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

# pragma mark - delegate
//@Option UITableViewDelegate中可选的常用方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

@end
