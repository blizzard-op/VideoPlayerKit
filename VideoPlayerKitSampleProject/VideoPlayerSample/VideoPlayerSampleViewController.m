/* Copyright (C) 2012 IGN Entertainment, Inc. */

#import "VideoPlayerSampleViewController.h"
#import "VideoPlayerSampleView.h"

@interface VideoPlayerSampleViewController ()

@property (nonatomic, strong) VideoPlayerKit *videoPlayerViewController;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) VideoPlayerSampleView *videoPlayerSampleView;
@end

@implementation VideoPlayerSampleViewController

- (id)init
{
    if ((self = [super init])) {
        
        // Optional Top View
        _topView = [[UIView alloc] init];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(0, 0, 200, 40.0);
        [button addTarget:self
                   action:@selector(fullScreen)
         forControlEvents:UIControlEventTouchDown];
        
        [button setTitle:@"Full Screen!" forState:UIControlStateNormal];
        [_topView addSubview:button];
    }
    return self;
}

// Fullscreen / minimize without need for user's input
- (void)fullScreen
{
    if (!self.videoPlayerViewController.fullScreenModeToggled) {
        [self.videoPlayerViewController launchFullScreen];
    } else {
        [self.videoPlayerViewController minimizeVideo];
    }
}

- (void)loadView
{
    self.videoPlayerSampleView = [[VideoPlayerSampleView alloc] initWithTopView:nil videoPlayerView:nil];
    [self.videoPlayerSampleView.playButton addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
    [self setView:self.videoPlayerSampleView];
}

- (void)playVideo
{
    NSURL *url = [NSURL URLWithString:@"http://ignhdvod-f.akamaihd.net/i/assets.ign.com/videos/zencoder/,416/d4ff0368b5e4a24aee0dab7703d4123a-110000,640/d4ff0368b5e4a24aee0dab7703d4123a-500000,640/d4ff0368b5e4a24aee0dab7703d4123a-1000000,960/d4ff0368b5e4a24aee0dab7703d4123a-2500000,1280/d4ff0368b5e4a24aee0dab7703d4123a-3000000,-1354660143-w.mp4.csmil/master.m3u8"];
    
    if (!self.videoPlayerViewController) {
        self.videoPlayerViewController = [VideoPlayerKit videoPlayerWithContainingViewController:self optionalTopView:_topView hideTopViewWithControls:YES];
        // Need to set edge inset if top view is inserted
        [self.videoPlayerViewController setControlsEdgeInsets:UIEdgeInsetsMake(self.topView.frame.size.height, 0, 0, 0)];
        self.videoPlayerViewController.delegate = self;
        self.videoPlayerViewController.allowPortraitFullscreen = YES;
    }
    
    [self.view addSubview:self.videoPlayerViewController.view];
    
    [self.videoPlayerViewController playVideoWithTitle:@"Title" URL:url videoID:nil shareURL:nil isStreaming:NO playInFullScreen:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.topView.frame = CGRectMake(0, [[UIApplication sharedApplication] statusBarFrame].size.height, self.view.bounds.size.width, 44);
}

@end
