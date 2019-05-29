//
//  ViewController.m
//  03_UITextFieldAndTextView
//
//  Created by yangwubo on 19/5/8.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate, UITextViewDelegate>

@property UITextView *textView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat textFieldWidth = 232;
    CGFloat textFieldHeight = 20;
    CGFloat textFieldTopView = 150;
    
    //creat text field view
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake((screen.size.width - textFieldWidth)/2, textFieldTopView, textFieldWidth, textFieldHeight)];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    textField.returnKeyType = UIReturnKeyNext;
    
    [self.view addSubview:textField];
    
    
    CGFloat textFieldGap = 30;
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width - textFieldWidth)/2, textFieldTopView - textFieldGap, 100, 30)];
    nameLabel.text = @"Name";
    [self.view addSubview:nameLabel];
    
    CGFloat textViewWidth = 232;
    CGFloat textViewHeight = 20;
    CGFloat textViewTopView = 250;
    //creat text view
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake((screen.size.width - textViewWidth)/2, textViewTopView, textViewWidth, textViewHeight)];
    self.textView.text = @"YOU ARE A liar, who covered the truth....";
    self.textView.delegate = self;
    
    [self.view addSubview:self.textView];
    
    
    UILabel *abstractLabel = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width - textViewWidth)/2, textViewTopView - textFieldGap, textViewWidth, textViewHeight)];
    abstractLabel.text = @"Abstract";
    
    [self.view addSubview:abstractLabel];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITextFieldDelegate implemetation;
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@" textFieldShouldReturn ");
    return true;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@" text field should change replacementString=%@", string);
    self.textView.text = string;
    return true;
}

#pragma mark --UITextViewDelegate implemetation;
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSLog(@" textView text=%@", text);
    return true;
}

-(void)loadView{
    [super loadView];
    NSLog(@" load view");
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    NSLog(@" view will appear");
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"view did appear");
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    NSLog(@" view will disappear");
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@" view did disappear");
}


-(void)keyboardDidShow:(NSNotification *)notif{
    NSLog(@" notification show keyboard");
}

-(void)keyboardDidHide:(NSNotification *)notif{
    NSLog(@" notification hide keyboard");
}


@end
