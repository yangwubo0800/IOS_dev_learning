//
//  ViewController.m
//  HelloApp
//
//  Created by yangwubo on 19/5/6.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label = [[UILabel alloc] init];
    
    label.text = @"hello, world";
    
    //[label sizeToFit];
    label.font = [UIFont systemFontOfSize:8];
    
    //label.center = self.view.center;
    label.frame = CGRectMake(30, 30, 160, 30);
    
    label.backgroundColor = [UIColor greenColor];
    
    NSLog(@" view did load RECT");
    
    [self.view addSubview:label];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
