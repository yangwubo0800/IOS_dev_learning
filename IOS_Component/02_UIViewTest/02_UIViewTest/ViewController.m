//
//  ViewController.m
//  02_UIViewTest
//
//  Created by yangwubo on 19/5/7.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//- (IBAction)onClick:(id)sender;

//@property (weak, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat labelWith = 90;
    CGFloat labelHeight = 20;
    CGFloat lableTopView = 130;
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width - labelWith)/2, lableTopView, labelWith, labelHeight)];
    
    self.label.text = @"label1";
    
    self.label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [button setTitle:@"click" forState:UIControlStateNormal];
    
    
    CGFloat buttonWith = 60;
    CGFloat buttonHeight = 20;
    CGFloat buttonTopView = 240;
    
    button.frame = CGRectMake((screen.size.width - buttonWith)/2, buttonTopView, buttonWith, buttonHeight);
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)onClick:(id)sender {
//    NSLog(@" button on click");
//    self.label.text = @"Hello, World";
//}

- (void)onClick:(id)sender {
    NSLog(@" button on click");
    self.label.text = @"Hello, World";
}

@end
