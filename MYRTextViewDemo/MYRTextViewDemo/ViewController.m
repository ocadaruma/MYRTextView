//
//  ViewController.m
//  MYRTextViewDemo
//
//  Created by okada haruki on 5/10/14.
//  Copyright (c) 2014 Okada Haruki. All rights reserved.
//

#import "ViewController.h"
#import <MYRTextView.h>

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tap:(id)sender
{
    [_textView resignFirstResponder];
}

@end
