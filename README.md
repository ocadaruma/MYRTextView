MYRTextView
===========

#### Description

A UITextView subclass that automatically resizes its frame when keyboard appears.

#### Installation

- Via [Cocoapods](http://cocoapods.org/):

```
pod 'MYRTextView', git:'https://github.com/ocadaruma/MYRTextView.git'
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
