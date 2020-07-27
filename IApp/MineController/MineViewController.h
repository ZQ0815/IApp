//
//  MineControllerViewController.h
//  IApp
//
//  Created by 张强 on 2020/7/25.
//  Copyright © 2020 codeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetNickNameViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MineViewController : UIViewController<ChangeNickNameViewControllerDelegate>

- (void)changedController:(SetNickNameViewController *)setNickNameVC didInputed: (NSString *) string;

@end

NS_ASSUME_NONNULL_END
