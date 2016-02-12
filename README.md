MYRTextView
===========

#### Description

A UITextView subclass that automatically resizes its frame when keyboard appears.

#### Installation

- Via [CocoaPods](http://cocoapods.org/):

```
platform :ios, '6.0'
pod 'MYRTextView'
```

- Manually

Copy MYRTextView.{h,m} to your project.

#### Usage

Example:
```objc
#import "ViewController.h"
#import "MYRTextView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MYRTextView *textView;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_textView registerNotification];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_textView unregisterNotification];
}
```
