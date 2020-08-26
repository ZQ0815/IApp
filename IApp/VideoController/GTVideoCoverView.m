//
//  GTVideoCoverView.m
//  IApp
//
//  Created by 张强 on 2020/8/10.
//  Copyright © 2020 codeam. All rights reserved.
//

#import "GTVideoCoverView.h"
#import "GTVideoPlayer.h"

@interface GTVideoCoverView ()
@property (nonatomic, strong, readwrite) UIImageView *coverView;
@property (nonatomic, strong, readwrite) UIImageView *playButton;
@property (nonatomic, copy, readwrite) NSString *videoUrl;
@end

@implementation GTVideoCoverView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpSubView];
        [self logicSettings];
    }
    return self;
}

- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl{
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
}

#pragma mark - ui
- (void)setUpSubView {
    [self addSubview:[self coverView]];
    //[_coverView addSubview:[self playButton]];
}

- (UIImageView *)coverView {
    if (!_coverView) {
        _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    }
    return _coverView;
}

- (UIImageView *)playButton {
    if (!_playButton) {
        _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - 50) / 2, (self.frame.size.height - 50) / 2, 50, 50)];
        _playButton.image = [UIImage imageNamed:@"player.jpeg"];
    }
    return _playButton;
}

#pragma mark - logic

- (void)logicSettings {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
    [self addGestureRecognizer:tapGesture];
}

- (void)_tapToPlay {
    //在当前Item上播放视频
    [[GTVideoPlayer Player] playVideoWithUrl:_videoUrl attachView:_coverView];
}

@end
