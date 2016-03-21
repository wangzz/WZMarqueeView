//
//  ViewController.m
//  WZMarqueeViewDemo
//
//  Created by wangzz on 14-3-2.
//  Copyright (c) 2014年 foogry. All rights reserved.
//

#import "ViewController.h"
#import "WZMarqueeView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    WZMarqueeView *marqueeView = [[WZMarqueeView alloc] initWithFrame:CGRectMake(60, 100, 200, 40)];
    marqueeView.lable.text = @"Good good study day day up.It is a WZMarqueeView demo";
    marqueeView.duration = 7.0f;
    marqueeView.backgroundColor = [UIColor whiteColor];
    [marqueeView showInView:self.view];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
