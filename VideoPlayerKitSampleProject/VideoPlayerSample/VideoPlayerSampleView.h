/* Copyright (C) 2012 IGN Entertainment, Inc. */

#import <UIKit/UIKit.h>

@interface VideoPlayerSampleView : UIView

@property (nonatomic, readonly, strong) UIButton *playButton;
- (id)initWithTopView:(UIView *)topView videoPlayerView:(UIView *)videoPlayerView;

@end
