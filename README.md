MYRTextView
===========

#### Description

A UITextView subclass that automatically resizes its frame when keyboard appears.

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
