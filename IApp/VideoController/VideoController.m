//
//  VideoController.m
//  IApp
//
//  Created by CodeAm on 2020/7/9.
//  Copyright © 2020年 codeam. All rights reserved.
//

#import "VideoController.h"
@interface VideoController()<UICollectionViewDelegate, UICollectionViewDataSource>

@end
@implementation VideoController
- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"video@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"video_selected@2x.png"];
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 用于设置每个cell的布局(不像UITableView那么死板)
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 2;
    flowLayout.minimumInteritemSpacing = 0;
    
    // collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor grayColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    // 注册Item class
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.view addSubview:collectionView];
}
#pragma mark - dataSource中的方法实现
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 改写UICollectionViewCell完成作业
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    // 添加UIView
    UIView *videoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (self.view.frame.size.width - 2) / 2, 200)];
    
    // 添加图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (self.view.frame.size.width - 2) / 2, 200)];
    imageView.image = [UIImage imageNamed:@"video@2x.png"];
    [videoView addSubview:imageView];
    
    // 添加UILabel
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 200, 50, 100)];
    leftLabel.text = @"作者: codeam";
    [leftLabel sizeToFit];
    leftLabel.textAlignment = NSTextAlignmentLeft;
    
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 60, 200, 50, 20)];
    rightLabel.text = @"刚刚";
    //[rightLabel sizeToFit];
    rightLabel.textAlignment = NSTextAlignmentRight;
    
    [cell.contentView addSubview:videoView];
    [cell addSubview:leftLabel];
    [cell addSubview:rightLabel];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.view.frame.size.width - 2)/2, 220);
}
@end
