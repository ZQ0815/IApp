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
    blueLayer.frame = CGRectMake(100, 88, 100.0f, 100.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor; //add it to our view
    [self.view.layer addSublayer:blueLayer];
}

@end
