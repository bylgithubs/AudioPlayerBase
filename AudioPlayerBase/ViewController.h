//
//  ViewController.h
//  AudioPlayerBase
//
//  Created by Civet on 2019/5/28.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import <UIKit/UIKit.h>
//导入视频音频播放系统库文件
#import "AVFoundation/AVFoundation.h"
@interface ViewController : UIViewController<AVAudioPlayerDelegate>
//播放按钮
@property(nonatomic,strong) UIButton *playBtn;
//暂停播放
@property(nonatomic,strong) UIButton *pauseBtn;
//停止播放
@property(nonatomic,strong) UIButton *stopBtn;
//音乐播放进度条视图
@property(nonatomic,strong) UIProgressView *musicProgress;
//声音大小调整滑动条
@property(nonatomic,strong) UISlider *volumeSlider;
//静音开关
@property(nonatomic,strong) UISwitch *vomumOn;
//音频播放器对象
@property(nonatomic,strong) AVAudioPlayer *player;
//定义声明一个定时器对象
@property(nonatomic,strong) NSTimer *timer;

@end

