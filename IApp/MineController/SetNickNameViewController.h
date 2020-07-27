//
//  SetNickNameViewController.h
//  IApp
//
//  Created by 张强 on 2020/7/27.
//  Copyright © 2020 codeam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SetNickNameViewController;

@protocol ChangeNickNameViewControllerDelegate <NSObject>

- (void)changedController:(SetNickNameViewController *)setNickNameVC didInputed: (NSString *) string;

@end

@interface SetNickNameViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, weak) id<ChangeNickNameViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
