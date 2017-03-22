# HATwinklingTagView

[![CocoaPods](http://img.shields.io/cocoapods/v/HATwinklingTagView.svg?style=flat)](http://cocoapods.org/?q=HATwinklingTagView)&nbsp;[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;

A flashing（twinkling）tag for iOS. 一个 iOS 的会闪烁的标签。


## Result
![Result](effect.gif)

## Use
```
NSArray *array = @[@"哇好美！",@"美翻了！",@"美美美！！！！"];

//init
HATwinklingTagView *tagView = [[HATwinklingTagView alloc]initWithWithArray:array andPoint:CGPointMake(30, 100)];

//tag text color(default is white color)
tagView.color = [UIColor whiteColor];

//add it to your view
[self.view addSubview:tagView];
```




