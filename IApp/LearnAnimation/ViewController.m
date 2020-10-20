//
//  ViewController.m
//  IApp
//
//  Created by CodeAm on 2020/10/15.
//  Copyright © 2020 codeam. All rights reserved.
//

#import "ViewController.h"
#import "UIViewAnimationController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *layerView;
@property (nonatomic, strong) CALayer *myLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //create sublayer
    _layerView = [[UIView alloc] initWithFrame:self.view.frame];
    _layerView.backgroundColor = [UIColor grayColor];
    
    [self addNewViewController];
    //[self learnTranform];
    //[self learnTranformPerspective];
    //[self setupCombinationPicture];
    //[self learnContentsCenter];
    //[self learnShadow];
    //[self learnMask];
    //[self learnGroupAlpha];
    //[self learnTranformTransaction];
    //[self learnPresent];
    //self.view = _layerView;
}

- (void)addNewViewController {
    UIViewAnimationController *newVC = [[UIViewAnimationController alloc] init];
    //[self presentViewController:newVC animated:YES completion:nil];
    [self.navigationController pushViewController:newVC animated:YES];
}

- (void)learnPresent {
    self.view.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.myLayer = [CALayer layer];
    self.myLayer.frame = CGRectMake(0, 0, 100, 100);
    self.myLayer.position = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    self.myLayer.backgroundColor = [UIColor whiteColor].CGColor;
    [self.view.layer addSublayer:self.myLayer];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the touch point
    CGPoint point = [[touches anyObject] locationInView:self.view];
    //check if we've tapped the moving layer
    if ([self.myLayer.presentationLayer hitTest:point]) {
        //randomize the layer background color
        CGFloat red = arc4random() / (CGFloat)INT_MAX;
        CGFloat green = arc4random() / (CGFloat)INT_MAX;
        CGFloat blue = arc4random() / (CGFloat)INT_MAX;
        self.myLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    } else {
        //otherwise (slowly) move the layer to new position
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0];
        self.myLayer.position = point;
        [CATransaction commit];
    }
}

- (void)learnTranform {
    //create a new transform
    CGAffineTransform transform = CGAffineTransformIdentity;
    //scale by 50%
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    //rotate by 30 degrees
    transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30.0);
    //translate by 200 points
    transform = CGAffineTransformTranslate(transform, 200, 0);
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.0f, 100, 100.0f, 100.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [_layerView.layer addSublayer:blueLayer];
    blueLayer.affineTransform = transform;
}

- (void)learnTranformPerspective {
    //create a new transform
    CATransform3D transform = CATransform3DIdentity;
    //apply perspective
    transform.m34 = - 1.0 / 10000;
    //rotate by 45 degrees along the Y axis
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.0f, 100, 100.0f, 100.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueLayer.transform = transform;
    [_layerView.layer addSublayer:blueLayer];
}

- (void)learnTranformTransaction {
    CGRect layerFram = CGRectMake(50.0f, 100, 100.0f, 100.0f);
    _myLayer = [CALayer layer];
    _myLayer.frame = layerFram;
    _myLayer.backgroundColor = [UIColor blueColor].CGColor;
    [_layerView.layer addSublayer:_myLayer];
    
    CGRect buttonFram = CGRectMake(50.0f, 200, 100.0f, 50.0f);
    UIButton *changeButton = [UIButton new];
    changeButton.frame = buttonFram;
    changeButton.backgroundColor = [UIColor whiteColor];
    [changeButton setTitle:@"Chage Color" forState:UIControlStateNormal];
    [changeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [changeButton addTarget:self action:@selector(chageColor) forControlEvents:UIControlEventTouchDown];
    [_layerView addSubview:changeButton];
}

- (void)chageColor {
    //begin a new transaction
    [CATransaction begin];
    //set the animation duration to 1 second
    [CATransaction setAnimationDuration:1.0];
    //add the spin animation on completion
    [CATransaction setCompletionBlock:^{
        //rotate the layer 90 degrees
        CGAffineTransform transform = self.myLayer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_2);
        self.myLayer.affineTransform = transform;
    }];
    if (self.myLayer.backgroundColor == [UIColor blueColor].CGColor) {
        self.myLayer.backgroundColor = [UIColor whiteColor].CGColor;
        [CATransaction commit];
    } else {
        self.myLayer.backgroundColor = [UIColor blueColor].CGColor;
        [CATransaction commit];
    }

}

- (void)setupCombinationPicture {
    UIImage *image = [UIImage imageNamed:@"p_5"];
    
    CALayer *top_left = [CALayer layer];
    top_left.frame = CGRectMake(0, 100, 50, 50);
    top_left.contents = (__bridge id)image.CGImage;
    top_left.contentsGravity = kCAGravityResizeAspect;
    top_left.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    [_layerView.layer addSublayer:top_left];
    
    CALayer *top_right = [CALayer layer];
    top_right.frame = CGRectMake(0, 150, 50, 50);
    top_right.contents = (__bridge id)image.CGImage;
    top_right.contentsGravity = kCAGravityResizeAspect;
    top_right.contentsRect = CGRectMake(0.5, 0, 0.5, 1);
    [_layerView.layer addSublayer:top_right];
    
    CALayer *bottom_left = [CALayer layer];
    bottom_left.frame = CGRectMake(0, 200, 50, 50);
    bottom_left.contents = (__bridge id)image.CGImage;
    bottom_left.contentsGravity = kCAGravityResizeAspect;
    bottom_left.contentsRect = CGRectMake(0, 0.5, 0.5, 1);
    [_layerView.layer addSublayer:bottom_left];
    
    CALayer *bottom_right = [CALayer layer];
    bottom_right.frame = CGRectMake(0, 250, 50, 50);
    bottom_right.contents = (__bridge id)image.CGImage;
    bottom_right.contentsGravity = kCAGravityResizeAspect;
    bottom_right.contentsRect = CGRectMake(0.5, 1, 1, 1);
    [_layerView.layer addSublayer:bottom_right];
}

- (void)learnContentsCenter {
    UIImage *image = [UIImage imageNamed:@"img_1"];
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 100, 400, 400);
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsCenter = CGRectMake(0.5, 0.5, 1, 1);
    [_layerView.layer addSublayer:layer];
}

-(void)learnShadow {
    UIImage *image = [UIImage imageNamed:@"img_1"];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(50, 100, 200, 200);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    layer.cornerRadius = 20.f;
    
    CALayer *shawdowLayer = [CALayer layer];
    shawdowLayer.frame = CGRectMake(50, 50, 50, 50);
    shawdowLayer.cornerRadius = 25.0;
    shawdowLayer.contents = (__bridge id)image.CGImage;
    shawdowLayer.contentsGravity = kCAGravityResizeAspect;
    //shawdowLayer.masksToBounds = YES; 裁剪后会影响阴影的显示
    //shawdowLayer.shadowPath 制定任意的阴影形状
    shawdowLayer.backgroundColor = [UIColor redColor].CGColor;
    shawdowLayer.shadowOpacity = 1;
    shawdowLayer.shadowColor = [UIColor blueColor].CGColor;
    shawdowLayer.shadowOffset = CGSizeMake(10, 10);
    
    
    [layer addSublayer: shawdowLayer];
    
    [_layerView.layer addSublayer: layer];
}

- (void)learnMask {
    UIImage *image = [UIImage imageNamed:@"img_1"];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(50, 100, 200, 200);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsGravity = kCAGravityResizeAspect;
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = CGRectMake(60, 110, 100, 100);
    maskLayer.cornerRadius = 50.0;
    maskLayer.backgroundColor = [UIColor colorWithWhite:1 alpha:1].CGColor;

    layer.mask = maskLayer;
    
    [_layerView.layer addSublayer: layer];
}

- (void)learnGroupAlpha {
    //create opaque button
    UIButton *button1 = [self customButton];
    button1.center = CGPointMake(50, 150);
    [_layerView addSubview:button1];
    
    //create translucent button
    UIButton *button2 = [self customButton];
    button2.center = CGPointMake(250, 150);
    button2.alpha = 0.5;
    [_layerView addSubview:button2];
    
    //enable rasterization for the translucent button
    button2.layer.shouldRasterize = YES;
    button2.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (UIButton *)customButton
{
  //create button
  CGRect frame = CGRectMake(0, 0, 150, 50);
  UIButton *button = [[UIButton alloc] initWithFrame:frame];
  button.backgroundColor = [UIColor whiteColor];
  button.layer.cornerRadius = 10;

  //add label
  frame = CGRectMake(20, 10, 110, 30);
  UILabel *label = [[UILabel alloc] initWithFrame:frame];
  label.text = @"Hello World";
  label.textAlignment = NSTextAlignmentCenter;
  [button addSubview:label];
  return button;
}


@end
