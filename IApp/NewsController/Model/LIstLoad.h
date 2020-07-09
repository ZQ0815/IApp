//
//  LIstLoad.h
//  IApp
//
//  Created by CodeAm on 2020/7/9.
//  Copyright © 2020年 codeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListItem;

typedef void(^ListLoaderFinishBlock)(BOOL success, NSArray<ListItem *> *dataArray);

NS_ASSUME_NONNULL_BEGIN

@interface LIstLoad : NSObject

- (void)loadListDataWithFinishBlock:(ListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
