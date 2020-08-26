//
//  GTVideoCoverView.h
//  IApp
//
//  Created by 张强 on 2020/8/10.
//  Copyright © 2020 codeam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoCoverView : UICollectionViewCell
/**
 根据数据布局，封面图&播放 url
 */
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl;
@end

NS_ASSUME_NONNULL_END
