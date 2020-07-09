//
//  RecommendViewController.m
//  IApp
//
//  Created by CodeAm on 2020/7/9.
//  Copyright © 2020年 codeam. All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController()

@end

@implementation RecommendViewController
- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"like_selected@2x.png"];
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    
    NSArray *colorArray = @[[UIColor redColor],[UIColor yellowColor],[UIColor blueColor],[UIColor greenColor],[UIColor blackColor]];
    for (int i=0; i < 5; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
        view.backgroundColor = [colorArray objectAtIndex:i];
        [scrollView addSubview:view];
    }
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
}
@end
