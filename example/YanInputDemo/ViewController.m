//
//  ViewController.m
//  YanInputDemo
//
//  Created by yutou on 15/5/29.
//  Copyright (c) 2015年 yutou. All rights reserved.
//

#import "ViewController.h"
#import "YanInputStatic.h"
#import "SYUtil.h"
@interface ViewController ()
{
    UITextView *textView;
    UIView *keyboard;
}
@end
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    textView = [[UITextView alloc] init];
    textView.backgroundColor = [UIColor blackColor];
    textView.textColor = [UIColor whiteColor];
    textView.font = [UIFont systemFontOfSize:14];
    keyboard = [YanInputStatic  getYanInputViewwithParentController:self andTextView:textView];
    [textView setInputView:keyboard];
    textView.frame = CGRectMake(5, 45, SCREEN_WIDTH-10,100);
    [self.view addSubview:textView];
    
    
    UIView *inputAccessoryView = [[UIView alloc] init];
    inputAccessoryView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
    inputAccessoryView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    inputAccessoryView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    UIButton *yanButton = [[UIButton alloc] init];
    [yanButton setTitle:@"切换到颜文字" forState:UIControlStateNormal];
    yanButton.titleLabel.font = [UIFont systemFontOfSize:13];
    yanButton.backgroundColor = [SYUtil colorWithHex:@"ed574a"];
    yanButton.frame = CGRectMake(5, 5, 90, 30);
    yanButton.layer.cornerRadius = 6;
    [yanButton addTarget:self action:@selector(toYan) forControlEvents:UIControlEventTouchDown];
    [inputAccessoryView addSubview:yanButton];
    
    UIButton *normalButton = [[UIButton alloc] init];
    [normalButton setTitle:@"切换到正常输入" forState:UIControlStateNormal];
    normalButton.frame = CGRectMake(100, 5, 120, 30);
    normalButton.titleLabel.font = [UIFont systemFontOfSize:13];
    normalButton.backgroundColor = [SYUtil colorWithHex:@"ed574a"];
    normalButton.layer.cornerRadius = 6;
    [normalButton addTarget:self action:@selector(toNormal) forControlEvents:UIControlEventTouchDown];
    [inputAccessoryView addSubview:normalButton];
    
    textView.inputAccessoryView = inputAccessoryView;
}

-(void)toYan
{
    [textView resignFirstResponder];
    [textView setInputView:keyboard];
    [textView becomeFirstResponder];
}
-(void)toNormal
{
    [textView resignFirstResponder];
    [textView setInputView:nil];
    [textView becomeFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
