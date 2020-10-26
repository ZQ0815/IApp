//
//  ViewController.h
//  IApp
//
//  Created by CodeAm on 2020/10/15.
//  Copyright © 2020 codeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController

- (void)testBlickArg:(void (^)(Person *person))personBlock;

@end

NS_ASSUME_NONNULL_END
