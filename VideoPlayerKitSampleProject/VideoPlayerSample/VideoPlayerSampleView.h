/* Copyright (C) 2012 IGN Entertainment, Inc. */

#import <UIKit/UIKit.h>

@interface VideoPlayerSampleView : UIView

@property (nonatomic, readonly, strong) UIButton *playInFullScreenButton;
@property (nonatomic, readonly, strong) UIButton *playInFrameButton;
- (id)initWithTopView:(UIView *)topView videoPlayerView:(UIView *)videoPlayerView;

@end
