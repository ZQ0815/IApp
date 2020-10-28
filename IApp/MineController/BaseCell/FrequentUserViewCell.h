//
//  FrequentUserViewCell.h
//  IApp
//
//  Created by 张强 on 2020/10/26.
//  Copyright © 2020 codeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FrequentUserViewCell;

NS_ASSUME_NONNULL_BEGIN

@protocol FrequentUserViewCellDelegate <NSObject>

- (void)manageFrequentUserViewCell:(FrequentUserViewCell *)cell deleteWithUserIndex:(NSInteger) index;

@end

@interface FrequentUserViewCell : UITableViewCell

@property(nonatomic, weak) id<FrequentUserViewCellDelegate> delegate;

- (void)bindData:(NSInteger)cellNums;

@end

NS_ASSUME_NONNULL_END
