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

@property(nonatomic, assign) NSInteger nums;
@property(nonatomic, copy) NSMutableArray *listData;

@end

@implementation FrequentUserController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str1 = @"1";
    NSString *str2 = @"1";
    NSString *str3 = @"1";
    self.listData = [[NSMutableArray alloc] initWithObjects:str1,str2,str3, nil];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.separatorColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FrequentUserViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"frequentcell"];
    if (!cell) {
        cell = [[FrequentUserViewCell alloc] init];
        cell.backgroundColor = [UIColor whiteColor];
    }
    [cell bindData:indexPath.row];
    cell.delegate = self;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

# pragma mark - delegate
//@Option UITableViewDelegate中可选的常用方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

# pragma mark - FrequentUserViewCellDelegate

- (void)manageFrequentUserViewCell:(FrequentUserViewCell *)cell deleteWithUserIndex:(NSInteger) index{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSMutableArray * indexPathArray = [NSMutableArray arrayWithObject:indexPath];
    [self.tableView beginUpdates];
    NSMutableArray *dataArray = [self.listData mutableCopy];
    [dataArray removeLastObject];
    self.listData = [dataArray mutableCopy];
    [self.tableView deleteRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationRight];
    [self.tableView endUpdates];
}

@end
