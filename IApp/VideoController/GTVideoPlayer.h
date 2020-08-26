//
//  GTVideoPlayer.h
//  IApp
//
//  Created by 张强 on 2020/8/10.
//  Copyright © 2020 codeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoPlayer : NSObject
/**
 全局播放器单例
 */
+ (GTVideoPlayer *)Player;

/**
 在指定View上 通过url播放视频
 */
- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView;
@end

NS_ASSUME_NONNULL_END
