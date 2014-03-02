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
    
    WZMarqueeView *marqueeView = [[WZMarqueeView alloc] initWithFrame:CGRectMake(0, 100, 200, 40)];
    marqueeView.backgroundColor = [UIColor grayColor];
    marqueeView.lable.text = @"good good study day dya up.11good good study day dya up.22good good study day dya up.33";
    [self.view addSubview:marqueeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
