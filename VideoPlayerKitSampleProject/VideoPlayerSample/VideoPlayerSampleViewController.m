/* Copyright (C) 2012 IGN Entertainment, Inc. */

#import "VideoPlayerSampleViewController.h"
#import "VideoPlayerSampleView.h"

#define LABEL_PADDING 10

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
        UILabel *topViewLabel = [[UILabel alloc] initWithFrame:CGRectMake(LABEL_PADDING, 10, 200, 40.0)];
        topViewLabel.text = @"Top View Label";
        topViewLabel.textColor = [UIColor whiteColor];
        [_topView addSubview:topViewLabel];
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
    self.videoPlayerSampleView = [[VideoPlayerSampleView alloc] init];
    [self.videoPlayerSampleView.playButton addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
    [self setView:self.videoPlayerSampleView];
}

- (void)playVideo
{
    NSURL *url = [NSURL URLWithString:@"https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8"];
    
    if (!self.videoPlayerViewController) {
        self.videoPlayerViewController = [VideoPlayerKit videoPlayerWithContainingViewController:self optionalTopView:_topView hideTopViewWithControls:YES];
        // Need to set edge inset if top view is inserted
        [self.videoPlayerViewController setControlsEdgeInsets:UIEdgeInsetsMake(self.topView.frame.size.height, 0, 0, 0)];
        self.videoPlayerViewController.delegate = self;
        self.videoPlayerViewController.allowPortraitFullscreen = YES;
    }
    
    [self.view addSubview:self.videoPlayerViewController.view];
    
    [self.videoPlayerViewController playVideoWithTitle:@"Video Title" URL:url videoID:nil shareURL:nil isStreaming:NO playInFullScreen:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.topView.frame = CGRectMake(0, [[UIApplication sharedApplication] statusBarFrame].size.height, self.view.bounds.size.width, 44);
}

@end
