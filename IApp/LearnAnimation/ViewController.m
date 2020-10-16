//
//  ViewController.m
//  IApp
//
//  Created by CodeAm on 2020/10/15.
//  Copyright © 2020 codeam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //create sublayer
    self.view.backgroundColor = [UIColor whiteColor];
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(125, 388, 200.0f, 200.0f);
    UIImage *image = [UIImage imageNamed:@"p_5"];
    blueLayer.contents = (__bridge id)image.CGImage;
    blueLayer.contentsGravity = kCAGravityCenter;
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    blueLayer.masksToBounds = YES;
    [self.view.layer addSublayer:blueLayer];
}

@end
