//
//  ViewController.m
//  NSTimer
//
//  Created by youngstar on 16/4/20.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int secondsCountDown; //倒计时总时长
    NSTimer *countDownTimer;
    UILabel *labelText;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建UILabel 添加到当前view
    labelText=[[UILabel alloc]initWithFrame:CGRectMake(10, 120, 120, 36)];
    [self.view addSubview:labelText];
    
    //设置倒计时总时长
    secondsCountDown = 60;//60秒倒计时
    //开始倒计时
    countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES]; //启动倒计时后会每秒钟调用一次方法 timeFireMethod
    
    //设置倒计时显示的时间
    labelText.text=[NSString stringWithFormat:@"%d",secondsCountDown];
    
}

-(void)timeFireMethod{
    //倒计时-1
    secondsCountDown--;
    //修改倒计时标签现实内容
    labelText.text=[NSString stringWithFormat:@"%d",secondsCountDown];
    //当倒计时到0时，做需要的操作，比如验证码过期不能提交
    if(secondsCountDown==0){
        [countDownTimer invalidate];
        [labelText removeFromSuperview];
    }
}

@end
