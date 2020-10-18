//
//  ViewController.h
//  IApp
//
//  Created by CodeAm on 2020/10/15.
//  Copyright © 2020 codeam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (LLTool)

- (void)addEventBlock:(void(^)(UIButton *sender))block forControlEvents:(UIControlEvents)controlEvents;

@end

@implementation UIButton (LLTool)

- (void)addEventBlock:(void(^)(UIButton *sender))block forControlEvents:(UIControlEvents)controlEvents {
    
}

@end

@interface ViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
