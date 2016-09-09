//
//  ViewController.h
//  TestForAnimation
//
//  Created by new on 16-5-18.
//  Copyright (c) 2016年 new. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *recordBackView;
@property (weak, nonatomic) IBOutlet UIImageView *albumImgView;
@property (weak, nonatomic) IBOutlet UIView *switchView;
- (IBAction)onHitBtnPlayorPause:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnPlay;
@end

