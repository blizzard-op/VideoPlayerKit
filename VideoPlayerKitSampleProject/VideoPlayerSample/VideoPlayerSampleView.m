/* Copyright (C) 2012 IGN Entertainment, Inc. */

#import "VideoPlayerSampleView.h"

@interface VideoPlayerSampleView()

@property (nonatomic, readwrite, strong) UIView *videoPlayerView;
@property (nonatomic, readwrite, strong) UIButton *playButton;

@end

@implementation VideoPlayerSampleView

- (id)init
{
    if ((self = [super init])) {
        self.playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.playButton setTitle:@"Play Video" forState:UIControlStateNormal];
        [self addSubview:self.playButton];
        
        self.videoPlayerView = [[UIView alloc] init];
        self.videoPlayerView.autoresizesSubviews = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        [self addSubview:self.videoPlayerView];
        
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect bounds = self.bounds;
    self.playButton.frame = CGRectMake((bounds.size.width - 100)/2.0,
                                       (bounds.size.height - 50)/2.0,
                                       100,
                                       50);
    
    CGFloat videoHeight = bounds.size.width * 9 / 16;
    self.videoPlayerView.frame = CGRectMake(0, [[UIApplication sharedApplication] statusBarFrame].size.height, bounds.size.width, videoHeight);
}

@end
