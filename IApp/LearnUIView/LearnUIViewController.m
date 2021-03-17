//
//  LearnUIViewController.m
//  IApp
//
//  Created by 张强 on 2021/3/16.
//  Copyright © 2021 codeam. All rights reserved.
//

#import "LearnUIViewController.h"
#import "BNRDrawView.h"

@interface LearnUIViewController ()

@property (nonatomic, strong) BNRDrawView *drawView;

@end

@implementation LearnUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = self.drawView;
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"viewWillAppear");
}

- (BNRDrawView *)drawView {
    if (!_drawView) {
        _drawView = [[BNRDrawView alloc] initWithFrame:self.view.bounds];
    }
    return _drawView;
}

@end
