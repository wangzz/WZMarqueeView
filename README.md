#WZMarqueeView

WZMarqueeView is a marquee view used on iOS.It is a view expansion which contains a `lable`.We can custom the animation duration by setting the `duration` variable,The default `duration` value is `5.0f`.


![WZMarqueeView](WZMarqueeView.gif)


#Getting Started

**Using [CocoaPods](http://cocoapods.org)**

 1.Add the pod `WZMarqueeView` to your [Podfile](http://guides.cocoapods.org/using/the-podfile.html).
```ruby
pod 'WZMarqueeView', '~> 1.0.0'
```
 2.Run `pod install` from Terminal, then open your app's `.xcworkspace` file to launch Xcode.
 
 3.`#import WZMarqueeView.h` wherever you want to use the API.

**Manually from GitHub**

1.Download the `WZMarqueeView.h` and `WZMarqueeView.m` files in th [Source directory](https://github.com/wangzz/WZMarqueeView/tree/master/WZMarqueeView)

2.Add both files to your Xcode project.

3.`#import WZMarqueeView.h` wherever you want to use the API.

#Example Usage

**Example location**

Check out the [example project](https://github.com/wangzz/WZMarqueeView/tree/master/WZMarqueeViewDemo) included in the repository. It contains a few demos of the API in use for various scenarios. 

**Usage**

The way to create a WZMarqueeView is:

```objc
WZMarqueeView *marqueeView = [[WZMarqueeView alloc] initWithFrame:CGRectMake(60, 100, 200, 40)];
marqueeView.lable.text = @"Good good study day day up.It is a WZMarqueeView demo";
marqueeView.duration = 7.0f;
[self.view addSubview:marqueeView];
```

#License
MIT
