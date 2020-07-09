//
//  DeleteButtonDelegateView.h
//  IApp
//
//  Created by CodeAm on 2020/7/9.
//  Copyright © 2020年 codeam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeleteButtonDelegateView : UIView
- (void)showDeleteViewFromPoint:(CGPoint)point clickButton:(dispatch_block_t) clickBlock;
@end

NS_ASSUME_NONNULL_END
