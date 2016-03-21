//
//  WZMarqueeView.m
//  WZMarqueeViewDemo
//
//  Created by wangzz on 14-3-2.
//  Copyright (c) 2014年 foogry. All rights reserved.
//

#ifndef WZ_SYSTEM_VERSION_LESS_THAN
#define WZ_SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#endif

#import "WZMarqueeView.h"

@implementation WZMarqueeView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.masksToBounds = YES;
        
        _duration = 5.0f;
        _lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:_lable];
        
        [_lable addObserver:self
                 forKeyPath:@"text"
                    options:NSKeyValueObservingOptionNew
                    context:nil];
    }
    return self;
}

- (void)dealloc {
    [_lable removeObserver:self forKeyPath:@"text" context:nil];
}

- (void)layoutSubviews {
    _lable.frame = CGRectMake(0, 0, _lable.frame.size.width, self.frame.size.height);
}

#pragma mark - KVO

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void*)context {
    if ([keyPath isEqualToString:@"text"]) {
        NSString *text = [change valueForKey:NSKeyValueChangeNewKey];
        if ((text == nil) || (text.length <= 0)) {
            return;
        }
        
        CGSize size = [self sizeWithFont:_lable.font string:text];
        CGRect  newFrame = _lable.frame;
        newFrame.size.width = size.width;
        _lable.frame = newFrame;
    }
}

#pragma mark - Public

- (void)showInView:(UIView *)view {
    if (!view || ![view isKindOfClass:[UIView class]]) {
        return;
    }
    
    if (![view.subviews containsObject:self]) {
        [view addSubview:self];
    }
    
    [self performSelector:@selector(startAnimation)
               withObject:nil
               afterDelay:0.5f];
}

#pragma mark - Private

- (CGSize)sizeWithFont:(UIFont *)font string:(NSString *)string {
    CGSize  size;
    if (WZ_SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        size = [string sizeWithFont:font
                  constrainedToSize:CGSizeMake(1000, 200)
                      lineBreakMode:0];
    } else {
        NSDictionary * attDic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
        size = [string boundingRectWithSize:CGSizeMake(1000, 200)
                                    options:NSStringDrawingUsesLineFragmentOrigin
                                 attributes:attDic
                                    context:nil].size;
    }
    
    return size;
}

- (void)startAnimation {
    if ((_lable.text.length <= 0) || (_lable.frame.size.width <= self.frame.size.width)) {
        return;
    }
    
    [UIView animateWithDuration:_duration delay:0.0f options:UIViewAnimationOptionCurveLinear animations:^{
        CGRect lableFrame = _lable.frame;
        if (lableFrame.origin.x == 0) {
            lableFrame.origin.x = -(lableFrame.size.width - self.frame.size.width);
        } else if (lableFrame.origin.x < 0) {
            lableFrame.origin.x = 0;
        }
        
        [_lable setFrame:lableFrame];
    } completion:^(BOOL finished) {
        [self performSelector:@selector(startAnimation)
                   withObject:nil
                   afterDelay:0.5f];
    }];
}


@end
