//
//  ViewController.m
//  TestForAnimation
//
//  Created by new on 16-5-18.
//  Copyright (c) 2016年 new. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _recordBackView.layer.cornerRadius = _recordBackView.frame.size.width/2;
    _recordBackView.layer.masksToBounds = YES;
    
    _albumImgView.image = [UIImage imageNamed:@"pic.png"];
    _albumImgView.layer.cornerRadius = _albumImgView.frame.size.width/2;
    _albumImgView.layer.masksToBounds = YES;
    
    [self addTransformAnimation];
   
}

- (void)addTransformAnimation {
    CABasicAnimation * transformAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    transformAnim.toValue = @(360 * M_PI/180);
    transformAnim.duration = 10;
    transformAnim.fillMode = kCAFillModeBoth;
    transformAnim.repeatCount = MAXFLOAT;
    [_albumImgView.layer addAnimation:transformAnim forKey:@"transformAnim"];
}

- (void)addSWitchViewAnimation {
    if (_btnPlay.selected) {
        [UIView animateWithDuration:2.0 animations:^{
            _switchView.transform=CGAffineTransformMakeRotation(M_PI/2);
        }];
    } else {
        [UIView animateWithDuration:2.0 animations:^{
            _switchView.transform=CGAffineTransformMakeRotation(0 *M_PI/2);
        }];
    }
}

- (IBAction)onHitBtnPlayorPause:(id)sender {
    UIButton *btn = (UIButton *)sender;
    if (btn.selected) {
        NSLog(@"开始");
        [self addSWitchViewAnimation];
        [self recoverAnimationWithLayer:_albumImgView.layer];
    } else {
        NSLog(@"暂停");
        [self addSWitchViewAnimation];
        [self pauseAnimationWithLayer:_albumImgView.layer];
    }
    [btn setSelected:!btn.selected];
}

#pragma mark - PauseOrRecoverAnimation
- (void)pauseAnimationWithLayer:(CALayer *)layer {
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

- (void)recoverAnimationWithLayer:(CALayer *)layer {
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
