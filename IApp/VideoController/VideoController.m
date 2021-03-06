//
//  VideoController.m
//  IApp
//
//  Created by CodeAm on 2020/7/9.
//  Copyright © 2020年 codeam. All rights reserved.
//

#import "VideoController.h"
#import "GTVideoCoverView.h"

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
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 0;
    
    // collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    // 注册Item class
    [collectionView registerClass:[GTVideoCoverView class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.view addSubview:collectionView];
}
#pragma mark - dataSource中的方法实现
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 改写UICollectionViewCell完成作业
    GTVideoCoverView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    if ([cell isKindOfClass:[GTVideoCoverView class]]) {
        //方便讲解事例数据
        // http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4
        //cell = [[GTVideoCoverView alloc] initWithVideoCoverUrl:@"icon.png" videoUrl:@"/Users/zhangqiang/Movies/Videos/video_1.mp4"];
        [cell layoutWithVideoCoverUrl: @"fengmian.png" videoUrl:@"/Users/zhangqiang/Movies/Videos/video_1.mp4"];
    }
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.width / 16 * 9);
}
@end
