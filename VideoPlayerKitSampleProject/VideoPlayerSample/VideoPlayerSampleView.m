/* Copyright (C) 2012 IGN Entertainment, Inc. */

#import "VideoPlayerSampleView.h"

@interface VideoPlayerSampleView()

@property (nonatomic, weak) UIView *topView;
@property (nonatomic, weak) UIView *videoPlayerView;
@property (nonatomic, readwrite, strong) UIButton *playInFullScreenButton;
@property (nonatomic, readwrite, strong) UIButton *playInFrameButton;

@end

@implementation VideoPlayerSampleView

- (id)initWithTopView:(UIView *)topView videoPlayerView:(UIView *)videoPlayerView
{
    if ((self = [super init])) {
        self.playInFullScreenButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.playInFullScreenButton setTitle:@"Full screen" forState:UIControlStateNormal];
        [self addSubview:self.playInFullScreenButton];
        self.backgroundColor = [UIColor whiteColor];
        
        self.playInFrameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.playInFrameButton setTitle:@"In frame" forState:UIControlStateNormal];
        [self addSubview:self.playInFrameButton];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect bounds = self.bounds;
    self.playInFullScreenButton.frame = CGRectMake(bounds.size.width/4.0 - 50,
                                       (bounds.size.height - 150),
                                       100,
                                       50);
    
    self.playInFrameButton.frame = CGRectMake(bounds.size.width/4.0 * 3 - 50,
                                                   (bounds.size.height - 150),
                                                   100,
                                                   50);
    
}

@end
