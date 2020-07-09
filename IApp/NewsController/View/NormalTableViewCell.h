//
//  NormalTableViewCell.h
//  IApp
//
//  Created by CodeAm on 2020/7/9.
//  Copyright © 2020年 codeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListItem;
NS_ASSUME_NONNULL_BEGIN
//cell中删除按钮的代理协议
@protocol GTNormalTableViewCellDelegate <NSObject>
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;
@end

@interface NormalTableViewCell : UITableViewCell
@property (nonatomic, weak, readwrite) id<GTNormalTableViewCellDelegate> delegate;

- (void)layoutTableViewCellWithItem:(ListItem *)item;
@end

NS_ASSUME_NONNULL_END
