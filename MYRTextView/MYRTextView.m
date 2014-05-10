//
//  MYRTextView.m
//  Pods
//
//  Created by okada haruki on 5/10/14.
//
//

#import "MYRTextView.h"

@interface MYRTextView ()

@property (nonatomic) CGRect originalFrame;

@end

@implementation MYRTextView

- (void)registerNotification
{
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [center addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)unregisterNotification
{
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [center removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notif
{
    //save current frame
    self.originalFrame = self.frame;
    
    //get root of view hierarchy
    UIView* rootView = self;
    while (rootView.superview) {
        rootView = rootView.superview;
    }
    
    //get keyboard frame
    CGRect keyboardFrame = [rootView convertRect:
                            [[[notif userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue] fromView:nil];
    
    CGRect frameToRootView = [self convertRect:self.bounds toView:rootView];
    
    CGFloat newHeight = rootView.frame.size.height -
                            (keyboardFrame.size.height + frameToRootView.origin.y);
    
    //if keyboard and textView doesn't intersect or
    //keyboard covers textView all,
    //no need to resize.
    if (!CGRectIntersectsRect(keyboardFrame, frameToRootView) || newHeight <= 0) {
        return;
    }
    
    CGRect newFrameToRootView = CGRectMake(frameToRootView.origin.x,
                                           frameToRootView.origin.y,
                                           self.frame.size.width, newHeight);
    
    CGRect newFrame = [rootView convertRect:newFrameToRootView toView:self.superview];
    
    [UIView animateWithDuration:[[[notif userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue] animations:^{
        self.frame = newFrame;
    }];
}

- (void)keyboardWillHide:(NSNotification *)notif
{
    self.frame = _originalFrame;
}

@end
