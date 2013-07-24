/* Copyright (C) 2012 IGN Entertainment, Inc. */

#import <UIKit/UIKit.h>

@interface VideoPlayerSampleView : UIView

@property (nonatomic, readonly, strong) UIButton *playinFullScreenButton;
@property (nonatomic, readonly, strong) UIButton *playInFrameButton;
@property (nonatomic, readonly, strong) UIButton *stopButton;
- (id)initWithTopView:(UIView *)topView videoPlayerView:(UIView *)videoPlayerView;

@end
