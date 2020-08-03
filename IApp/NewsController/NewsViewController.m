//
//  ViewController.m
//  IApp
//
//  Created by CodeAm on 2020/7/9.
//  Copyright © 2020年 codeam. All rights reserved.
//

#import "NewsViewController.h"
#import "View/NormalTableViewCell.h"
#import "Controller/DetailViewController.h"
#import "View/DeleteButtonDelegateView.h"
#import "Model/LIstLoad.h"
#import "Model/ListItem.h"

@interface NewsViewController ()<GTNormalTableViewCellDelegate>
@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong, readwrite) NSArray *dataArray;
@property (nonatomic, strong, readwrite) LIstLoad *listLoader;
@end

@implementation NewsViewController
# pragma mark - 声明周期方法
- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"page@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"page_selected@2x.png"];
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubView];
    [self modelDidLoad];
}

# pragma mark - initSubView
-(void)configSubView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

# pragma mark - dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger num = (unsigned long)_dataArray.count;
    return num;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (! cell) {
        cell = [[NormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }
    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}
# pragma mark - delegate
//@Option UITableViewDelegate中可选的常用方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //点击对应新闻后push一个请求指定网络URL的WebView
    ListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    DetailViewController * controller = [[DetailViewController alloc] initWithUrlString:item.articleUrl];
    [self.navigationController pushViewController:controller animated:YES];
}

# pragma mark - deleteButton delegate
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
    
}

# pragma mark - init model
- (void)modelDidLoad {
    //Initiated HTTP request get json data
    self.listLoader = [[LIstLoad alloc] init];
    __weak typeof(self)wself = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<ListItem *> * _Nonnull dataArray) {
        __strong typeof(wself) strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
}
@end
