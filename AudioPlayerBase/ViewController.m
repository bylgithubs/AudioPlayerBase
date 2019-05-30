//
//  ViewController.m
//  AudioPlayerBase
//
//  Created by Civet on 2019/5/28.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _playBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _playBtn.frame = CGRectMake(100, 100, 100, 40);
    [_playBtn setTitle:@"播放" forState:UIControlStateNormal];
    [_playBtn addTarget:self action:@selector(pressPlay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_playBtn];
    
    _pauseBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _pauseBtn.frame = CGRectMake(100, 160, 100, 40);
    [_pauseBtn setTitle:@"暂停" forState:UIControlStateNormal];
    [_pauseBtn addTarget:self action:@selector(pressPause) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_pauseBtn];
    
    _stopBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _stopBtn.frame = CGRectMake(100, 220, 100, 40);
    [_stopBtn setTitle:@"停止" forState:UIControlStateNormal];
    [_stopBtn addTarget:self action:@selector(presstop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_stopBtn];
    
    //创建并且设置进度条
    _musicProgress = [[UIProgressView alloc] init];
    _musicProgress.frame = CGRectMake(10, 300, 300, 20);
    _musicProgress.progress = 0;
    //创建声音控制滑动条
    _volumeSlider = [[UISlider alloc] init];
    _volumeSlider.frame = CGRectMake(10, 300, 300, 20);
    _volumeSlider.maximumValue = 100;
    _volumeSlider.minimumValue = 0;
    //调整声音时的事件函数
    [_volumeSlider addTarget:self action:@selector(volumeChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_musicProgress];
    [self.view addSubview:_volumeSlider];
    [self createAVPlayer];
    //定义一个定时器对象
    //更新进度条
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
    _player.delegate = self;
}

//当音乐播放完成时调用
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [_timer invalidate];
}

- (void)updateProgress{
    _musicProgress.progress = _player.currentTime/_player.duration;
}

//创建音频控制器
- (void)createAVPlayer{
    NSString *str = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp4"];
    NSLog(@"str======%@",str);
    //将字符转化为url
    NSURL *urlMusic = [NSURL fileURLWithPath:str];
    _player = [[AVAudioPlayer alloc]initWithContentsOfURL:urlMusic error:nil];
    //准备播放，解码工作
    [_player prepareToPlay];
    //循环次数
    //-1:无限循环
    _player.numberOfLoops =1;
    _player.volume = 0.5;
}


- (void)pressPlay{
    NSLog(@"播放音乐");
    [_player play];
}

- (void)pressPause{
    NSLog(@"暂停音乐");
    [_player pause];
}

- (void)presstop{
    NSLog(@"停止音乐");
    [_player stop];
    _player.currentTime = 0;
}

- (void)volumeChange:(UISlider *)slider{
    NSLog(@"%f",slider.value);
    //_musicProgress.progress = slider.value/100;
    _player.volume = slider.value / 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
