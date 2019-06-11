//
//  ViewController.m
//  19_IOSDebug
//
//  Created by hongbo ni on 2019/5/29.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "ViewController.h"

#define NSLog(format, ...) do { \
fprintf(stderr, "<%s : %d> %s\n", \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], \
__LINE__, __func__); \
(NSLog)((format), ##__VA_ARGS__); \
fprintf(stderr, "-------\n"); \
} while (0)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    label.text = @"debug";
    label.font = [UIFont systemFontOfSize:15];
    
    [self.view addSubview:label];
    
    
    for (int i=0; i<10; i++) {
        NSLog(@" i=%d", i);
    }
    
    UIButton *debugButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    [debugButton setTitle:@"debug title" forState:UIControlStateNormal];
    [debugButton setBackgroundColor:[UIColor blackColor]];
    [debugButton addTarget:self action:@selector(dkfjkd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:debugButton];
    
    float i= 10.0/0;
    NSLog(@"i=%f", i);
    
    
}


@end
