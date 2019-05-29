//
//  ViewController.m
//  06_Alert&ActionSheet
//
//  Created by yangwubo on 19/5/11.
//  Copyright © 2019年 yangwubo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    UIButton *alertView = [UIButton buttonWithType:UIButtonTypeSystem ];
    [alertView setTitle:@"ALERT" forState:UIControlStateNormal];
    
    CGFloat alertWidth = 100;
    CGFloat alertHeight = 30;
    CGFloat alertTopview = 100;
    
    alertView.frame = CGRectMake((screen.size.width - alertWidth)/2, alertTopview, alertWidth, alertHeight);
    
    [alertView addTarget:self action:@selector(testAlertView:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:alertView];
    
    
    UIButton *actionSheetView = [UIButton buttonWithType:UIButtonTypeSystem];
    [actionSheetView setTitle:@"action sheet" forState:UIControlStateNormal];
    
    CGFloat actionSheetTopView = 200;
    actionSheetView.frame = CGRectMake((screen.size.width - alertWidth)/2, actionSheetTopView, alertWidth, alertHeight);
    
    [actionSheetView addTarget:self action:@selector(testActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:actionSheetView];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)testActionSheet:(id)sender{
    UIAlertController *actionSheet = [[UIAlertController alloc] init];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancel");
    }];
    
    UIAlertAction *destructive = [UIAlertAction actionWithTitle:@"destructive" style:UIAlertActionStyleDestructive handler:
        ^(UIAlertAction * _Nonnull action){
        NSLog(@"Destructive ");
    }];
    
    UIAlertAction *other = [UIAlertAction actionWithTitle:@"other" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSLog(@"other");
    }];
    
    [actionSheet addAction:cancel];
    [actionSheet addAction:destructive];
    [actionSheet addAction:other];
    
    [self presentViewController:actionSheet animated:true completion:nil];
}

-(void)testAlertView:(id)sender{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"alert title" message:@"alert message" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"alert action no");
    }];
    
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"alert action yes");
    }];
    
    [alertController addAction:noAction];
    [alertController addAction:yesAction];
    
    [self presentViewController:alertController animated:true completion:nil];
}

@end
